import java.text.NumberFormat;
import java.util.Date;

import com.datastax.driver.core.Row;


public class Symbol {
	private String exchange;
	private String symbol;
	private String industry;
	private String marketcap;
	private String name;
	private String sector;
	private Date lasttradedate;
	private double lasttradepriceonly;
	private String lasttradepricecurrency;
	
	public Symbol(Row row){
		this.setExchange(row.getString("exchange"));
		this.setSymbol(row.getString("symbol"));
		this.setIndustry(row.getString("industry"));
		this.setMarketcap(row.getString("marketcap"));
		this.setName(row.getString("name"));
		this.setSector(row.getString("sector"));
		this.setLasttradedate(row.getDate("lasttradedate"));
		this.setLasttradepriceonly(row.getDouble("lasttradepriceonly"));
	}	
	
	public Date getLasttradedate() {
		return lasttradedate;
	}

	public void setLasttradedate(Date lasttradedate) {
		this.lasttradedate = lasttradedate;
	}

	public double getLasttradepriceonly() {
		return lasttradepriceonly;
	}

	public void setLasttradepriceonly(double lasttradepriceonly) {
		this.lasttradepriceonly = lasttradepriceonly;
		this.lasttradepricecurrency = NumberFormat.getCurrencyInstance().format(lasttradepriceonly);
	}
	
	public String getLasttradepricecurrency() {
		return lasttradepricecurrency;
	}	

	public String getExchange() {
		return exchange;
	}

	public void setExchange(String exchange) {
		this.exchange = exchange;
	}

	public String getSymbol() {
		return symbol;
	}

	public void setSymbol(String symbol) {
		this.symbol = symbol;
	}

	public String getIndustry() {
		return industry;
	}

	public void setIndustry(String industry) {
		this.industry = industry;
	}

	public String getMarketcap() {
		return marketcap;
	}

	public void setMarketcap(String marketcap) {
		this.marketcap = marketcap;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSector() {
		return sector;
	}

	public void setSector(String sector) {
		this.sector = sector;
	}
}
