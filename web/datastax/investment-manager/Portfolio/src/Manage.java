

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Manage
 */
@WebServlet("/Manage")
public class Manage extends PortfolioServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Manage() {
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
		
		request.setAttribute("Portfolios", db.getPortfolios(session.getEmail_address()));
		request.getRequestDispatcher("manage.jsp").forward(request, response);
		
	}

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		UserSession session = getValidSession(request, response);
		
		if (session == null) return;
		
		request.setAttribute("Portfolios", db.getPortfolios(session.getEmail_address()));
		request.getRequestDispatcher("manage.jsp").forward(request, response);		
	}

}
