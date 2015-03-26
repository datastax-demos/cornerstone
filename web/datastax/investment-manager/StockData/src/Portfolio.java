import java.text.NumberFormat;
import java.util.Date;
import java.util.UUID;

import com.datastax.driver.core.Row;
import com.datastax.driver.core.utils.UUIDs;


public class Portfolio {
	private String email_address;
	private String portfolio_id;
	private Date created;
	private String description;
	private double invested;
	private double value;
	private Date  valuedt;
	
	//Formatted for display
	private String invested_currency;
	private String value_currency;	
	
	public Portfolio(Row row){
		UUID uuid = row.getUUID("portfolio_id");
		this.setEmail_address(row.getString("email_address"));
		this.setPortfolio_id(uuid.toString());
		this.setCreated(row.getDate("created"));
		this.setDescription(row.getString("description"));
		this.setInvested(row.getDouble("invested"));
		this.setValue(row.getDouble("value"));
		this.setValuedt(row.getDate("valuedt"));
	}
	
	public Portfolio(String email_address, String description){
		this.setPortfolio_id(UUIDs.timeBased().toString());
		this.setEmail_address(email_address);
		this.setCreated(new Date());
		this.setDescription(description);
		this.setInvested(0);
		this.setValue(0);
		this.setValuedt(getCreated());
	}
	
	public boolean inValid(){
		return (portfolio_id == null || portfolio_id.equals(""));
	}
	
	public void updateValue(double amount){
		this.setValue(this.getValue()+amount);
		this.setInvested(this.getInvested()+amount);
		this.setValuedt(new Date());
	}
	
	public String getEmail_address() {
		return email_address;
	}

	public void setEmail_address(String email_address) {
		this.email_address = email_address;
	}	
	
	public double getInvested() {
		return invested;
	}

	public void setInvested(double invested) {
		this.invested = invested;
		this.invested_currency = NumberFormat.getCurrencyInstance().format(invested);
	}	
	public String getPortfolio_id() {
		return portfolio_id;
	}
	public void setPortfolio_id(String portfolio_id) {
		this.portfolio_id = portfolio_id;
	}
	public Date getCreated() {
		return created;
	}
	public void setCreated(Date created) {
		this.created = created;
	}	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public double getValue() {
		return value;
	}
	public void setValue(double value) {
		this.value = value;
		this.value_currency = NumberFormat.getCurrencyInstance().format(value);
		this.setValuedt(new Date());
	}
	public Date getValuedt() {
		return valuedt;
	}
	public void setValuedt(Date valuedt) {
		this.valuedt = valuedt;
	}
	public String getValue_currency() {
		return value_currency;
	}	
	public String getInvested_currency() {
		return invested_currency;
	}
}
