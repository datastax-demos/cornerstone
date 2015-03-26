import java.util.Date;
import com.datastax.driver.core.Row;


public class TickData {
	private double Ask;
	private double AverageDailyVolume;
	private double Bid;
	private double BookValuePerShare;
	private double Change;
	private double ChangeFromFiftydayMovingAverage;
	private double ChangeFromTwoHundreddayMovingAverage;
	private double ChangeFromYearHigh;
	private double ChangeFromYearLow;
	private double ChangeInPercent;
	private double DaysHigh;
	private double DaysLow;
	private Date DividendPayDate;
	private double TrailingAnnualDividendYield;
	private double TrailingAnnualDividendYieldInPercent;
	private double DilutedEPS;
	private double EBITDA;
	private double EPSEstimateCurrentYear;
	private double EPSEstimateNextQuarter;
	private double EPSEstimateNextYear;
	private double ExDividendDate;
	private double FiftydayMovingAverage;
	private Date LastTradeDay;
	private Date LastTradeDate;
	private double LastTradePriceOnly;
	private String LastTradeTime;
	private double LowLimit;
	private String MarketCapitalization;
	private String Name;
	private double OneyrTargetPrice;
	private double Open;
	private double PEGRatio;
	private double PERatio;
	private double PercentChangeFromFiftydayMovingAverage;
	private double PercentChangeFromTwoHundreddayMovingAverage;
	private double ChangeInPercentFromYearHigh;
	private double PercentChangeFromYearLow;
	private double PreviousClose;
	private double PriceBook;
	private double PriceEPSEstimateCurrentYear;
	private double PriceEPSEstimateNextYear;
	private double PricePaid;
	private double PriceSales;
	private double Revenue;
	private String Symbol;
	private Date TradeDate;
	private double TwoHundreddayMovingAverage;
	private double Volume;
	private double YearHigh;
	private double YearLow;
	
	public TickData(Row row){
		this.setAsk(row.getDouble("Ask"));
		this.setAverageDailyVolume(row.getDouble("AverageDailyVolume"));
		this.setBid(row.getDouble("Bid"));
		this.setBookValuePerShare(row.getDouble("BookValuePerShare"));
		this.setChange(row.getDouble("Change"));
		this.setChangeFromFiftydayMovingAverage(row.getDouble("ChangeFromFiftydayMovingAverage"));
		this.setChangeFromTwoHundreddayMovingAverage(row.getDouble("ChangeFromTwoHundreddayMovingAverage"));
		this.setChangeFromYearHigh(row.getDouble("ChangeFromYearHigh"));
		this.setChangeFromYearLow(row.getDouble("ChangeFromYearLow"));
		this.setChangeInPercent(row.getDouble("ChangeInPercent"));
		this.setDaysHigh(row.getDouble("DaysHigh"));
		this.setDaysLow(row.getDouble("DaysLow"));
		this.setDividendPayDate(row.getDate("DividendPayDate"));
		this.setTrailingAnnualDividendYield(row.getDouble("TrailingAnnualDividendYield"));
		this.setTrailingAnnualDividendYieldInPercent(row.getDouble("TrailingAnnualDividendYieldInPercent"));
		this.setDilutedEPS(row.getDouble("DilutedEPS"));
		this.setEBITDA(row.getDouble("EBITDA"));
		this.setEPSEstimateCurrentYear(row.getDouble("EPSEstimateCurrentYear"));
		this.setEPSEstimateNextQuarter(row.getDouble("EPSEstimateNextQuarter"));
		this.setEPSEstimateNextYear(row.getDouble("EPSEstimateNextYear"));
		this.setExDividendDate(row.getDouble("ExDividendDate"));
		this.setFiftydayMovingAverage(row.getDouble("FiftydayMovingAverage"));
		this.setLastTradeDay(row.getDate("LastTradeDay"));
		this.setLastTradeDate(row.getDate("LastTradeDate"));
		this.setLastTradePriceOnly(row.getDouble("LastTradePriceOnly"));
		this.setLastTradeTime(row.getString("LastTradeTime"));
		this.setLowLimit(row.getDouble("LowLimit"));
		this.setMarketCapitalization(row.getString("MarketCapitalization"));
		this.setName(row.getString("Name"));
		this.setOneyrTargetPrice(row.getDouble("OneyrTargetPrice"));
		this.setOpen(row.getDouble("Open"));
		this.setPEGRatio(row.getDouble("PEGRatio"));
		this.setPERatio(row.getDouble("PERatio"));
		this.setPercentChangeFromFiftydayMovingAverage(row.getDouble("PercentChangeFromFiftydayMovingAverage"));
		this.setPercentChangeFromTwoHundreddayMovingAverage(row.getDouble("PercentChangeFromTwoHundreddayMovingAverage"));
		this.setChangeInPercentFromYearHigh(row.getDouble("ChangeInPercentFromYearHigh"));
		this.setPercentChangeFromYearLow(row.getDouble("PercentChangeFromYearLow"));
		this.setPreviousClose(row.getDouble("PreviousClose"));
		this.setPriceBook(row.getDouble("PriceBook"));
		this.setPriceEPSEstimateCurrentYear(row.getDouble("PriceEPSEstimateCurrentYear"));
		this.setPriceEPSEstimateNextYear(row.getDouble("PriceEPSEstimateNextYear"));
		this.setPricePaid(row.getDouble("PricePaid"));
		this.setPriceSales(row.getDouble("PriceSales"));
		this.setRevenue(row.getDouble("Revenue"));
		this.setSymbol(row.getString("Symbol"));
		this.setTradeDate(row.getDate("TradeDate"));
		this.setTwoHundreddayMovingAverage(row.getDouble("TwoHundreddayMovingAverage"));
		this.setVolume(row.getDouble("Volume"));
		this.setYearHigh(row.getDouble("YearHigh"));
		this.setYearLow(row.getDouble("YearLow"));
	}
	
	public double getAsk() {
		return Ask;
	}
	public void setAsk(double ask) {
		Ask = ask;
	}
	public double getAverageDailyVolume() {
		return AverageDailyVolume;
	}
	public void setAverageDailyVolume(double averageDailyVolume) {
		AverageDailyVolume = averageDailyVolume;
	}
	public double getBid() {
		return Bid;
	}
	public void setBid(double bid) {
		Bid = bid;
	}
	public double getBookValuePerShare() {
		return BookValuePerShare;
	}
	public void setBookValuePerShare(double bookValuePerShare) {
		BookValuePerShare = bookValuePerShare;
	}
	public double getChange() {
		return Change;
	}
	public void setChange(double change) {
		Change = change;
	}
	public double getChangeFromFiftydayMovingAverage() {
		return ChangeFromFiftydayMovingAverage;
	}
	public void setChangeFromFiftydayMovingAverage(
			double changeFromFiftydayMovingAverage) {
		ChangeFromFiftydayMovingAverage = changeFromFiftydayMovingAverage;
	}
	public double getChangeFromTwoHundreddayMovingAverage() {
		return ChangeFromTwoHundreddayMovingAverage;
	}
	public void setChangeFromTwoHundreddayMovingAverage(
			double changeFromTwoHundreddayMovingAverage) {
		ChangeFromTwoHundreddayMovingAverage = changeFromTwoHundreddayMovingAverage;
	}
	public double getChangeFromYearHigh() {
		return ChangeFromYearHigh;
	}
	public void setChangeFromYearHigh(double changeFromYearHigh) {
		ChangeFromYearHigh = changeFromYearHigh;
	}
	public double getChangeFromYearLow() {
		return ChangeFromYearLow;
	}
	public void setChangeFromYearLow(double changeFromYearLow) {
		ChangeFromYearLow = changeFromYearLow;
	}
	public double getChangeInPercent() {
		return ChangeInPercent;
	}
	public void setChangeInPercent(double changeInPercent) {
		ChangeInPercent = changeInPercent;
	}
	public double getDaysHigh() {
		return DaysHigh;
	}
	public void setDaysHigh(double daysHigh) {
		DaysHigh = daysHigh;
	}
	public double getDaysLow() {
		return DaysLow;
	}
	public void setDaysLow(double daysLow) {
		DaysLow = daysLow;
	}
	public Date getDividendPayDate() {
		return DividendPayDate;
	}
	public void setDividendPayDate(Date dividendPayDate) {
		DividendPayDate = dividendPayDate;
	}
	public double getTrailingAnnualDividendYield() {
		return TrailingAnnualDividendYield;
	}
	public void setTrailingAnnualDividendYield(double trailingAnnualDividendYield) {
		TrailingAnnualDividendYield = trailingAnnualDividendYield;
	}
	public double getTrailingAnnualDividendYieldInPercent() {
		return TrailingAnnualDividendYieldInPercent;
	}
	public void setTrailingAnnualDividendYieldInPercent(
			double trailingAnnualDividendYieldInPercent) {
		TrailingAnnualDividendYieldInPercent = trailingAnnualDividendYieldInPercent;
	}
	public double getDilutedEPS() {
		return DilutedEPS;
	}
	public void setDilutedEPS(double dilutedEPS) {
		DilutedEPS = dilutedEPS;
	}
	public double getEBITDA() {
		return EBITDA;
	}
	public void setEBITDA(double eBITDA) {
		EBITDA = eBITDA;
	}
	public double getEPSEstimateCurrentYear() {
		return EPSEstimateCurrentYear;
	}
	public void setEPSEstimateCurrentYear(double ePSEstimateCurrentYear) {
		EPSEstimateCurrentYear = ePSEstimateCurrentYear;
	}
	public double getEPSEstimateNextQuarter() {
		return EPSEstimateNextQuarter;
	}
	public void setEPSEstimateNextQuarter(double ePSEstimateNextQuarter) {
		EPSEstimateNextQuarter = ePSEstimateNextQuarter;
	}
	public double getEPSEstimateNextYear() {
		return EPSEstimateNextYear;
	}
	public void setEPSEstimateNextYear(double ePSEstimateNextYear) {
		EPSEstimateNextYear = ePSEstimateNextYear;
	}
	public double getExDividendDate() {
		return ExDividendDate;
	}
	public void setExDividendDate(double exDividendDate) {
		ExDividendDate = exDividendDate;
	}
	public double getFiftydayMovingAverage() {
		return FiftydayMovingAverage;
	}
	public void setFiftydayMovingAverage(double fiftydayMovingAverage) {
		FiftydayMovingAverage = fiftydayMovingAverage;
	}
	public Date getLastTradeDay() {
		return LastTradeDay;
	}
	public void setLastTradeDay(Date lastTradeDay) {
		LastTradeDay = lastTradeDay;
	}
	public Date getLastTradeDate() {
		return LastTradeDate;
	}
	public void setLastTradeDate(Date lastTradeDate) {
		LastTradeDate = lastTradeDate;
	}
	public double getLastTradePriceOnly() {
		return LastTradePriceOnly;
	}
	public void setLastTradePriceOnly(double lastTradePriceOnly) {
		LastTradePriceOnly = lastTradePriceOnly;
	}
	public String getLastTradeTime() {
		return LastTradeTime;
	}
	public void setLastTradeTime(String lastTradeTime) {
		LastTradeTime = lastTradeTime;
	}
	public double getLowLimit() {
		return LowLimit;
	}
	public void setLowLimit(double lowLimit) {
		LowLimit = lowLimit;
	}
	public String getMarketCapitalization() {
		return MarketCapitalization;
	}
	public void setMarketCapitalization(String marketCapitalization) {
		MarketCapitalization = marketCapitalization;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public double getOneyrTargetPrice() {
		return OneyrTargetPrice;
	}
	public void setOneyrTargetPrice(double oneyrTargetPrice) {
		OneyrTargetPrice = oneyrTargetPrice;
	}
	public double getOpen() {
		return Open;
	}
	public void setOpen(double open) {
		Open = open;
	}
	public double getPEGRatio() {
		return PEGRatio;
	}
	public void setPEGRatio(double pEGRatio) {
		PEGRatio = pEGRatio;
	}
	public double getPERatio() {
		return PERatio;
	}
	public void setPERatio(double pERatio) {
		PERatio = pERatio;
	}
	public double getPercentChangeFromFiftydayMovingAverage() {
		return PercentChangeFromFiftydayMovingAverage;
	}
	public void setPercentChangeFromFiftydayMovingAverage(
			double percentChangeFromFiftydayMovingAverage) {
		PercentChangeFromFiftydayMovingAverage = percentChangeFromFiftydayMovingAverage;
	}
	public double getPercentChangeFromTwoHundreddayMovingAverage() {
		return PercentChangeFromTwoHundreddayMovingAverage;
	}
	public void setPercentChangeFromTwoHundreddayMovingAverage(
			double percentChangeFromTwoHundreddayMovingAverage) {
		PercentChangeFromTwoHundreddayMovingAverage = percentChangeFromTwoHundreddayMovingAverage;
	}
	public double getChangeInPercentFromYearHigh() {
		return ChangeInPercentFromYearHigh;
	}
	public void setChangeInPercentFromYearHigh(double changeInPercentFromYearHigh) {
		ChangeInPercentFromYearHigh = changeInPercentFromYearHigh;
	}
	public double getPercentChangeFromYearLow() {
		return PercentChangeFromYearLow;
	}
	public void setPercentChangeFromYearLow(double percentChangeFromYearLow) {
		PercentChangeFromYearLow = percentChangeFromYearLow;
	}
	public double getPreviousClose() {
		return PreviousClose;
	}
	public void setPreviousClose(double previousClose) {
		PreviousClose = previousClose;
	}
	public double getPriceBook() {
		return PriceBook;
	}
	public void setPriceBook(double priceBook) {
		PriceBook = priceBook;
	}
	public double getPriceEPSEstimateCurrentYear() {
		return PriceEPSEstimateCurrentYear;
	}
	public void setPriceEPSEstimateCurrentYear(double priceEPSEstimateCurrentYear) {
		PriceEPSEstimateCurrentYear = priceEPSEstimateCurrentYear;
	}
	public double getPriceEPSEstimateNextYear() {
		return PriceEPSEstimateNextYear;
	}
	public void setPriceEPSEstimateNextYear(double priceEPSEstimateNextYear) {
		PriceEPSEstimateNextYear = priceEPSEstimateNextYear;
	}
	public double getPricePaid() {
		return PricePaid;
	}
	public void setPricePaid(double pricePaid) {
		PricePaid = pricePaid;
	}
	public double getPriceSales() {
		return PriceSales;
	}
	public void setPriceSales(double priceSales) {
		PriceSales = priceSales;
	}
	public double getRevenue() {
		return Revenue;
	}
	public void setRevenue(double revenue) {
		Revenue = revenue;
	}
	public String getSymbol() {
		return Symbol;
	}
	public void setSymbol(String symbol) {
		Symbol = symbol;
	}
	public Date getTradeDate() {
		return TradeDate;
	}
	public void setTradeDate(Date tradeDate) {
		TradeDate = tradeDate;
	}
	public double getTwoHundreddayMovingAverage() {
		return TwoHundreddayMovingAverage;
	}
	public void setTwoHundreddayMovingAverage(double twoHundreddayMovingAverage) {
		TwoHundreddayMovingAverage = twoHundreddayMovingAverage;
	}
	public double getVolume() {
		return Volume;
	}
	public void setVolume(double volume) {
		Volume = volume;
	}
	public double getYearHigh() {
		return YearHigh;
	}
	public void setYearHigh(double yearHigh) {
		YearHigh = yearHigh;
	}
	public double getYearLow() {
		return YearLow;
	}
	public void setYearLow(double yearLow) {
		YearLow = yearLow;
	}
	
}
