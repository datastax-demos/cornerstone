import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringEscapeUtils;


public class PortfolioServlet  extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	protected DataStaxCluster db;
	private MD5 hash;

	public PortfolioServlet(){
		super();
		db = new DataStaxCluster(Util.NODE, "stocks");
		hash = new MD5();
	}
	
	public String passwordHash(String password){
		return hash.getHash(password);
	}
	
	public UserSession getValidSession(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//check for active session
		UserSession session;
		String session_id = null;
		Cookie[] cookies = request.getCookies();
		
		//check request attribute first
		session_id = (String) request.getAttribute("session_id");
		
		if (session_id == null && cookies != null){
			for(Cookie cookie : cookies){
			    if("session_id".equals(cookie.getName())){
			    	session_id = cookie.getValue();
			    }
			}	
		}
		
		session = db.getSession(session_id);
		
		if (session == null){
			request.setAttribute("ERMSG", "You are not logged in.");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		} else{
			request.setAttribute("Username", session.getEmail_address());
		}

		return session;
	}

	
	public Portfolio getPortfolio(UserSession session, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Cookie[] cookies = request.getCookies();
		
		//Check for parameter. This will replace the value in the cookie
		String portfolio_id = Util.coalesce(request.getParameter("portfolio_id"), "");
		
		if (!portfolio_id.equals("")){
			Cookie cookie = new Cookie("portfolio_id", portfolio_id);
			cookie.setMaxAge(900);
			response.addCookie(cookie);				
		}
		else if (cookies != null){
			for(Cookie cookie : cookies){
			    if("portfolio_id".equals(cookie.getName())){
			    	portfolio_id = cookie.getValue();
			    }
			}	
		}		
		
		if (!portfolio_id.equals("")){
			Portfolio p = db.getPortfolio(session.getEmail_address(), portfolio_id);
			if (p == null) return p;
			
			request.setAttribute("active_portfolio", "Active Portfolio:  " + StringEscapeUtils.escapeJavaScript(p.getDescription()));
			return p;
		} 
		else{
			return null;
		}
			
	}
			
	
}
