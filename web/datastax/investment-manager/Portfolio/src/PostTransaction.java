

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class PostTransaction
 */
@WebServlet("/PostTransaction")
public class PostTransaction extends PortfolioServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostTransaction() {
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
		Portfolio p = getPortfolio(session, request, response);
		
		//Check for symbol from stock search
		request.setAttribute("symbol", Util.coalesce(request.getParameter("symbol"), ""));		
		
		if (p == null){
			request.setAttribute("ERMSG", "Unable to access portfolio.");
			request.getRequestDispatcher("Manage").forward(request, response);
			
		}else{	
			request.setAttribute("portfolio_id", p.getPortfolio_id());
			request.getRequestDispatcher("transaction.jsp").forward(request, response);		
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		UserSession session = getValidSession(request, response);
		if (session == null) return;
		
		boolean success = false;
		
		//Validate portfolio
		Portfolio p = getPortfolio(session, request, response);
		
		if (p == null){
			request.setAttribute("ERMSG", "Unable to access portfolio.");
			request.getRequestDispatcher("Manage").forward(request, response);
			
		}else{
			String transaction_type = request.getParameter("transaction_type");
			String effective_date = request.getParameter("effective_date");
			String symbol = request.getParameter("symbol");
			String quantity = request.getParameter("quantity");
			
			if (transaction_type.equals("Deposit")){
				success = db.updateCash(p.getPortfolio_id(), Double.parseDouble(quantity));
				if (success){
					p.updateValue(Double.parseDouble(quantity));
					db.savePortfolio(p);
				}
			}
			else if (transaction_type.equals("Trade")){
				success = db.executeTrade(p.getPortfolio_id(), symbol, Double.parseDouble(quantity));
			}
			else if (transaction_type.equals("Correction")){
				//02/04/2015 11:07 PM
				DateFormat format = new SimpleDateFormat("MM/dd/yyyy hh:mm aa");
				Date date;
				try {
					date = format.parse(effective_date);
					Date now = new Date();
					
					//Don't accept future dates
					if (date.before(now)){
						success = db.executeTrade(p.getPortfolio_id(), symbol, Double.parseDouble(quantity), date);
					}
					
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					// e.printStackTrace();
				}
			}
			
			//request.setAttribute("Info", "Transaction Saved");
			response.sendRedirect("ViewPortfolio?portfolio_id=" + p.getPortfolio_id() + "&success=" + success);	
		}		
	}
	
}
