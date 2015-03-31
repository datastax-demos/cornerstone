import java.text.NumberFormat;
import java.util.Date;
import java.util.UUID;

import com.datastax.driver.core.Row;


public class History {
	private UUID portfolio_id;
	private Date lasttradeday;
	private double current_value;
	private double original_value;
	private double change;
	
	private String original_value_currency;
	private String current_value_currency;
	private String change_currency;
	
	public History(Row row){
		this.setPortfolio_id(row.getUUID("portfolio_id"));
		this.setLasttradeday(row.getDate("lasttradeday"));
		this.setCurrent_value(row.getDouble("current_value"));
		this.setOriginal_value(row.getDouble("original_value"));
		
		this.setChange(current_value - original_value);
	}
	
	public String getChange_currency() {
		return change_currency;
	}	
	
	public double getChange() {
		return change;
	}

	public void setChange(double change) {
		this.change = change;
		if (change == 0){
			this.change_currency = "";
		}
		else{
			this.change_currency = NumberFormat.getCurrencyInstance().format(change);
		}
	}

	public String getOriginal_value_currency() {
		return original_value_currency;
	}

	public String getCurrent_value_currency() {
		return current_value_currency;
	}

	public UUID getPortfolio_id() {
		return portfolio_id;
	}
	public void setPortfolio_id(UUID portfolio_id) {
		this.portfolio_id = portfolio_id;
	}
	public Date getLasttradeday() {
		return lasttradeday;
	}
	public void setLasttradeday(Date lasttradeday) {
		this.lasttradeday = lasttradeday;
	}
	public double getCurrent_value() {
		return current_value;
	}
	public void setCurrent_value(double current_value) {
		this.current_value = current_value;
		this.current_value_currency = NumberFormat.getCurrencyInstance().format(current_value);
	}
	public double getOriginal_value() {
		return original_value;
	}
	public void setOriginal_value(double original_value) {
		this.original_value = original_value;
		this.original_value_currency = NumberFormat.getCurrencyInstance().format(original_value);
	}
	
}
