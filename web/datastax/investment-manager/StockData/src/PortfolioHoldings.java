import java.util.List;

import com.google.gson.Gson;


public class PortfolioHoldings {
	private List<Holding> holdings;
	
	private double value;
	private String symbol;
	
	public PortfolioHoldings(){
		value=0;
		symbol="";
	}
	
	public List<Holding> getHoldings() {
		return holdings;
	}

	public void setHoldings(List<Holding> holdings) {
		this.holdings = holdings;
	}
	
	public String getHoldingsJson(){
		return new Gson().toJson(holdings);
	}
	
	public String getHoldingsChart(){
		if (holdings == null) return "";
		
		String chartdata = "[";
		for (Holding holding: holdings){
			checkHolding(holding);
			chartdata += holding.getChartData() + ",";
		}
		chartdata += "]";
		return chartdata;
	}
	
	private void checkHolding(Holding h){
		if (h.getSymbol().equals(Util.CASH)) return;
		
		if (h.getValue() > this.value){
			this.symbol = h.getSymbol();
			this.value = h.getValue();
		}
	}
	
	void checkHoldings(){
		for (Holding holding: holdings){
			checkHolding(holding);
		}
	}
	
	public String getLargestHolding(){
		if (symbol.equals("")) checkHoldings();
		return symbol;
	}
	
}
