import java.text.NumberFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.UUID;

import com.datastax.driver.core.Row;
import com.datastax.driver.core.utils.UUIDs;

import org.apache.commons.lang.time.DateUtils;

public class Transaction {
	private UUID portfolio_id;
	private UUID transaction_id;
	private double amount;
	private Date effective_date;
	private double price;
	private double quantity;
	private String symbol;
	private Date transaction_date;
	
	//Dates truncated to midnight
	private Date effective_day;
	private Date transaction_day;
	
	//For formatting
	private String price_currency;
	private String amount_currency;

	public Transaction(Row row){
		this.setPortfolio_id(row.getUUID("portfolio_id"));
		this.setTransaction_id(row.getUUID("transaction_id"));
		this.setAmount(row.getDouble("amount"));
		this.setEffective_date(row.getDate("effective_date"));
		this.setQuantity(row.getDouble("quantity"));
		this.setSymbol(row.getString("symbol"));
		this.setTransaction_date(row.getDate("transaction_date"));
		this.setPrice(row.getDouble("price"));
	}
	
	private void initialize(UUID portfolio_id, String symbol, double quantity, double price, Date effective_date){
		this.setPortfolio_id(portfolio_id);
		this.setSymbol(symbol);
		this.setQuantity(quantity);
		this.setEffective_date(effective_date);
		this.setTransaction_id(UUIDs.timeBased());
		this.setAmount(quantity * price);
		this.setTransaction_date(new Date());
		this.setPrice(price);
	}
	
	public void debug(){
		System.out.println("----------------------");
		System.out.println(portfolio_id);
		System.out.println(transaction_id);
		System.out.println(amount);
		System.out.println(effective_date);
		System.out.println(price);
		System.out.println(quantity);
		System.out.println(symbol);
		System.out.println(transaction_date);
		System.out.println("----------------------");
	}
	
	public Transaction(UUID portfolio_id, String symbol, double quantity, double price, Date effective_date){
		initialize(portfolio_id, symbol, quantity, price, effective_date);
	}
		
	
	public Transaction(UUID portfolio_id, String symbol, double quantity, double price){
		initialize(portfolio_id, symbol, quantity, price, new Date());
	}
	
	public Date getEffective_day() {
		return effective_day;
	}

	public Date getTransaction_day() {
		return transaction_day;
	}

	public String getPrice_currency(){
		return this.price_currency;
	}
	
	public String getAmount_currency(){
		return this.amount_currency;
	}	
	
	public Date getTransaction_date() {
		return transaction_date;
	}
	
	//Truncate the date to second - helps with some weird shark processing issues
	public Date getTransaction_second() {
		return DateUtils.truncate(transaction_date, Calendar.SECOND);
	}	

	public void setTransaction_date(Date transaction_date) {
		this.transaction_date = transaction_date;
		this.transaction_day = DateUtils.truncate(transaction_date, Calendar.DATE);
	}	
	
	public UUID getPortfolio_id() {
		return portfolio_id;
	}
	public void setPortfolio_id(UUID portfolio_id) {
		this.portfolio_id = portfolio_id;
	}
	public UUID getTransaction_id() {
		return transaction_id;
	}
	public void setTransaction_id(UUID transaction_id) {
		this.transaction_id = transaction_id;
	}
	
	public double getAmount() {
		return amount;
	}
	
	public void setAmount(double amount) {
		this.amount = amount;
		this.amount_currency = NumberFormat.getCurrencyInstance().format(amount);
	}
	
	public Date getEffective_date() {
		return effective_date;
	}
	public void setEffective_date(Date effective_date) {
		this.effective_date = effective_date;
		this.effective_day = DateUtils.truncate(effective_date, Calendar.DATE);
	}
	public double getPrice() {
		return price;
	}
	
	public void setPrice(double price) {
		this.price = price;
		
		if (this.getSymbol().equals(Util.CASH)){
			this.price_currency = "n/a";
		}else{
			this.price_currency = NumberFormat.getCurrencyInstance().format(price);
		}		
	}
	
	public double getQuantity() {
		return quantity;
	}
	public void setQuantity(double quantity) {
		this.quantity = quantity;
	}
	public String getSymbol() {
		return symbol;
	}
	public void setSymbol(String symbol) {
		this.symbol = symbol;
	}
}
