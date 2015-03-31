import java.util.ArrayList;
import java.util.List;

import com.datastax.driver.core.ResultSet;
import com.datastax.driver.core.Row;
import com.google.gson.Gson;


public class StockSummary {
	private TickData td;
	private List<TickPlot> plots;
	
	private String ma50;
	private String ma200;
	private String actual;
	
	public StockSummary(ResultSet results){
		plots = new ArrayList<TickPlot>();
		boolean firstrow = true;
		ma50 = "";
		ma200 = "";
		actual = "";
		
		for (Row row: results){
			if (firstrow){
				td = new TickData(row);
				firstrow = false;
			}
			TickPlot tp = new TickPlot(row);
			plots.add(tp);
			ma50 = tp.getData50MA() + "," + ma50;
			ma200 = tp.getData200MA() + "," + ma200;
			actual = tp.getDataActual() + "," + actual;
		}
	}
	
	public String getTickDataJson(){
		return new Gson().toJson(td);
	}
	
	public TickData getTickData(){
		return td;
	}
	
	public String get50dayMovingAverage(){
		return "[" + ma50 + "]";
	}
	
	public String get200dayMovingAverage(){
		return "[" + ma200 + "]";
	}	

	public String getActuals(){
		return "[" + actual + "]";
	}	
}
