

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CreatePortfolio
 */
@WebServlet("/CreatePortfolio")
public class CreatePortfolio extends PortfolioServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreatePortfolio() {
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
		
		request.getRequestDispatcher("createportfolio.jsp").forward(request, response);		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		UserSession session = getValidSession(request, response);
		if (session == null) return;
		
		String description = request.getParameter("description");
		
		if (description == ""){
			request.setAttribute("ERMSG", "Description can't be empty.");
			request.getRequestDispatcher("createportfolio.jsp").forward(request, response);
			return;
		}
		
		db.savePortfolio(session.getEmail_address(), description);
		request.setAttribute("Info", "Portfolio saved.");
		request.getRequestDispatcher("Manage").forward(request, response);		
		
	}

}
