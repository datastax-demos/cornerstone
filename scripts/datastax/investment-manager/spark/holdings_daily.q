INSERT overwrite TABLE stocks.holdings_daily
SELECT portfolio_id, from_unixtime(unix_timestamp(TO_DATE(from_unixtime(unix_timestamp())), 'yyyy-MM-dd')), symbol, quantity, quantity
FROM stocks.holdings;

INSERT overwrite TABLE stocks.portfolio_daily
SELECT portfolio_id, TO_DATE(from_unixtime(unix_timestamp())), sum(h.quantity * sl.lasttradepriceonly), sum(h.quantity * sl.lasttradepriceonly)
FROM stocks.holdings h
	JOIN stocks.stock_listing sl
		ON h.symbol = sl.symbol
GROUP BY portfolio_id, TO_DATE(from_unixtime(unix_timestamp()))
