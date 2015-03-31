
public class Cleanup {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		DataStaxCluster db = new DataStaxCluster(Util.NODE, "stocks");
		
		System.out.println("Deleted Symbols: " + db.removeStocksWithNoTrades());
		System.exit(1);		
	}

}
