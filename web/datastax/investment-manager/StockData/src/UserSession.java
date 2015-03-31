import java.util.UUID;

import com.datastax.driver.core.Row;


public class UserSession {
	private UUID session_id;
	private String email_address;
	private String name;
	
	public UserSession(Row row){
		this.setSession_id(row.getUUID("session_id"));
		this.setEmail_address(row.getString("email_address"));
		this.setName(row.getString("name"));
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public UUID getSession_id() {
		return session_id;
	}
	public void setSession_id(UUID session_id) {
		this.session_id = session_id;
	}
	public String getEmail_address() {
		return email_address;
	}
	public void setEmail_address(String email_address) {
		this.email_address = email_address;
	}
}
