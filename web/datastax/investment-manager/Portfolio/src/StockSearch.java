

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class StockSearch
 */
@WebServlet("/StockSearch")
public class StockSearch extends PortfolioServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StockSearch() {
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
		
		getPortfolio(session, request, response);
		
		request.getRequestDispatcher("stocksearch.jsp").forward(request, response);	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		UserSession session = getValidSession(request, response);
		if (session == null) return;
		
		getPortfolio(session, request, response);
		
		String searchstring = "";
		
		String symbol = Util.coalesce(request.getParameter("symbol"), "");
		String exchange = Util.coalesce(request.getParameter("exchange"), "");
		String industry = Util.coalesce(request.getParameter("industry"), "");
		String name = Util.coalesce(request.getParameter("name"), "");
		String sector = Util.coalesce(request.getParameter("sector"), "");
		
		if (!symbol.equals("")) searchstring += "symbol:" + symbol + "~1 AND "; 
		if (!exchange.equals("")) searchstring += "exchange:" + exchange + "~1 AND "; 
		if (!industry.equals("")) searchstring += "industry:" + industry + "~1 AND "; 
		if (!name.equals("")) searchstring += "name:" + name + "~1 AND "; 
		if (!sector.equals("")) searchstring += "sector:" + sector + "~1 AND "; 	
		
		//Set attributes
		request.setAttribute("search_symbol", symbol);
		request.setAttribute("search_exchange", exchange);
		request.setAttribute("search_industry", industry);
		request.setAttribute("search_name", name);
		request.setAttribute("search_sector", sector);
		
		if (searchstring.length() > 5){
			//Trim the last " AND ";
			searchstring = searchstring.substring(0, searchstring.length()-5);
			//Execute search and save results
			try{
			request.setAttribute("Results", db.search(searchstring, 50));
			}catch(Exception e){
				request.setAttribute("ERMSG", "Your search returned no results.");
			}
		}
		
		request.getRequestDispatcher("stocksearch.jsp").forward(request, response);	
	}

}
