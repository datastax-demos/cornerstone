

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends PortfolioServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Validate login
		getValidSession(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Validate login
		String email_address = request.getParameter("email_address").toLowerCase();
		User user = db.getUser(email_address);
		
		if (user == null){
			//If user doesn't exist, attempt to create one (only applies to datastax.com email addresses with the correct NEW password.
			user = createUser(email_address, request.getParameter("password"));
			if (user == null){
				//No valid user and failed to generate new user.
				request.setAttribute("ERMSG", "Invalid email address or password.");
				request.getRequestDispatcher("index.jsp").forward(request, response);	
				return;
			}
		}
		
		if (user.checkPasswordHash(passwordHash(request.getParameter("password")))){
			//Successful login. Create session.
			String session_id = db.createSession(user);
			
			Cookie cookie = new Cookie("session_id", session_id);
			response.addCookie(cookie);	
			
			//During first login, also set a session parameter. 
			//The cookie will not be available until the next request
			request.setAttribute("session_id", session_id);
		}else{
			request.setAttribute("ERMSG", "Invalid email address or password.");
			request.getRequestDispatcher("index.jsp").forward(request, response);
			return;
		}
		
		request.getRequestDispatcher("Manage").forward(request, response);
	}
	
	
	private User createUser(String email_address, String password){
		String[] email = email_address.split("@");
		if (email.length == 2){
			if (email[1].equals(Password.DOMAIN) && password.equals(Password.DEFAULT)){
					User user = new User(email_address, email[0], passwordHash(password));
					db.writeUser(user);
					return user;
				}
			}
		return null;
	}
	

}
