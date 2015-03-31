DROP TABLE IF EXISTS stocks.run_time;
CREATE TABLE stocks.run_time(
        run timestamp);

INSERT overwrite table stocks.run_time
SELECT FROM_unixtime(unix_timestamp()) FROM stocks.dummy;

INSERT overwrite table stocks.holdings_daily
SELECT hd.portfolio_id, hd.lasttradeday, hd.symbol, hd.current_quantity+c.quantity, hd.original_quantity
FROM stocks.correction c
  JOIN stocks.run_time rt
    ON c.status = 'PENDING'
  JOIN stocks.holdings_daily hd
    ON hd.portfolio_id = c.portfolio_id
    AND hd.symbol = c.symbol
WHERE c.correction_date <= rt.run
AND hd.lasttradeday >= TO_DATE(c.effective_date);


INSERT overwrite table stocks.portfolio_daily
SELECT hd.portfolio_id, hd.lasttradeday, sum(hd.current_quantity * coalesce(qd.lasttradepriceonly, 1.0)), sum(hd.original_quantity * coalesce(qd.lasttradepriceonly,1.0))
FROM stocks.holdings_daily hd
  left outer JOIN stocks.quote_daily qd
    ON hd.symbol = qd.symbol
    AND hd.lasttradeday = qd.lasttradeday
  JOIN stocks.correction c
    ON hd.portfolio_id = c.portfolio_id
    AND hd.symbol = c.symbol
  JOIN stocks.run_time rt
    ON c.status = 'PENDING'
WHERE c.correction_date <= rt.run
GROUP BY hd.portfolio_id, hd.lasttradeday;


INSERT overwrite table stocks.correction
SELECT c.portfolio_id, c.correction_date, c.effective_date, c.quantity, 'COMPLETE', c.symbol
FROM stocks.correction c
JOIN stocks.run_time rt
ON c.status = 'PENDING'
WHERE c.correction_date <= rt.run;

DROP TABLE IF EXISTS stocks.run_time;
