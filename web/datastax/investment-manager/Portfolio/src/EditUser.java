

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EditUser
 */
@WebServlet("/EditUser")
public class EditUser extends PortfolioServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		UserSession session = getValidSession(request, response);
		if (session == null) return;
		
		//Check for valid portfolio
		getPortfolio(session, request, response);
		
		//Get User
		User user = db.getUser(session.getEmail_address());

		if (user != null){
			//Set username
			request.setAttribute("user_name", user.getName());			
		}		
		
		request.getRequestDispatcher("user.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		UserSession session = getValidSession(request, response);
		if (session == null) return;
		
		//Check for valid portfolio
		getPortfolio(session, request, response);
		
		//Check for valid username
		if (Util.coalesce(request.getParameter("user_name"), "").equals("")){
			request.setAttribute("ERMSG", "Name cannot be empty.");
			request.getRequestDispatcher("user.jsp").forward(request, response);
			return;			
		}
		
		//First check that newpasswords both match
		if (!Util.coalesce(request.getParameter("new_password1"), "").equals(Util.coalesce(request.getParameter("new_password2"), ""))){
			request.setAttribute("ERMSG", "New passwords do not match.");
			request.getRequestDispatcher("user.jsp").forward(request, response);
			return;
		}
		
		//Validate password
		if (Util.coalesce(request.getParameter("new_password1"), "").length() < 8){
			request.setAttribute("ERMSG", "Password must be at least 8 characters.");
			request.getRequestDispatcher("user.jsp").forward(request, response);
			return;
		}		
		
		//Get User
		User user = db.getUser(session.getEmail_address());
		
		//If user lookup fails
		if (user == null){
			request.setAttribute("ERMSG", "Error accessing user information.");
			request.getRequestDispatcher("user.jsp").forward(request, response);
			return;
		}		
		
		//Now check current password
		if (!user.checkPasswordHash(passwordHash(Util.coalesce(request.getParameter("old_password"))))){
			request.setAttribute("ERMSG", "Invalid Password.");
			request.getRequestDispatcher("user.jsp").forward(request, response);	
			return;
		}
		
		//Update user information
		user.setName(request.getParameter("user_name"));
		user.setPassword_hash(passwordHash(request.getParameter("new_password1")));
		db.writeUser(user);
		

		request.setAttribute("Info", "User information updated.");
		request.setAttribute("user_name", user.getName());					
		request.getRequestDispatcher("user.jsp").forward(request, response);
	}

}
