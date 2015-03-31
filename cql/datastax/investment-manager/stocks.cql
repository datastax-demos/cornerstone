CREATE KEYSPACE stocks WITH replication = {
  'class': 'NetworkTopologyStrategy',
  'Analytics': '3'
};

CREATE TABLE stocks.correction (
  portfolio_id timeuuid,
  correction_date timestamp,
  symbol text,
  effective_date timestamp,
  quantity double,
  status text,
  PRIMARY KEY ((portfolio_id), correction_date, symbol)
) WITH CLUSTERING ORDER BY (correction_date DESC, symbol ASC);

CREATE TABLE stocks.dummy (
  id int,
  val text,
  PRIMARY KEY ((id))
);

CREATE TABLE stocks.holdings (
  portfolio_id timeuuid,
  symbol text,
  quantity double,
  PRIMARY KEY ((portfolio_id), symbol)
);

CREATE TABLE stocks.holdings_daily (
  portfolio_id timeuuid,
  lasttradeday timestamp,
  symbol text,
  current_quantity double,
  original_quantity double,
  PRIMARY KEY ((portfolio_id), lasttradeday, symbol)
);

CREATE TABLE stocks.portfolio (
  email_address text,
  portfolio_id timeuuid,
  description text,
  invested double,
  value double,
  valuedt timestamp,
  PRIMARY KEY ((email_address), portfolio_id)
) WITH CLUSTERING ORDER BY (portfolio_id DESC);

CREATE TABLE stocks.portfolio_daily (
  portfolio_id timeuuid,
  lasttradeday timestamp,
  current_value double,
  original_value double,
  PRIMARY KEY ((portfolio_id), lasttradeday)
) WITH CLUSTERING ORDER BY (lasttradeday DESC);

CREATE TABLE stocks.quote (
  symbol text,
  lasttradedate timestamp,
  ask double,
  averagedailyvolume double,
  bid double,
  bookvaluepershare double,
  change double,
  changefromfiftydaymovingaverage double,
  changefromtwohundreddaymovingaverage double,
  changefromyearhigh double,
  changefromyearlow double,
  changeinpercent double,
  changeinpercentfromyearhigh double,
  dayshigh double,
  dayslow double,
  dilutedeps double,
  dividendpaydate timestamp,
  ebitda double,
  ema_10day double,
  ema_5day double,
  epsestimatecurrentyear double,
  epsestimatenextquarter double,
  epsestimatenextyear double,
  exdividenddate double,
  fiftydaymovingaverage double,
  lasttradeday timestamp,
  lasttradepriceonly double,
  lasttradetime text,
  lowlimit double,
  ma_10day double,
  ma_5day double,
  marketcapitalization text,
  name text static,
  oneyrtargetprice double,
  open double,
  pegratio double,
  peratio double,
  percentchangefromfiftydaymovingaverage double,
  percentchangefromtwohundreddaymovingaverage double,
  percentchangefromyearlow double,
  previousclose double,
  pricebook double,
  priceepsestimatecurrentyear double,
  priceepsestimatenextyear double,
  pricepaid double,
  pricesales double,
  revenue double,
  tradedate timestamp,
  trailingannualdividendyield double,
  trailingannualdividendyieldinpercent double,
  twohundreddaymovingaverage double,
  volume double,
  yearhigh double,
  yearlow double,
  PRIMARY KEY ((symbol), lasttradedate)
) WITH CLUSTERING ORDER BY (lasttradedate DESC) AND
  default_time_to_live=2592000;

CREATE TABLE stocks.quote_daily (
  symbol text,
  lasttradeday timestamp,
  ask double,
  averagedailyvolume double,
  bid double,
  bookvaluepershare double,
  change double,
  changefromfiftydaymovingaverage double,
  changefromtwohundreddaymovingaverage double,
  changefromyearhigh double,
  changefromyearlow double,
  changeinpercent double,
  changeinpercentfromyearhigh double,
  dayshigh double,
  dayslow double,
  dilutedeps double,
  dividendpaydate timestamp,
  ebitda double,
  ema_10day double,
  ema_5day double,
  epsestimatecurrentyear double,
  epsestimatenextquarter double,
  epsestimatenextyear double,
  exdividenddate double,
  fiftydaymovingaverage double,
  lasttradedate timestamp,
  lasttradepriceonly double,
  lasttradetime text,
  lowlimit double,
  ma_10day double,
  ma_5day double,
  marketcapitalization text,
  name text static,
  oneyrtargetprice double,
  open double,
  pegratio double,
  peratio double,
  percentchangefromfiftydaymovingaverage double,
  percentchangefromtwohundreddaymovingaverage double,
  percentchangefromyearlow double,
  previousclose double,
  pricebook double,
  priceepsestimatecurrentyear double,
  priceepsestimatenextyear double,
  pricepaid double,
  pricesales double,
  revenue double,
  tradedate timestamp,
  trailingannualdividendyield double,
  trailingannualdividendyieldinpercent double,
  twohundreddaymovingaverage double,
  volume double,
  yearhigh double,
  yearlow double,
  PRIMARY KEY ((symbol), lasttradeday)
) WITH CLUSTERING ORDER BY (lasttradeday DESC);

CREATE TABLE stocks.quote_history (
  symbol text,
  lasttradeday timestamp,
  lasttradedate timestamp,
  ask double,
  averagedailyvolume double,
  bid double,
  bookvaluepershare double,
  change double,
  changefromfiftydaymovingaverage double,
  changefromtwohundreddaymovingaverage double,
  changefromyearhigh double,
  changefromyearlow double,
  changeinpercent double,
  changeinpercentfromyearhigh double,
  dayshigh double,
  dayslow double,
  dilutedeps double,
  dividendpaydate timestamp,
  ebitda double,
  ema_10day double,
  ema_5day double,
  epsestimatecurrentyear double,
  epsestimatenextquarter double,
  epsestimatenextyear double,
  exdividenddate double,
  fiftydaymovingaverage double,
  lasttradepriceonly double,
  lasttradetime text,
  lowlimit double,
  ma_10day double,
  ma_5day double,
  marketcapitalization text,
  name text static,
  oneyrtargetprice double,
  open double,
  pegratio double,
  peratio double,
  percentchangefromfiftydaymovingaverage double,
  percentchangefromtwohundreddaymovingaverage double,
  percentchangefromyearlow double,
  previousclose double,
  pricebook double,
  priceepsestimatecurrentyear double,
  priceepsestimatenextyear double,
  pricepaid double,
  pricesales double,
  revenue double,
  tradedate timestamp,
  trailingannualdividendyield double,
  trailingannualdividendyieldinpercent double,
  twohundreddaymovingaverage double,
  volume double,
  yearhigh double,
  yearlow double,
  PRIMARY KEY ((symbol, lasttradeday), lasttradedate)
) WITH CLUSTERING ORDER BY (lasttradedate DESC);

CREATE TABLE stocks.quote_load_rules (
  node text,
  load int,
  zid_begin int,
  zid_end int,
  PRIMARY KEY ((node), load)
);

CREATE TABLE stocks.quote_loader (
  node text,
  load int,
  symbol text,
  PRIMARY KEY ((node, load), symbol)
);

CREATE TABLE stocks.session (
  session_id timeuuid,
  email_address text,
  name text,
  PRIMARY KEY ((session_id))
) WITH default_time_to_live=900;

CREATE TABLE stocks.session_history (
  email_address text,
  session_id timeuuid,
  activity counter,
  PRIMARY KEY ((email_address), session_id)
) WITH CLUSTERING ORDER BY (session_id DESC);

CREATE TABLE stocks.stock_listing (
  symbol text,
  exchange text,
  industry text,
  lasttradedate timestamp,
  lasttradepriceonly double,
  marketcap text,
  name text,
  sector text,
  solr_query text,
  zid int,
  PRIMARY KEY ((symbol))
);

CREATE CUSTOM INDEX stocks_stock_listing_exchange_index ON stocks.stock_listing (exchange) USING 'com.datastax.bdp.search.solr.Cql3SolrSecondaryIndex';

CREATE CUSTOM INDEX stocks_stock_listing_industry_index ON stocks.stock_listing (industry) USING 'com.datastax.bdp.search.solr.Cql3SolrSecondaryIndex';

CREATE CUSTOM INDEX stocks_stock_listing_lasttradedate_index ON stocks.stock_listing (lasttradedate) USING 'com.datastax.bdp.search.solr.Cql3SolrSecondaryIndex';

CREATE CUSTOM INDEX stocks_stock_listing_lasttradepriceonly_index ON stocks.stock_listing (lasttradepriceonly) USING 'com.datastax.bdp.search.solr.Cql3SolrSecondaryIndex';

CREATE CUSTOM INDEX stocks_stock_listing_marketcap_index ON stocks.stock_listing (marketcap) USING 'com.datastax.bdp.search.solr.Cql3SolrSecondaryIndex';

CREATE CUSTOM INDEX stocks_stock_listing_name_index ON stocks.stock_listing (name) USING 'com.datastax.bdp.search.solr.Cql3SolrSecondaryIndex';

CREATE CUSTOM INDEX stocks_stock_listing_sector_index ON stocks.stock_listing (sector) USING 'com.datastax.bdp.search.solr.Cql3SolrSecondaryIndex';

CREATE CUSTOM INDEX stocks_stock_listing_solr_query_index ON stocks.stock_listing (solr_query) USING 'com.datastax.bdp.search.solr.Cql3SolrSecondaryIndex';

CREATE CUSTOM INDEX stocks_stock_listing_zid_index ON stocks.stock_listing (zid) USING 'com.datastax.bdp.search.solr.Cql3SolrSecondaryIndex';

CREATE TABLE stocks.stock_listing2 (
  exchange text,
  symbol text,
  industry text,
  lasttradedate timestamp,
  lasttradepriceonly double,
  marketcap text,
  name text,
  sector text,
  zid int,
  PRIMARY KEY ((exchange), symbol)
);

CREATE TABLE stocks.transaction (
  portfolio_id timeuuid,
  transaction_id timeuuid,
  amount double,
  effective_date timestamp,
  price double,
  quantity double,
  symbol text,
  PRIMARY KEY ((portfolio_id), transaction_id)
) WITH CLUSTERING ORDER BY (transaction_id DESC);

CREATE TABLE stocks.user (
  email_address text,
  name text,
  password_hash text,
  PRIMARY KEY ((email_address))
);
