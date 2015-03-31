
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.URL;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.TimeZone;

import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVRecord;


public class GetTickData {

	public static void main(String[] args) throws InterruptedException {
		// TODO Add multiple loads and check date
		
		String node;
		if (args.length == 0){
			node = Util.NODE;
		}
		else{
			node = args[0];
		}
		
		DataStaxCluster db = new DataStaxCluster(node, "stocks");
		List<String> URL_list = new ArrayList<String>();
		
		for (int i=0; i<Util.LOAD; i++){
			URL_list.add(Util.BEGIN_URL + db.getSymbols(node, i+1) + Util.END_URL);
			//debug
			System.out.println(URL_list.get(i));
		}
		
		// Regular market hours are 9:30 a.m. to 4 p.m. Eastern Time
		// This app will only run between 9 and 5
		while (isMarketOpen()){
			for (String url : URL_list){
				processDataStream(db, url);
				Thread.sleep(Util.SLEEP);
			}
		}
		
		System.out.println("Market closed.");
		System.exit(1);
	}
	
	public static boolean isMarketOpen(){
		Calendar cal = Calendar.getInstance();
		cal.setTimeZone(TimeZone.getTimeZone("America/New_York"));
		int hour = cal.get(Calendar.HOUR_OF_DAY);
		int day = cal.get(Calendar.DAY_OF_WEEK);
		
		if (day == Calendar.SATURDAY || day == Calendar.SUNDAY) return false;
		
		return (hour >= Util.BEGIN_TRADING_HOUR && hour < Util.END_TRADING_HOUR);
	}
	
	
	public static void processDataStream(DataStaxCluster db, String url){
		try {
			InputStream data = new URL(url).openStream();
			Reader datareader = new InputStreamReader(data, "UTF-8");
			Iterable<CSVRecord> stockquotes = CSVFormat.EXCEL.parse(datareader);
			
			for (CSVRecord stockquote : stockquotes) {
				Quote quote = new Quote(stockquote);
				try {
					db.writeTickData(quote);
				} catch (Exception e){
					quote.debug();
					e.printStackTrace();
				}
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
