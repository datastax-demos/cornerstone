import java.util.Date;

import com.datastax.driver.core.Row;


public class TickPlot {
	private double FiftydayMovingAverage;
	private Date LastTradeDate;
	private double LastTradePriceOnly;
	private String Symbol;
	private double TwoHundreddayMovingAverage;
	
	public TickPlot(Row row){
		this.setFiftydayMovingAverage(row.getDouble("FiftydayMovingAverage"));
		this.setLastTradeDate(row.getDate("LastTradeDate"));
		this.setLastTradePriceOnly(row.getDouble("LastTradePriceOnly"));
		this.setSymbol(row.getString("Symbol"));
		this.setTwoHundreddayMovingAverage(row.getDouble("TwoHundreddayMovingAverage"));
	}
	
	public String getData50MA(){
		//return "['" + this.getLastTradeDate() + "', " + this.getFiftydayMovingAverage() + "]";
		return Double.toString(this.getFiftydayMovingAverage());
	}
	
	public String getData200MA(){
		return Double.toString(this.getTwoHundreddayMovingAverage());
	}
	
	public String getDataActual(){
		return Double.toString(this.getLastTradePriceOnly());
	}
	
	public double getFiftydayMovingAverage() {
		return FiftydayMovingAverage;
	}
	public void setFiftydayMovingAverage(double fiftydayMovingAverage) {
		FiftydayMovingAverage = fiftydayMovingAverage;
	}
	public Date getLastTradeDate() {
		return LastTradeDate;
	}
	public void setLastTradeDate(Date lastTradeDate) {
		LastTradeDate = lastTradeDate;
	}
	public double getLastTradePriceOnly() {
		return LastTradePriceOnly;
	}
	public void setLastTradePriceOnly(double lastTradePriceOnly) {
		LastTradePriceOnly = lastTradePriceOnly;
	}
	public String getSymbol() {
		return Symbol;
	}
	public void setSymbol(String symbol) {
		Symbol = symbol;
	}
	public double getTwoHundreddayMovingAverage() {
		return TwoHundreddayMovingAverage;
	}
	public void setTwoHundreddayMovingAverage(double twoHundreddayMovingAverage) {
		TwoHundreddayMovingAverage = twoHundreddayMovingAverage;
	}
}
