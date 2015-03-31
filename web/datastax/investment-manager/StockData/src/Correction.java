import java.util.Date;
import java.util.UUID;
import com.datastax.driver.core.Row;

public class Correction {
	private UUID portfolio_id;
	private Date correction_date;
	private Date effective_date;
	private double quantity;
	private String status;
	private String symbol;
	
	public Correction(Row row){
		this.setPortfolio_id(row.getUUID("portfolio_id"));
		this.setCorrection_date(row.getDate("correction_date"));
		this.setEffective_date(row.getDate("effective_date"));
		this.setQuantity(row.getDouble("quantity"));
		this.setStatus(row.getString("status"));
		this.setSymbol(row.getString("symbol"));
	}
	
	public UUID getPortfolio_id() {
		return portfolio_id;
	}
	public void setPortfolio_id(UUID portfolio_id) {
		this.portfolio_id = portfolio_id;
	}
	public Date getCorrection_date() {
		return correction_date;
	}
	public void setCorrection_date(Date correction_date) {
		this.correction_date = correction_date;
	}
	public Date getEffective_date() {
		return effective_date;
	}
	public void setEffective_date(Date effective_date) {
		this.effective_date = effective_date;
	}
	public double getQuantity() {
		return quantity;
	}
	public void setQuantity(double quantity) {
		this.quantity = quantity;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getSymbol() {
		return symbol;
	}
	public void setSymbol(String symbol) {
		this.symbol = symbol;
	}
	
}
