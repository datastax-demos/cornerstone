
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DataStax Portfolio Manager</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="scripts/bootstrap-3.3.2-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="scripts/bootstrap-3.3.2-dist/css/bootstrap-theme.min.css">

<!-- Scripts -->
<script src="scripts/jquery-latest.min.js"></script>
<script src="scripts/bootstrap-3.3.2-dist/3.3.2/js/bootstrap.min.js"></script>  
<script src="scripts/json2html.js"></script>
<script src="scripts/jquery.json2html.js"></script>
<script src="scripts/bootstrap-3.3.2-dist/js/bootstrap-typeahead.js"></script>
<script type="text/javascript" src="scripts/moment/min/moment.min.js"></script>
<script type="text/javascript" src="scripts/datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>

<script type="text/javascript">

function initialize() {
	var info = '${Info}';

	if (info != ''){
		$('#infomsg').text(info);
		$('#infobox').show();
	}
	
	$('#effective_date').hide();
	$('#symbol').show();
	$('#quantity').attr("placeholder", "Enter number of shares.");
	
	//Disable autocomplete on all input items
	('input').autocomplete="off";
	
}


$(document).ready(function() {

    $('input[type=radio][name=transaction_type]').change(function() {
        if (this.value == 'Trade') {
        	$('#effective_date').hide();
        	$('#symbol').show();
        	$('#quantity').attr("placeholder", "Enter number of shares.");	
        }
        else if (this.value == 'Deposit') {
        	$('#effective_date').hide();
        	$('#symbol').hide();
        	$('#quantity').attr("placeholder", "Enter amount of deposit.");	
        }
        else if (this.value == 'Correction') {
        	$('#effective_date').show();
        	$('#symbol').show();
        	$('#quantity').attr("placeholder", "Enter number of shares.");	
        }
    });
    
	$('#effective_date').datetimepicker(); 
	
});


</script>

</head>
<body onload="initialize()">
<div class="container">

<div class="page-header">
	<h3><img src="images/logo.png"><span class="pull-right">Investment Manager</span></h3>
</div>

<nav class="navbar navbar-default">
<ul class="nav navbar-nav">
	<li><a href="Manage">Manage Portolios</a></li>
	<li><a href="ViewPortfolio?portfolio_id=${portfolio_id}">Portolio Details</a></li>
	<li class="active"><a href="PostTransaction?portfolio_id=${portfolio_id}">Post Transaction</a></li>
	<li><a href="CreatePortfolio">Create New Portolio</a></li>
	<li><a href="EditUser">Edit User Profile</a></li>
</ul>
<p class="navbar-text pull-right">Signed in as ${Username}</p>
</nav>

<div class="alert alert-success" id="infobox" style="display:none">
  <span class="glyphicon glyphicon-info-sign"></span>
  <span id="infomsg"></span>
</div>

<form action="PostTransaction" method="post">
<input type="hidden" name="portfolio_id" value="${portfolio_id}">
<div class="panel panel-default">
  <div class="panel-heading">Enter Transaction Details</div>
  <div class="panel-body">
	<div class="row" style="margin-bottom: 1em;">
  		<div class="col-lg-4">	
			<div class="input-group">
			  <span class="input-group-addon"><input type="radio" name="transaction_type" id="tt_trade" value="Trade" checked></span>
			  <span class="form-control">Trade</span>
			</div>
		</div>	
  		<div class="col-lg-4">	
			<div class="input-group">
			  <span class="input-group-addon"><input type="radio" name="transaction_type" id="tt_deposit" value="Deposit"></span>
			  <span class="form-control">Deposit/Withdrawal</span>
			</div>
		</div>
  		<div class="col-lg-4">	
			<div class="input-group">
			  <span class="input-group-addon"><input type="radio" name="transaction_type" id="tt_correction" value="Correction"></span>
			  <span class="form-control">Correction</span>
			</div>
		</div>
	</div>
	<div class="input-group date" style="margin-bottom: 1em;" id="effective_date">
	  <span class="input-group-addon" id="basic-addon1">Effective Date</span>
	  <input type="text" class="form-control" name="effective_date">
	  <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
	</div>
	<div class="input-group" style="margin-bottom: 1em;" id="symbol">
	  <span class="input-group-addon" id="basic-addon1">Symbol</span>
	  <input type="text" class="form-control" name="symbol" data-provide="typeahead" data-items="10" data-source='["AA",	"AAL",	"AAPL",	"ABBV",	"ABX",	"ACHN",	"AIG",	"AMAT",	"AMGN",	"AMZN",	"APC",	"APOL",	"ARCP",	"AUY",	"AVP",	"AZN",	"BA",	"BABA",	"BAC",	"BBRY",	"BBY",	"BIDU",	"BMY",	"BP",	"BTU",	"BX",	"C",	"CAR",	"CAT",	"CBI",	"CBS",	"CELG",	"CHK",	"CIM",	"CLF",	"CMCSA",	"CME",	"COP",	"CSCO",	"CVX",	"DAL",	"DD",	"DDD",	"DE",	"DG",	"DIA",	"DIS",	"DOW",	"DRYS",	"DXJ",	"EBAY",	"EEM",	"EFA",	"EMC",	"EOG",	"ESRX",	"EWZ",	"EXAS",	"F",	"FB",	"FCX",	"FEYE",	"FXE",	"FXI",	"GDP",	"GDX",	"GE",	"GG",	"GILD",	"GLD",	"GLW",	"GM",	"GMCR",	"GNW",	"GOOG",	"GOOGL",	"GPRO",	"GRPN",	"GS",	"HAL",	"HD",	"HES",	"HLF",	"HPQ",	"HTZ",	"HYG",	"IBB",	"IBM",	"INTC",	"INVN",	"ISIS",	"IWM",	"IYR",	"JCP",	"JD",	"JNJ",	"JPM",	"KMI",	"KO",	"KORS",	"KRFT",	"LINE",	"LNG",	"LNKD",	"LULU",	"LVS",	"MA",	"MCD",	"MET",	"MGM",	"MO",	"MRK",	"MS",	"MSFT",	"MU",	"NE",	"NEM",	"NFLX",	"NKE",	"NLY",	"NQ",	"NSM",	"NUGT",	"NVDA",	"OCN",	"OIH",	"ORCL",	"OXY",	"PBR",	"PCLN",	"PFE",	"PG",	"POT",	"QCOM",	"QQQ",	"RAD",	"RICE",	"RIG",	"RSH",	"RSX",	"S",	"SBUX",	"SCTY",	"SD",	"SDRL",	"SDS",	"SIRI",	"SLB",	"SLV",	"SLW",	"SNDK",	"SO",	"SPLS",	"SPY",	"SUNE",	"SVXY",	"T",	"TBT",	"TEVA",	"TGT",	"TLT",	"TNA",	"TSLA",	"TSO",	"TWTR",	"TZA",	"UAL",	"UNG",	"UPS",	"USB",	"USO",	"UUP",	"UVXY",	"VALE",	"VLO",	"VXX",	"VZ",	"WAG",	"WFC",	"WLL",	"WMB",	"WMT",	"WYNN",	"X",	"XLE",	"XLF",	"XLU",	"XLY",	"XOM",	"XOP",	"XRT",	"XRX",	"YELP",	"YHOO",	"ZNGA"]'>
	</div>
	<div class="input-group" style="margin-bottom: 1em;">
	  <span class="input-group-addon" id="basic-addon1">Amount</span>
	  <input type="text" class="form-control" placeholder="Enter quantity." name="quantity" id="quantity" autocomplete="off">
	</div>
	<div class="input-group">
		<button class="btn btn-default" type="submit" id="submit"><span class="glyphicon glyphicon-floppy-disk"></span>Send Transaction</button>
	</div>
  </div>
</div>
</form>


</div>
</body>
</html>