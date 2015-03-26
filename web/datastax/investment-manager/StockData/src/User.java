import com.datastax.driver.core.Row;


public class User {
	private String email_address;
	private String name;
	private String password_hash;
	
	public User(Row row){
		this.setEmail_address(row.getString("email_address"));
		this.setName(row.getString("name"));
		this.setPassword_hash(row.getString("password_hash"));
	}
	
	public User(String email_address, String name, String password_hash){
		this.setEmail_address(email_address);
		this.setName(name);
		this.setPassword_hash(password_hash);
	}
	
	public String getEmail_address() {
		return email_address;
	}
	public void setEmail_address(String email_address) {
		this.email_address = email_address;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword_hash() {
		return password_hash;
	}
	public void setPassword_hash(String password_hash) {
		this.password_hash = password_hash;
	}
	
	public boolean checkPasswordHash(String password_hash){
		return this.getPassword_hash().equals(password_hash);
	}
	
}
