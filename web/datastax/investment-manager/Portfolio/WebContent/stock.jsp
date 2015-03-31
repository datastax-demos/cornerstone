
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DataStax Investment Manager</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="scripts/bootstrap-3.3.2-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="scripts/bootstrap-3.3.2-dist/css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" href="scripts/jqplot/jquery.jqplot.css" />

<!-- Scripts -->
<script src="scripts/jquery-latest.min.js"></script>
<script src="scripts/bootstrap-3.3.2-dist/3.3.2/js/bootstrap.min.js"></script>  
<script src="scripts/json2html.js"></script>
<script src="scripts/jquery.json2html.js"></script>
<script language="javascript" type="text/javascript" src="scripts/jqplot/jquery.jqplot.min.js"></script>
<script type="text/javascript" src="scripts/jqplot/plugins/jqplot.pieRenderer.min.js"></script>

<script type="text/javascript">

$(document).ready(function(){
	var active_portfolio = '${active_portfolio}';
	var error = '${ERMSG}';
	var info = '${Info}';
		
	if (info != ''){
		$('#infomsg').text(info);
		$('#infobox').show();
	}
	
	if (error != ''){
		$('#errormsg').text(error);
		$('#errorbox').show();
	}
	
	if (active_portfolio != ''){
		$('#active_portfolio_msg').text(active_portfolio);
		$('#active_portfolio_box').show();
		$('#view_port').show();
		$('#post_tran').show();
		$('#trade_link').show();
	}
	
	//Highlight changes
	var change = ${Change};
	
	if (change > 0){
		$('#Change').toggleClass("alert-success");
		$('#ChangeInPercent').toggleClass("alert-success");
		$('#LastTradePriceOnly').toggleClass("alert-success");
	}
	else if (change > 0){
		$('#Change').toggleClass("alert-danger");
		$('#ChangeInPercent').toggleClass("alert-danger");
		$('#LastTradePriceOnly').toggleClass("alert-danger");
	}
	else {
		$('#Change').toggleClass("alert-warning");
		$('#ChangeInPercent').toggleClass("alert-warning");
		$('#LastTradePriceOnly').toggleClass("alert-warning");
	}	
    
	//Chart data
    var data_actual = ${PlotActual};
    var data_50 = ${Plot50};
    var data_200 = ${Plot200};

    //labels = ['Actual', '50-day', '200-day']
    var plot_stock_data = jQuery.jqplot('stock_line', [data_actual, data_50, data_200], {title: 'Intraday Trend (Last 500 Trading Minutes)', legend: { show:true, location: 'e'}, series: [{label: 'Actual'}, {label: '50-day'}, {label: '200-day'}]});     
    
});

</script>

</head>
<body>
<div class="container">

<div class="page-header">
	<h3><img src="images/logo.png"><span class="pull-right"><span class="glyphicon glyphicon-briefcase"></span>  Investment Manager</span></h3>
</div>

<nav class="navbar navbar-default">
<ul class="nav navbar-nav">
	<li><a href="Manage">Manage Portfolios</a></li>
	<li id="view_port" style="display:none"><a href="ViewPortfolio">Portfolio Details</a></li>
	<li id="post_tran" style="display:none"><a href="PostTransaction">Post Transaction</a></li>	
	<li><a href="CreatePortfolio">Create New Portfolio</a></li>
	<li><a href="EditUser">Edit User Profile</a></li>
	<li class="active"><a href="StockSearch">Research</a></li>	
</ul>
<p class="navbar-text pull-right">Signed in as ${Username}</p>
</nav>

<div class="alert alert-danger" id="errorbox" style="display:none">
  <span class="glyphicon glyphicon-exclamation-sign"></span>
  <span id="errormsg"></span>
</div>

<div class="alert alert-success" id="infobox" style="display:none">
  <span class="glyphicon glyphicon-info-sign"></span>
  <span id="infomsg"></span>
</div>

<div class="alert alert-info" id="active_portfolio_box" style="display:none">
  <span class="glyphicon glyphicon-pushpin"></span>
  <span id="active_portfolio_msg"></span>
</div>

<div class="panel panel-default">
  <div class="panel-heading">
	<h3>${name}   <span class="label label-info">${symbol}</span> <span class="pull-right" id="trade_link" style="display:none"><a href="PostTransaction?symbol=${symbol}"><span class="label label-success">Trade</span></a></span></h3>
  </div>	
  <div class="panel-body">
  
  <div class="row">
	<div class="col-md-4">
    <ul class="list-group">
  		<li class="list-group-item"><span class="badge" id="LastTradePriceOnly">${LastTradePriceOnly}</span>LastTradePriceOnly</li>
  		<li class="list-group-item"><span class="badge" id="Change">${Change}</span>Change</li>
  		<li class="list-group-item"><span class="badge" id="ChangeInPercent">${ChangeInPercent}</span>ChangeInPercent</li>
  		<li class="list-group-item"><span class="badge">${LastTradeDate}</span>LastTradeDate</li>	
  		<li class="list-group-item"><span class="badge">${Bid}</span>Bid</li>
  		<li class="list-group-item"><span class="badge">${Ask}</span>Ask</li>
  		<li class="list-group-item"><span class="badge">${Volume}</span>Volume</li>
  		<li class="list-group-item"><span class="badge">${AverageDailyVolume}</span>AverageDailyVolume</li> 	
   		<li class="list-group-item"><span class="badge alert-success">${DaysHigh}</span>DaysHigh</li>
  		<li class="list-group-item"><span class="badge alert-warning">${DaysLow}</span>DaysLow</li>
  		<li class="list-group-item"><span class="badge">${PreviousClose}</span>PreviousClose</li>
  		<li class="list-group-item"><span class="badge">${Open}</span>Open</li>
   		<li class="list-group-item"><span class="badge">${OneyrTargetPrice}</span>OneyrTargetPrice</li>
  		<li class="list-group-item"><span class="badge">${LowLimit}</span>LowLimit</li>
  		<li class="list-group-item"><span class="badge">${PriceEPSEstimateNextYear}</span>PriceEPSEstimateNextYear</li>  	 			
	</ul>
	</div>

	<div class="col-md-4"> 
    <ul class="list-group">
		<li class="list-group-item"><span class="badge">${BookValuePerShare}</span>BookValuePerShare</li>
		<li class="list-group-item"><span class="badge">${MarketCapitalization}</span>MarketCapitalization</li>
		<li class="list-group-item"><span class="badge">${Revenue}</span>Revenue</li>
		<li class="list-group-item"><span class="badge">${DividendPayDate}</span>DividendPayDate</li>
		<li class="list-group-item"><span class="badge">${TrailingAnnualDividendYield}</span>TrailingAnnualDividendYield</li>
		<li class="list-group-item"><span class="badge">${TrailingAnnualDividendYieldInPercent}</span>TrailingAnnualDividendYieldInPercent</li>
		<li class="list-group-item"><span class="badge">${DilutedEPS}</span>DilutedEPS</li>
		<li class="list-group-item"><span class="badge">${EBITDA}</span>EBITDA</li>
		<li class="list-group-item"><span class="badge">${EPSEstimateCurrentYear}</span>EPSEstimateCurrentYear</li>
		<li class="list-group-item"><span class="badge">${EPSEstimateNextQuarter}</span>EPSEstimateNextQuarter</li>
		<li class="list-group-item"><span class="badge">${EPSEstimateNextYear}</span>EPSEstimateNextYear</li>
		<li class="list-group-item"><span class="badge">${ExDividendDate}</span>ExDividendDate</li>
		<li class="list-group-item"><span class="badge">${PriceBook}</span>PriceBook</li>
		<li class="list-group-item"><span class="badge">${PriceEPSEstimateCurrentYear}</span>PriceEPSEstimateCurrentYear</li>	
		<li class="list-group-item"><span class="badge">${PricePaid}</span>PricePaid</li>
	</ul>
	</div> 
	
	<div class="col-md-4"> 
    <ul class="list-group">
		<li class="list-group-item"><span class="badge">${FiftydayMovingAverage}</span>50dayMovingAverage</li>
		<li class="list-group-item"><span class="badge">${ChangeFromFiftydayMovingAverage}</span>ChangeFrom50dayMovingAverage</li>
		<li class="list-group-item"><span class="badge">${PercentChangeFromFiftydayMovingAverage}</span>%ChangeFrom50dayMovingAverage</li>
		<li class="list-group-item"><span class="badge">${TwoHundreddayMovingAverage}</span>200dayMovingAverage</li>
		<li class="list-group-item"><span class="badge">${ChangeFromTwoHundreddayMovingAverage}</span>ChangeFrom200dayMovingAverage</li>
		<li class="list-group-item"><span class="badge">${PercentChangeFromTwoHundreddayMovingAverage}</span>%Change200dayMovingAverage</li>
		<li class="list-group-item"><span class="badge">${YearHigh}</span>YearHigh</li>
		<li class="list-group-item"><span class="badge">${ChangeFromYearHigh}</span>ChangeFromYearHigh</li>
		<li class="list-group-item"><span class="badge">${ChangeInPercentFromYearHigh}</span>ChangeInPercentFromYearHigh</li>
		<li class="list-group-item"><span class="badge">${YearLow}</span>YearLow</li>
		<li class="list-group-item"><span class="badge">${ChangeFromYearLow}</span>ChangeFromYearLow</li>
		<li class="list-group-item"><span class="badge">${PercentChangeFromYearLow}</span>PercentChangeFromYearLow</li>
		<li class="list-group-item"><span class="badge">${PEGRatio}</span>PEGRatio</li>
		<li class="list-group-item"><span class="badge">${PERatio}</span>PERatio</li>
		<li class="list-group-item"><span class="badge">${PriceSales}</span>PriceSales</li>
	</ul>
	</div> 
 </div>		
  
	<div id="stock_line" style="height:600px; width:1100px;">
  </div>
</div>


</div>
</body>
</html>