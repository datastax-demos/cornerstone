import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.csv.CSVRecord;


public class Quote {

	public QVal Ask;
	public QVal AverageDailyVolume;
	public QVal Bid;
	public QVal BookValuePerShare;
	public QVal Change;
	public QVal ChangeFromFiftydayMovingAverage;
	public QVal ChangeFromTwoHundreddayMovingAverage;
	public QVal ChangeFromYearHigh;
	public QVal ChangeFromYearLow;
	public QVal ChangeInPercent;
	public QVal DaysHigh;
	public QVal DaysLow;
	public Date DividendPayDate;
	public QVal TrailingAnnualDividendYield;
	public QVal TrailingAnnualDividendYieldInPercent;
	public QVal DilutedEPS;
	public QVal EBITDA;
	public QVal EPSEstimateCurrentYear;
	public QVal EPSEstimateNextQuarter;
	public QVal EPSEstimateNextYear;
	public Date ExDividendDate;
	public QVal FiftydayMovingAverage;
	public Date LastTradeDay;
	public Date LastTradeDate;
	public QVal LastTradePriceOnly;
	public String LastTradeTime;
	public QVal LowLimit;
	public String MarketCapitalization;
	public String Name;
	public QVal OneyrTargetPrice;
	public QVal Open;
	public QVal PEGRatio;
	public QVal PERatio;
	public QVal PercentChangeFromFiftydayMovingAverage;
	public QVal PercentChangeFromTwoHundreddayMovingAverage;
	public QVal ChangeInPercentFromYearHigh;
	public QVal PercentChangeFromYearLow;
	public QVal PreviousClose;
	public QVal PriceBook;
	public QVal PriceEPSEstimateCurrentYear;
	public QVal PriceEPSEstimateNextYear;
	public QVal PricePaid;
	public QVal PriceSales;
	public QVal Revenue;
	public String Symbol;
	public Date TradeDate;
	public QVal TwoHundreddayMovingAverage;
	public QVal Volume;
	public QVal YearHigh;
	public QVal YearLow;
	
	public Quote(CSVRecord stockquote){
		this.Ask = new QVal(stockquote.get(0));
		this.AverageDailyVolume = new QVal(stockquote.get(1));
		this.Bid = new QVal(stockquote.get(2));
		this.BookValuePerShare = new QVal(stockquote.get(3));
		this.Change = new QVal(stockquote.get(4));
		this.ChangeFromFiftydayMovingAverage = new QVal(stockquote.get(5));
		this.ChangeFromTwoHundreddayMovingAverage = new QVal(stockquote.get(6));
		this.ChangeFromYearHigh = new QVal(stockquote.get(7));
		this.ChangeFromYearLow = new QVal(stockquote.get(8));
		this.ChangeInPercent = new QVal(stockquote.get(9));
		this.DaysHigh = new QVal(stockquote.get(10));
		this.DaysLow = new QVal(stockquote.get(11));
		this.DividendPayDate = getDate(stockquote.get(12));
		this.TrailingAnnualDividendYield = new QVal(stockquote.get(13));
		this.TrailingAnnualDividendYieldInPercent = new QVal(stockquote.get(14));
		this.DilutedEPS = new QVal(stockquote.get(15));
		this.EBITDA = new QVal(stockquote.get(16));
		this.EPSEstimateCurrentYear = new QVal(stockquote.get(17));
		this.EPSEstimateNextQuarter = new QVal(stockquote.get(18));
		this.EPSEstimateNextYear = new QVal(stockquote.get(19));
		this.ExDividendDate = getDate(stockquote.get(20));
		this.FiftydayMovingAverage = new QVal(stockquote.get(21));
		
		this.LastTradeDay = getDate(stockquote.get(22));
		this.LastTradeDate = getDateTime(stockquote.get(22),stockquote.get(24));
		this.LastTradePriceOnly = new QVal(stockquote.get(23));
		this.LastTradeTime = getString(stockquote.get(24));
		
		this.LowLimit = new QVal(stockquote.get(25));
		this.MarketCapitalization = getString(stockquote.get(26));
		this.Name = getString(stockquote.get(27));
		this.OneyrTargetPrice = new QVal(stockquote.get(28));
		this.Open = new QVal(stockquote.get(29));
		this.PEGRatio = new QVal(stockquote.get(30));
		this.PERatio = new QVal(stockquote.get(31));
		this.PercentChangeFromFiftydayMovingAverage = new QVal(stockquote.get(32));
		this.PercentChangeFromTwoHundreddayMovingAverage = new QVal(stockquote.get(33));
		this.ChangeInPercentFromYearHigh = new QVal(stockquote.get(34));
		this.PercentChangeFromYearLow = new QVal(stockquote.get(35));
		this.PreviousClose = new QVal(stockquote.get(36));
		this.PriceBook = new QVal(stockquote.get(37));
		this.PriceEPSEstimateCurrentYear = new QVal(stockquote.get(38));
		this.PriceEPSEstimateNextYear = new QVal(stockquote.get(39));
		this.PricePaid = new QVal(stockquote.get(40));
		this.PriceSales = new QVal(stockquote.get(41));
		this.Revenue = new QVal(stockquote.get(42));
		this.Symbol = getString(stockquote.get(43));
		this.TradeDate = getDate(stockquote.get(44));
		this.TwoHundreddayMovingAverage = new QVal(stockquote.get(45));
		this.Volume = new QVal(stockquote.get(46));
		this.YearHigh = new QVal(stockquote.get(47));
		this.YearLow = new QVal(stockquote.get(48));
	}
	
	private Date getDate(String sDate){
		Date date;

		//Three possible date formats. Thanks Yahoo.
		DateFormat format1 = new SimpleDateFormat("MM/dd/yy");
		DateFormat format2 = new SimpleDateFormat("MMM dd");
		DateFormat format3 = new SimpleDateFormat("dd-MMM-yy");
		
		try {
			date = format1.parse(sDate);
		} catch (ParseException e) {
			try {
				date = format2.parse(sDate);
			} catch (ParseException e1) {
				try {
					date = format3.parse(sDate);
				} catch (ParseException e2) {
					date = null;
					//System.out.println(sDate);
				}
			}
		}
		
		return date;
	}
	
	private Date getDateTime(String sDate, String sTime){
		Date date;
		DateFormat format = new SimpleDateFormat("MM/dd/yy hh:mmaa");
		try {
			date = format.parse(sDate + " " + sTime);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			date = null;
		}
		
		return date;
	}
	
	private String getString(String strval){
		if (strval.equalsIgnoreCase("N/A") || strval.equalsIgnoreCase("-")) return null;
		return strval;
	}
	
	public void debug(){
		System.out.println("Ask:   " + Ask.getValue());
		System.out.println("AverageDailyVolume:   " + AverageDailyVolume.getValue());
		System.out.println("Bid:   " + Bid.getValue());
		System.out.println("BookValuePerShare:   " + BookValuePerShare.getValue());
		System.out.println("Change:   " + Change.getValue());
		System.out.println("ChangeFromFiftydayMovingAverage:   " + ChangeFromFiftydayMovingAverage.getValue());
		System.out.println("ChangeFromTwoHundreddayMovingAverage:   " + ChangeFromTwoHundreddayMovingAverage.getValue());
		System.out.println("ChangeFromYearHigh:   " + ChangeFromYearHigh.getValue());
		System.out.println("ChangeFromYearLow:   " + ChangeFromYearLow.getValue());
		System.out.println("ChangeInPercent:   " + ChangeInPercent.getValue());
		System.out.println("DaysHigh:   " + DaysHigh.getValue());
		System.out.println("DaysLow:   " + DaysLow.getValue());
		System.out.println("DividendPayDate:   " + DividendPayDate);
		System.out.println("TrailingAnnualDividendYield:   " + TrailingAnnualDividendYield.getValue());
		System.out.println("TrailingAnnualDividendYieldInPercent:   " + TrailingAnnualDividendYieldInPercent.getValue());
		System.out.println("DilutedEPS:   " + DilutedEPS.getValue());
		System.out.println("EBITDA:   " + EBITDA.getValue());
		System.out.println("EPSEstimateCurrentYear:   " + EPSEstimateCurrentYear.getValue());
		System.out.println("EPSEstimateNextQuarter:   " + EPSEstimateNextQuarter.getValue());
		System.out.println("EPSEstimateNextYear:   " + EPSEstimateNextYear.getValue());
		System.out.println("ExDividendDate:   " + ExDividendDate);
		System.out.println("FiftydayMovingAverage:   " + FiftydayMovingAverage.getValue());
		System.out.println("LastTradeDate:   " + LastTradeDate);
		System.out.println("LastTradePriceOnly:   " + LastTradePriceOnly.getValue());
		System.out.println("LastTradeTime:   " + LastTradeTime);
		System.out.println("LowLimit:   " + LowLimit.getValue());
		System.out.println("MarketCapitalization:   " + MarketCapitalization);
		System.out.println("Name:   " + Name);
		System.out.println("OneyrTargetPrice:   " + OneyrTargetPrice.getValue());
		System.out.println("Open:   " + Open.getValue());
		System.out.println("PEGRatio:   " + PEGRatio.getValue());
		System.out.println("PERatio:   " + PERatio.getValue());
		System.out.println("PercentChangeFromFiftydayMovingAverage:   " + PercentChangeFromFiftydayMovingAverage.getValue());
		System.out.println("PercentChangeFromTwoHundreddayMovingAverage:   " + PercentChangeFromTwoHundreddayMovingAverage.getValue());
		System.out.println("ChangeInPercentFromYearHigh:   " + ChangeInPercentFromYearHigh.getValue());
		System.out.println("PercentChangeFromYearLow:   " + PercentChangeFromYearLow.getValue());
		System.out.println("PreviousClose:   " + PreviousClose.getValue());
		System.out.println("PriceBook:   " + PriceBook.getValue());
		System.out.println("PriceEPSEstimateCurrentYear:   " + PriceEPSEstimateCurrentYear.getValue());
		System.out.println("PriceEPSEstimateNextYear:   " + PriceEPSEstimateNextYear.getValue());
		System.out.println("PricePaid:   " + PricePaid.getValue());
		System.out.println("PriceSales:   " + PriceSales.getValue());
		System.out.println("Revenue:   " + Revenue.getValue());
		System.out.println("Symbol:   " + Symbol);
		System.out.println("TradeDate:   " + TradeDate);
		System.out.println("TwoHundreddayMovingAverage:   " + TwoHundreddayMovingAverage.getValue());
		System.out.println("Volume:   " + Volume.getValue());
		System.out.println("YearHigh:   " + YearHigh.getValue());
		System.out.println("YearLow:   " + YearLow.getValue());
	}
}
