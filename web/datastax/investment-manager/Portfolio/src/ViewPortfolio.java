

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ViewPortfolio
 */
@WebServlet("/ViewPortfolio")
public class ViewPortfolio extends PortfolioServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewPortfolio() {
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
		
		Portfolio p = getPortfolio(session, request, response);
		
		if (p == null){
			request.setAttribute("ERMSG", "Unable to access portfolio.");
			request.getRequestDispatcher("Manage").forward(request, response);
			
		}else{
			populatePortfolioData(p, request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		UserSession session = getValidSession(request, response);
		if (session == null) return;
		
		Portfolio p = getPortfolio(session, request, response);
		
		if (p == null){
			request.setAttribute("ERMSG", "Unable to access portfolio.");
			request.getRequestDispatcher("Manage").forward(request, response);
			
		}else{
			//Handle form variables and update portfolio description
			String description = request.getParameter("description");
			if (description.equals("")){
				request.setAttribute("ERMSG", "Description can't be empty.");
			}
			else{
				p.setDescription(description);
				db.updatePortfolio(session.getEmail_address(), p.getPortfolio_id(), p.getDescription());
				request.setAttribute("Info", "Changes saved.");
			}
			
			populatePortfolioData(p, request, response);
		}		
		
	}
	
	protected void populatePortfolioData(Portfolio p, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String success = Util.coalesce(request.getParameter("success"), "");
		if (success.equals("true")){
			request.setAttribute("Info", "Transaction Posted.");
		}else if (success.equals("false")){
			request.setAttribute("ERMSG", "Error processing transaction. Please try again.");
		}
		
		PortfolioHoldings ph = new PortfolioHoldings();
		ph.setHoldings(db.getHoldings(p));
		request.setAttribute("Holdings", ph.getHoldingsJson());		
		
		if (!ph.getLargestHolding().equals("")){
			StockSummary stocks = db.getStockSummary(ph.getLargestHolding(), 100);
			
			if (stocks != null) {
				String chartscript = new StringBuilder()
		           .append("var holdings_data = " + ph.getHoldingsChart() + ";\n")
		           .append("var plot1 = jQuery.jqplot ('holdings_pie', [holdings_data], {")
		           .append("title: 'Holdings Comparison',")
		           .append("seriesDefaults: {")
		           .append("renderer: jQuery.jqplot.PieRenderer,")
		           .append("rendererOptions: {")
		           .append("showDataLabels: true")
		           .append("}")
		           .append("}")
		           .append(",legend: { show:true, location: 'e' }")
		           .append("});\n")
		           .append("var plot_actual = " + stocks.getActuals() + ";\n")
		           .append("var plot2 = jQuery.jqplot('stock_line', [plot_actual], {title: '" + ph.getLargestHolding() + " Trend'});")
		           .toString();
				request.setAttribute("HoldingsChart", chartscript);
			}
		}
		
		
		request.setAttribute("Transactions", db.getTransactions(p.getPortfolio_id()));
		request.setAttribute("History", db.getHistory(p.getPortfolio_id()));
		request.setAttribute("Corrections", db.getCorrections(p.getPortfolio_id()));
		
		request.setAttribute("portfolio_id", p.getPortfolio_id());
		request.setAttribute("description", p.getDescription());
		request.setAttribute("created", p.getCreated());
		request.setAttribute("invested", p.getInvested_currency());
		request.setAttribute("value", p.getValue_currency());
		request.setAttribute("valuedt", p.getValuedt());
		
		request.getRequestDispatcher("portfolio.jsp").forward(request, response);		
	}


}
