
public final class Util {
	static final long NUM_100NS_INTERVALS_SINCE_UUID_EPOCH = 0x01b21dd213814000L;
	static final String CASH = "*CASH";
	//static final String NODE = "172.16.232.149";
	static final String NODE = "dse02";
	//static final String NODE = "75.126.138.100";
	//static final int LOAD = 4;
	static final int LOAD = 9;
	static final int SLEEP = 2000;
	static final String BEGIN_URL = "http://finance.yahoo.com/d/quotes.csv?s=";
	static final String END_URL = "&f=a0a2b0b4c1m7m5k4j5p2h0g0r1d0y0e0j4e7e9e8q0m3d1l1t1l3j1n0t8o0r5r0m8m6k5j6p0p6r6r7p1p5s6s0d2m4v0k0j0";

	//Market hours
	static final int BEGIN_TRADING_HOUR = 8;
	static final int END_TRADING_HOUR = 17;
	
	//Stock search - limit to one for simplicity
	static final int NUM_STOCKS = 1;
	
	//Coalesce function
	public static <T> T coalesce(T ...items) {
	    for(T i : items) if(i != null) return i;
	    return null;
	}	
}
