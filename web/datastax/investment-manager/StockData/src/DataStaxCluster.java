
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.apache.commons.lang.time.DateUtils;
import com.datastax.driver.core.BatchStatement;
import com.datastax.driver.core.Cluster;
import com.datastax.driver.core.PreparedStatement;
import com.datastax.driver.core.ResultSet;
import com.datastax.driver.core.Row;
import com.datastax.driver.core.Session;
import com.datastax.driver.core.Cluster.Builder;
import com.datastax.driver.core.querybuilder.Insert;
import com.datastax.driver.core.querybuilder.QueryBuilder;
import com.datastax.driver.core.utils.UUIDs;
import com.google.gson.Gson;


public class DataStaxCluster {
	private String node;
	private String keyspace;
	private Cluster cluster;
	private Session session;
	
	private PreparedStatement psWriteLastTrade;
	private PreparedStatement psGetSession;
	private PreparedStatement psGetUser;
	private PreparedStatement psWriteUser;
	private PreparedStatement psWriteSession;
	private PreparedStatement psActivity;
	private PreparedStatement psGetPortfolios;
	private PreparedStatement psGetPortfolio;
	private PreparedStatement psSavePortfolio;
	private PreparedStatement psUpdatePortfolio;
	private PreparedStatement psGetHoldings;
	private PreparedStatement psGetHolding;
	private PreparedStatement psNewPosition;
	private PreparedStatement psUpdatePosition;
	private PreparedStatement psWriteTransaction;
	private PreparedStatement psGetTransactions;
	private PreparedStatement psGetHistory;
	private PreparedStatement psGetPrice;
	private PreparedStatement psGetLatestPrice;
	private PreparedStatement psGetSymbols;
	private PreparedStatement psSearchSymbol;
	private PreparedStatement psGetCorrections;
	private PreparedStatement psDailyHoldings;
	private PreparedStatement psWriteCorrection;
	private PreparedStatement psDeletePosition;
	private PreparedStatement psGetQuote;
	
	private void prepare(){
		psGetQuote = session.prepare("select * from quote where symbol = ? LIMIT ?");
		psWriteLastTrade = session.prepare("insert into stock_listing(symbol, lasttradedate, lasttradepriceonly) values(?, ?, ?)");
		psGetSession = session.prepare("select * from session where session_id = ?");
		psGetUser = session.prepare("select * from user where email_address = ?");
		psWriteUser = session.prepare("insert into user(email_address, name, password_hash) values(?, ?, ?)");
		psWriteSession = session.prepare("insert into session(session_id, email_address, name) values(?, ?, ?)");
		psActivity = session.prepare("update session_history set activity = activity + 1 where session_id=? and email_address=?");
		psGetPortfolios = session.prepare("select email_address, portfolio_id, description, invested, value, valuedt, dateOf(portfolio_id) as created from portfolio where email_address = ?");
		psGetPortfolio = session.prepare("select email_address, portfolio_id, description, invested, value, valuedt, dateOf(portfolio_id) as created from portfolio where email_address = ? and portfolio_id = ?");			
		psSavePortfolio = session.prepare("insert into portfolio(email_address, portfolio_id, description, invested, value, valuedt) values (?, ?, ?, ?, ?, ?)");
		psUpdatePortfolio = session.prepare("update portfolio set description = ? where email_address = ? and portfolio_id = ?");
		psGetHoldings = session.prepare("select * from holdings where portfolio_id = ?");
		psGetTransactions = session.prepare("select portfolio_id, transaction_id, dateof(transaction_id) as transaction_date, amount, effective_date, price, quantity, symbol from transaction where portfolio_id = ?");
		psGetHolding = session.prepare("select quantity from holdings where portfolio_id = ? and symbol = ?");
		psNewPosition = session.prepare("insert into holdings(portfolio_id, symbol, quantity) values(?, ?, ?) IF NOT EXISTS");
		psUpdatePosition = session.prepare("update holdings set quantity = ? where portfolio_id = ? and symbol = ? IF quantity = ?");
		psDeletePosition = session.prepare("delete from holdings where portfolio_id = ? and symbol = ? IF quantity = ?");
		psWriteTransaction = session.prepare("insert into transaction(portfolio_id, transaction_id, amount, effective_date, price, quantity, symbol) values(?, ?, ?, ?, ?, ?, ?)");
		psGetPrice = session.prepare("select lasttradepriceonly from quote_history where symbol = ? and lasttradeday = ? and lasttradedate <= ? limit 1");
		psGetSymbols = session.prepare("select symbol from quote_loader where node=? and load=?");
		psSearchSymbol = session.prepare("select * from stock_listing where solr_query = ? limit ?");
		psGetLatestPrice = session.prepare("select lasttradepriceonly from stock_listing where symbol = ?");
		psGetHistory = session.prepare("select * from portfolio_daily where portfolio_id = ?");
		psGetCorrections = session.prepare("select * from correction where portfolio_id = ?");
		psDailyHoldings = session.prepare("select symbol from holdings_daily where portfolio_id = ? and lasttradeday >= ? limit 1");
		psWriteCorrection = session.prepare("insert into correction(portfolio_id, correction_date, effective_date, quantity, status, symbol) values(?, ?, ?, ?, ?, ?)");
	}	
	
	public String getNode() {
		return node;
	}

	public void setNode(String node) {
		this.node = node;
	}

	public String getKeyspace() {
		return keyspace;
	}

	public void setKeyspace(String keyspace) {
		this.keyspace = keyspace;
	}

	public Cluster getCluster() {
		return cluster;
	}

	public void setCluster(Cluster cluster) {
		this.cluster = cluster;
	}

	public Session getSession() {
		return session;
	}

	public void setSession(Session session) {
		this.session = session;
	}

	public DataStaxCluster(String node, String keyspace){
		setNode(node);
		setKeyspace(keyspace);
		
		connect();
		prepare();
	}
	
	public void connect() {
		Builder builder = Cluster.builder();
		builder.addContactPoints(node);
		cluster = builder.build();
		session = cluster.connect(keyspace);
	}
	
	public void writeTickData(Quote q){
		if (q.Symbol != null && q.LastTradeDate != null && q.LastTradeTime != null){	
			BatchStatement bs = new BatchStatement(BatchStatement.Type.UNLOGGED);
			bs.add(insertQuote(q, "quote"));
			bs.add(insertQuote(q, "quote_history"));
			bs.add(insertQuote(q, "quote_daily"));
			bs.add(psWriteLastTrade.bind(q.Symbol, q.LastTradeDate, q.LastTradePriceOnly.getValue()));
			session.execute(bs);				
		}
	}
	
	//handles inserting the same data multiple times with different partition keys & TTL values
	private Insert insertQuote(Quote q, String tablename){
		Insert insert = QueryBuilder.insertInto(tablename);
		if (q.Ask.exists()) insert.value("Ask", q.Ask.getValue());
		if (q.AverageDailyVolume.exists()) insert.value("AverageDailyVolume", q.AverageDailyVolume.getValue());
		if (q.Bid.exists()) insert.value("Bid", q.Bid.getValue());
		if (q.BookValuePerShare.exists()) insert.value("BookValuePerShare", q.BookValuePerShare.getValue());
		if (q.Change.exists()) insert.value("Change", q.Change.getValue());
		if (q.ChangeFromFiftydayMovingAverage.exists()) insert.value("ChangeFromFiftydayMovingAverage", q.ChangeFromFiftydayMovingAverage.getValue());
		if (q.ChangeFromTwoHundreddayMovingAverage.exists()) insert.value("ChangeFromTwoHundreddayMovingAverage", q.ChangeFromTwoHundreddayMovingAverage.getValue());
		if (q.ChangeFromYearHigh.exists()) insert.value("ChangeFromYearHigh", q.ChangeFromYearHigh.getValue());
		if (q.ChangeFromYearLow.exists()) insert.value("ChangeFromYearLow", q.ChangeFromYearLow.getValue());
		if (q.ChangeInPercent.exists()) insert.value("ChangeInPercent", q.ChangeInPercent.getValue());
		if (q.DaysHigh.exists()) insert.value("DaysHigh", q.DaysHigh.getValue());
		if (q.DaysLow.exists()) insert.value("DaysLow", q.DaysLow.getValue());
		if (q.DividendPayDate != null) insert.value("DividendPayDate", q.DividendPayDate);
		if (q.TrailingAnnualDividendYield.exists()) insert.value("TrailingAnnualDividendYield", q.TrailingAnnualDividendYield.getValue());
		if (q.TrailingAnnualDividendYieldInPercent.exists()) insert.value("TrailingAnnualDividendYieldInPercent", q.TrailingAnnualDividendYieldInPercent.getValue());
		if (q.DilutedEPS.exists()) insert.value("DilutedEPS", q.DilutedEPS.getValue());
		if (q.EBITDA.exists()) insert.value("EBITDA", q.EBITDA.getValue());
		if (q.EPSEstimateCurrentYear.exists()) insert.value("EPSEstimateCurrentYear", q.EPSEstimateCurrentYear.getValue());
		if (q.EPSEstimateNextQuarter.exists()) insert.value("EPSEstimateNextQuarter", q.EPSEstimateNextQuarter.getValue());
		if (q.EPSEstimateNextYear.exists()) insert.value("EPSEstimateNextYear", q.EPSEstimateNextYear.getValue());
		if (q.ExDividendDate != null) insert.value("ExDividendDate", q.ExDividendDate);
		if (q.FiftydayMovingAverage.exists()) insert.value("FiftydayMovingAverage", q.FiftydayMovingAverage.getValue());
		insert.value("LastTradeDay", q.LastTradeDay);
		insert.value("LastTradeDate", q.LastTradeDate);
		if (q.LastTradePriceOnly.exists()) insert.value("LastTradePriceOnly", q.LastTradePriceOnly.getValue());
		insert.value("LastTradeTime", q.LastTradeTime);
		if (q.LowLimit.exists()) insert.value("LowLimit", q.LowLimit.getValue());
		if (q.MarketCapitalization != null) insert.value("MarketCapitalization", q.MarketCapitalization);
		if (q.Name != null) insert.value("Name", q.Name);
		if (q.OneyrTargetPrice.exists()) insert.value("OneyrTargetPrice", q.OneyrTargetPrice.getValue());
		if (q.Open.exists()) insert.value("Open", q.Open.getValue());
		if (q.PEGRatio.exists()) insert.value("PEGRatio", q.PEGRatio.getValue());
		if (q.PERatio.exists()) insert.value("PERatio", q.PERatio.getValue());
		if (q.PercentChangeFromFiftydayMovingAverage.exists()) insert.value("PercentChangeFromFiftydayMovingAverage", q.PercentChangeFromFiftydayMovingAverage.getValue());
		if (q.PercentChangeFromTwoHundreddayMovingAverage.exists()) insert.value("PercentChangeFromTwoHundreddayMovingAverage", q.PercentChangeFromTwoHundreddayMovingAverage.getValue());
		if (q.ChangeInPercentFromYearHigh.exists()) insert.value("ChangeInPercentFromYearHigh", q.ChangeInPercentFromYearHigh.getValue());
		if (q.PercentChangeFromYearLow.exists()) insert.value("PercentChangeFromYearLow", q.PercentChangeFromYearLow.getValue());
		if (q.PreviousClose.exists()) insert.value("PreviousClose", q.PreviousClose.getValue());
		if (q.PriceBook.exists()) insert.value("PriceBook", q.PriceBook.getValue());
		if (q.PriceEPSEstimateCurrentYear.exists()) insert.value("PriceEPSEstimateCurrentYear", q.PriceEPSEstimateCurrentYear.getValue());
		if (q.PriceEPSEstimateNextYear.exists()) insert.value("PriceEPSEstimateNextYear", q.PriceEPSEstimateNextYear.getValue());
		if (q.PricePaid.exists()) insert.value("PricePaid", q.PricePaid.getValue());
		if (q.PriceSales.exists()) insert.value("PriceSales", q.PriceSales.getValue());
		if (q.Revenue.exists()) insert.value("Revenue", q.Revenue.getValue());
		insert.value("Symbol", q.Symbol);
		if (q.TradeDate != null) insert.value("TradeDate", q.TradeDate);
		if (q.TwoHundreddayMovingAverage.exists()) insert.value("TwoHundreddayMovingAverage", q.TwoHundreddayMovingAverage.getValue());
		if (q.Volume.exists()) insert.value("Volume", q.Volume.getValue());
		if (q.YearHigh.exists()) insert.value("YearHigh", q.YearHigh.getValue());
		if (q.YearLow.exists()) insert.value("YearLow", q.YearLow.getValue());
		
		return insert;
	}

	
	public boolean validSession(String session_id){
		if (session_id == null) return false;
		return session.execute(psGetSession.bind(session_id)).iterator().hasNext();
	}
	
	public UserSession getSession(String session_id){
		if (session_id == null) return null;
		
		ResultSet results = session.execute(psGetSession.bind(UUID.fromString(session_id)));
		
		for (Row row:results){
			UserSession us = new UserSession(row);
			//Update session to log activity and reset TTL
			updateSession(us);
			return us;
		}
		
		return null;
				
	}	
	
	
	public User getUser(String email_address){
		if (email_address == null || email_address == "") return null;
		
		ResultSet results = session.execute(psGetUser.bind(email_address));
		
		for (Row row:results){
			return new User(row);
		}
		
		return null;
		
	}

	
	public void writeUser(User user){
		session.execute(psWriteUser.bind(user.getEmail_address(), user.getName(), user.getPassword_hash()));
	}

	
	public String createSession(User user){
		UUID session_id = UUIDs.timeBased();
		session.execute(psWriteSession.bind(session_id, user.getEmail_address(), user.getName()));
		session.execute(psActivity.bind(session_id, user.getEmail_address()));		
		return session_id.toString();
	}
	
	public void updateSession(UserSession us){
		session.execute(psWriteSession.bind(us.getSession_id(), us.getEmail_address(), us.getName()));
		session.execute(psActivity.bind(us.getSession_id(), us.getEmail_address()));
	}

	
	public String getPortfolios(String email_address){
		if (email_address == null || email_address == "") return "";
		
		ResultSet results = session.execute(psGetPortfolios.bind(email_address));
		List<Portfolio> portfolios = new ArrayList<Portfolio>();
		
		for (Row row: results){
			portfolios.add(new Portfolio(row));
		}
		
		return new Gson().toJson(portfolios);
	}
	
	public void savePortfolio(String email_address, String description){
		Portfolio p = new Portfolio(email_address, description);
		session.execute(psSavePortfolio.bind(p.getEmail_address(), UUID.fromString(p.getPortfolio_id()), p.getDescription(), p.getInvested(), p.getValue(), p.getValuedt()));
	}
	
	public void savePortfolio(Portfolio p){
		session.execute(psSavePortfolio.bind(p.getEmail_address(), UUID.fromString(p.getPortfolio_id()), p.getDescription(), p.getInvested(), p.getValue(), p.getValuedt()));
	}	

	public Portfolio getPortfolio(String email_address, String portfolio_id){
		if (email_address == null || email_address == "" || portfolio_id == null || portfolio_id == "") return null;
		
		ResultSet results = session.execute(psGetPortfolio.bind(email_address, UUID.fromString(portfolio_id)));
		
		for (Row row: results){
			return new Portfolio(row);
		}
		
		return null;
	}
	
	public void updatePortfolio(String email_address, String portfolio_id, String description){
		session.execute(psUpdatePortfolio.bind(description, email_address, UUID.fromString(portfolio_id)));
	}
	
	
	public List<Holding> getHoldings(Portfolio p){
		if (p.inValid()) return null;
		
		double pvalue = 0;
		
		ResultSet results = session.execute(psGetHoldings.bind(UUID.fromString(p.getPortfolio_id())));
		List<Holding> holdings = new ArrayList<Holding>();
		
		//The equivalent of a join in Cassandra. For each holding, lookup the latest price. 
		//Then, update the portfolio object.
		for (Row row: results){
			Holding h = new Holding(row);
			h.setPrice(getPrice(h.getSymbol()));
			pvalue += h.getValue();
			holdings.add(h);
		}
		
		//Update the portfolio value when the portfolio is accessed
		p.setValue(pvalue);
		savePortfolio(p);
		
		return holdings;
	}
	
	
	public String getTransactions(String portfolio_id){		
		if (portfolio_id == null || portfolio_id.equals("")) return "";
		
		ResultSet results = session.execute(psGetTransactions.bind(UUID.fromString(portfolio_id)));
		List<Transaction> transactions = new ArrayList<Transaction>();
		
		for (Row row: results){
			transactions.add(new Transaction(row));
		}
		
		return new Gson().toJson(transactions);
	}
	
	public String getHistory(String portfolio_id){		
		if (portfolio_id == null || portfolio_id.equals("")) return "";
		
		ResultSet results = session.execute(psGetHistory.bind(UUID.fromString(portfolio_id)));
		List<History> hist = new ArrayList<History>();
		
		for (Row row: results){
			hist.add(new History(row));
		}
		
		return new Gson().toJson(hist);
	}
	
	public String getCorrections(String portfolio_id){		
		if (portfolio_id == null || portfolio_id.equals("")) return "";
		
		ResultSet results = session.execute(psGetCorrections.bind(UUID.fromString(portfolio_id)));
		List<Correction> corrections = new ArrayList<Correction>();
		
		for (Row row: results){
			corrections.add(new Correction(row));
		}
		
		return new Gson().toJson(corrections);
	}	
	
	
	public String getSymbols(String node, int load){
		String symbols = "";
		ResultSet results = session.execute(psGetSymbols.bind(node, load));
		
		for (Row row : results){
			if (!symbols.equals("")) symbols = symbols + "+";
			symbols = symbols + row.getString("symbol").trim();
		}
		
		return symbols;
	}
	
	
	public boolean updateCash(String portfolio_id, double amount){
		if (portfolio_id == null || portfolio_id.equals("") || amount == 0) return false;
		
		boolean applied  = false;
		
		BatchStatement bsPos = new BatchStatement();
		BatchStatement bsTran = new BatchStatement(BatchStatement.Type.UNLOGGED);
		Transaction t = new Transaction(UUID.fromString(portfolio_id), Util.CASH, amount, 1);

		changePosition(bsPos, t);
		addTransaction(bsTran, t);		
		
		ResultSet results = session.execute(bsPos);
		
		for (Row row : results){
			//Was the transaction applied?
			applied = row.getBool("[applied]");
			if (applied){
				session.execute(bsTran);
			}
		}
		return applied;
	}

	
	public double getPosition(UUID portfolio_id, String symbol){
		ResultSet results = session.execute(psGetHolding.bind(portfolio_id, symbol));
		if (results.isExhausted()){
			return 0;
		}
		else{
			return  results.one().getDouble("quantity");
		}		
	}

	
	private double getPrice(String symbol, Date date){
		Date day = DateUtils.truncate(date, Calendar.DATE);
		Date today = DateUtils.truncate(new Date(), Calendar.DATE);
		
		ResultSet results = session.execute(psGetPrice.bind(symbol, day, date));
		if (results.isExhausted()){
			//No results found. If attempting to post today, get latest price
			if (day.equals(today)){
				return getPrice(symbol);
			}
			return 0;
		}
		else{
			return  results.one().getDouble("lasttradepriceonly");
		}		
	}
	
	private double getPrice(String symbol){
		// Cash is always equal to $1. Feels like a hack, but allows for simpler computations of value.
		if (symbol.equals(Util.CASH)) return 1;
		
		ResultSet results = session.execute(psGetLatestPrice.bind(symbol));
		if (results.isExhausted()){
			return 0;
		}
		else{
			return  results.one().getDouble("lasttradepriceonly");
		}		
	}	

	
	private void changePosition(BatchStatement bs, Transaction t){
		double current_position = getPosition(t.getPortfolio_id(), t.getSymbol());
		
		if (current_position == 0){
			bs.add(psNewPosition.bind(t.getPortfolio_id(), t.getSymbol(), t.getQuantity()));
		}
		else if ((current_position + t.getQuantity()) == 0){
			bs.add(psDeletePosition.bind(t.getPortfolio_id(), t.getSymbol(), current_position));
		}
		else{
			bs.add(psUpdatePosition.bind(current_position + t.getQuantity(), t.getPortfolio_id(), t.getSymbol(), current_position));
		}
	}

	
	private void addTransaction(BatchStatement bs, Transaction t){
		bs.add(psWriteTransaction.bind(t.getPortfolio_id(), t.getTransaction_id(), t.getAmount(), t.getEffective_date(), t.getPrice(), t.getQuantity(), t.getSymbol()));		
	}

	
	public boolean executeTrade(String portfolio_id, String symbol, double amount){
		return executeTrade(portfolio_id, symbol, amount, new Date());
	}
	
	public boolean needsCorrection(String portfolio_id, Date effective_date){
		Date date = DateUtils.truncate(effective_date, Calendar.DATE);
		Date today = DateUtils.truncate(new Date(), Calendar.DATE); 
		
		//If the date is a previous day, return true. No need to check if the totals have already posted.
		if (today.after(effective_date)) return true;
		
		ResultSet results = session.execute(psDailyHoldings.bind(UUID.fromString(portfolio_id), date));
		if (results.isExhausted()){
			return false;
		}
		else{
			return true;
		}
	}

	
	public boolean executeTrade(String portfolio_id, String symbol, double amount, Date effective_date){
		if (portfolio_id == null || portfolio_id.equals("") || amount == 0) return false;
		
		boolean applied  = false;
		
		double price = getPrice(symbol, effective_date);
		
		if (price > 0){
			BatchStatement position = new BatchStatement();
			BatchStatement transaction = new BatchStatement(BatchStatement.Type.UNLOGGED);
			
			//adjust cash to cover stock
			Transaction cash = new Transaction(UUID.fromString(portfolio_id), Util.CASH, amount*price*-1, 1, effective_date);
			changePosition(position, cash);
			addTransaction(transaction, cash);
			
			//stock transaction
			Transaction stock = new Transaction(UUID.fromString(portfolio_id), symbol, amount, price, effective_date);
			changePosition(position, stock);
			addTransaction(transaction, stock);
			
			//if daily totals have already posted, correction is needed
			//Does a portfolio_daily record exist for this transaction date? If so, add correction
			if (needsCorrection(portfolio_id, effective_date)){
				transaction.add(psWriteCorrection.bind(stock.getPortfolio_id(), stock.getTransaction_second(), stock.getEffective_date(), stock.getQuantity(), "PENDING", stock.getSymbol()));
				transaction.add(psWriteCorrection.bind(cash.getPortfolio_id(), cash.getTransaction_second(), cash.getEffective_date(), cash.getQuantity(), "PENDING", cash.getSymbol()));
			}

			ResultSet results = session.execute(position);
		
			for (Row row : results){
				//Was the transaction applied?
				applied = row.getBool("[applied]");
				if (applied){
					session.execute(transaction);
				}
			}
		}
		
		return applied;
	}
	
	
	public String searchSymbol(String search_symbol){
		return search("symbol:" + search_symbol, 1);	
	}
	
	public String search(String search, int LIMIT){
		List<Symbol> symbols = new ArrayList<Symbol>();
		ResultSet results;
		
		//results = session.execute(psSearchSymbol.bind("symbol:" + search + "~" + " name:" + search + "~", Util.NUM_STOCKS));
		results = session.execute(psSearchSymbol.bind(search, LIMIT));
		for (Row row: results){
			symbols.add(new Symbol(row));
		}
		
		return new Gson().toJson(symbols);		
	}	
	
	
	//Only used for cleaning up bad data
	public int removeStocksWithNoTrades(){
		BatchStatement bs = new BatchStatement(BatchStatement.Type.UNLOGGED);
		ResultSet results = session.execute(QueryBuilder.select().all().from("lasttrade"));
		int i = 0;
		
		for (Row row:results){
			if (row.getDouble("lasttradepriceonly") == 0){
				String symbol = row.getString("symbol");
				bs.add(QueryBuilder.delete().from("quote").where(QueryBuilder.eq("symbol", symbol)));
				bs.add(QueryBuilder.delete().from("quote_daily").where(QueryBuilder.eq("symbol", symbol)));
				//bs.add(QueryBuilder.delete().from("quote_history").where(QueryBuilder.eq("symbol", symbol)));
				bs.add(QueryBuilder.delete().from("quote_loader").where(QueryBuilder.eq("symbol", symbol)));
				bs.add(QueryBuilder.delete().from("quote_load_rules").where(QueryBuilder.eq("symbol", symbol)));
				
				session.execute(bs);
				i++;
			}
		}
		
		return i;
	}
	
	//Build StockSummary
	public StockSummary getStockSummary(String symbol, int LIMIT){
		if (symbol == null || symbol.equals("")) return null;
		return new StockSummary(session.execute(psGetQuote.bind(symbol, LIMIT)));
	}
	
}
