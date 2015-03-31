import java.text.NumberFormat;
import java.util.UUID;

import com.datastax.driver.core.Row;


public class Holding {
	private UUID portfolio_id;
	private String symbol;
	private double quantity;
	private double price;
	private double value;
	private String price_currency;
	private String value_currency;
	
	public Holding(Row row){
		this.setPortfolio_id(row.getUUID("portfolio_id"));
		this.setQuantity(row.getDouble("quantity"));
		this.setSymbol(row.getString("symbol"));
	}
	
	private String getChartLabel(){
		return this.getSymbol() + " - " + this.getValue_currency();
	}
	
	private String getChartValue(){
		return Double.toString(this.getValue());
	}
	
	public String getChartData(){
		return "['" + this.getChartLabel() + "', " + this.getChartValue() + "]";
	}
	
	public void setPrice(double price){
		this.price = price;
		this.value = price * this.quantity;
		this.value_currency = NumberFormat.getCurrencyInstance().format(this.value);
		
		if (this.getSymbol().equals(Util.CASH)){
			this.price_currency = "n/a";
		}else{
			this.price_currency = NumberFormat.getCurrencyInstance().format(price);
		}		
	}
	
	public double getPrice(){
		return this.price;
	}
	
	public double getValue(){
		return this.value;
	}
	
	public String getValue_currency(){
		return this.value_currency;
	}

	public String getPrice_currency(){
		return this.price_currency;
	}	
	  
	public UUID getPortfolio_id() {
		return portfolio_id;
	}
	public void setPortfolio_id(UUID portfolio_id) {
		this.portfolio_id = portfolio_id;
	}
	public String getSymbol() {
		return symbol;
	}
	public void setSymbol(String symbol) {
		this.symbol = symbol;
	}
	public double getQuantity() {
		return quantity;
	}
	public void setQuantity(double quantity) {
		this.quantity = quantity;
	}
	  
}

