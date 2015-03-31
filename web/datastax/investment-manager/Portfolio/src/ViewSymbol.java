

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ViewSymbol
 */
@WebServlet("/ViewSymbol")
public class ViewSymbol extends PortfolioServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewSymbol() {
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
		
		String symbol = request.getParameter("symbol");
		if (symbol == null){
			request.setAttribute("ERMSG", "Unable to access stock information.");
			request.getRequestDispatcher("stock.jsp").forward(request, response);
			return;
		}
						
		StockSummary stocks = db.getStockSummary(symbol, 500);
		
		if (stocks == null){
			request.setAttribute("ERMSG", "Error retrieving stock details.");
			request.getRequestDispatcher("stocksearch.jsp").forward(request, response);	
		} 
		else {
			request.setAttribute("symbol", stocks.getTickData().getSymbol());
			request.setAttribute("name", stocks.getTickData().getName());
			request.setAttribute("LastTradePriceOnly", stocks.getTickData().getLastTradePriceOnly());
			request.setAttribute("Change", stocks.getTickData().getChange());
			request.setAttribute("ChangeInPercent", stocks.getTickData().getChangeInPercent());
			request.setAttribute("LastTradeDate", stocks.getTickData().getLastTradeDate());
			request.setAttribute("Bid", stocks.getTickData().getBid());
			request.setAttribute("Ask", stocks.getTickData().getAsk());
			request.setAttribute("Volume", stocks.getTickData().getVolume());
			request.setAttribute("AverageDailyVolume", stocks.getTickData().getAverageDailyVolume());
			request.setAttribute("DaysHigh", stocks.getTickData().getDaysHigh());
			request.setAttribute("DaysLow", stocks.getTickData().getDaysLow());
			request.setAttribute("PreviousClose", stocks.getTickData().getPreviousClose());
			request.setAttribute("Open", stocks.getTickData().getOpen());
			request.setAttribute("OneyrTargetPrice", stocks.getTickData().getOneyrTargetPrice());
			request.setAttribute("LowLimit", stocks.getTickData().getLowLimit());
			request.setAttribute("BookValuePerShare", stocks.getTickData().getBookValuePerShare());
			request.setAttribute("MarketCapitalization", stocks.getTickData().getMarketCapitalization());
			request.setAttribute("Revenue", stocks.getTickData().getRevenue());
			request.setAttribute("DividendPayDate", stocks.getTickData().getDividendPayDate());
			request.setAttribute("TrailingAnnualDividendYield", stocks.getTickData().getTrailingAnnualDividendYield());
			request.setAttribute("TrailingAnnualDividendYieldInPercent", stocks.getTickData().getTrailingAnnualDividendYieldInPercent());
			request.setAttribute("DilutedEPS", stocks.getTickData().getDilutedEPS());
			request.setAttribute("EBITDA", stocks.getTickData().getEBITDA());
			request.setAttribute("EPSEstimateCurrentYear", stocks.getTickData().getEPSEstimateCurrentYear());
			request.setAttribute("EPSEstimateNextQuarter", stocks.getTickData().getEPSEstimateNextQuarter());
			request.setAttribute("EPSEstimateNextYear", stocks.getTickData().getEPSEstimateNextYear());
			request.setAttribute("ExDividendDate", stocks.getTickData().getExDividendDate());
			request.setAttribute("PriceBook", stocks.getTickData().getPriceBook());
			request.setAttribute("PriceEPSEstimateCurrentYear", stocks.getTickData().getPriceEPSEstimateCurrentYear());
			request.setAttribute("PriceEPSEstimateNextYear", stocks.getTickData().getPriceEPSEstimateNextYear());
			request.setAttribute("PricePaid", stocks.getTickData().getPricePaid());
			request.setAttribute("PriceSales", stocks.getTickData().getPriceSales());
			request.setAttribute("FiftydayMovingAverage", stocks.getTickData().getFiftydayMovingAverage());
			request.setAttribute("ChangeFromFiftydayMovingAverage", stocks.getTickData().getChangeFromFiftydayMovingAverage());
			request.setAttribute("PercentChangeFromFiftydayMovingAverage", stocks.getTickData().getPercentChangeFromFiftydayMovingAverage());
			request.setAttribute("TwoHundreddayMovingAverage", stocks.getTickData().getTwoHundreddayMovingAverage());
			request.setAttribute("ChangeFromTwoHundreddayMovingAverage", stocks.getTickData().getChangeFromTwoHundreddayMovingAverage());
			request.setAttribute("PercentChangeFromTwoHundreddayMovingAverage", stocks.getTickData().getPercentChangeFromTwoHundreddayMovingAverage());
			request.setAttribute("YearHigh", stocks.getTickData().getYearHigh());
			request.setAttribute("ChangeFromYearHigh", stocks.getTickData().getChangeFromYearHigh());
			request.setAttribute("ChangeInPercentFromYearHigh", stocks.getTickData().getChangeInPercentFromYearHigh());
			request.setAttribute("YearLow", stocks.getTickData().getYearLow());
			request.setAttribute("ChangeFromYearLow", stocks.getTickData().getChangeFromYearLow());
			request.setAttribute("PercentChangeFromYearLow", stocks.getTickData().getPercentChangeFromYearLow());
			request.setAttribute("PEGRatio", stocks.getTickData().getPEGRatio());
			request.setAttribute("PERatio", stocks.getTickData().getPERatio());		
			request.setAttribute("PlotActual", stocks.getActuals());
			request.setAttribute("Plot50", stocks.get50dayMovingAverage());
			request.setAttribute("Plot200", stocks.get200dayMovingAverage());
			
			request.getRequestDispatcher("stock.jsp").forward(request, response);
		}
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
