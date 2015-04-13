
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
	var info = '${Info}';
	var error = '${ERMSG}';
	
	var holdings = '${Holdings}';
	var holdings_transform = {'tag':'tr','html':'<td><a href="ViewSymbol?symbol=\${symbol}">\${symbol}</a></td><td>\${quantity}</td><td>\${price_currency}</td><td>\${value_currency}</td>'};
	
	var transactions = '${Transactions}';
	var transactions_transform = {'tag':'tr','html':'<td>\${transaction_date}</td><td>\${effective_date}</td><td>\${symbol}</td><td>\${price_currency}</td><td>\${quantity}</td><td>\${amount_currency}</td>'};	
	
	var history = '${History}';
	var history_transform = {'tag':'tr','html':'<td>\${lasttradeday}</td><td>\${original_value_currency}</td><td>\${current_value_currency}</td><td>\${change_currency}</td>'};	
	
	var corrections = '${Corrections}';
	var corrections_transform = {'tag':'tr','html':'<td>\${correction_date}</td><td>\${effective_date}</td><td>\${symbol}</td><td>\${quantity}</td><td>\${status}</td>'};
	
    $('#submit').attr('disabled','disabled');
    $('#description').keyup(function(){
           if($(this).val != ''){
              $('#submit').removeAttr('disabled');
           }
    });
    
	if (info != ''){
		$('#infomsg').text(info);
		$('#infobox').show();
	}
	
	if (error != ''){
		$('#errormsg').text(error);
		$('#errorbox').show();
	}	

	if (holdings != '[]'){
		$('#holdings_table').json2html(holdings, holdings_transform); 		
	} else{
		$('#holdings').html("No holdings found. Post a transaction to add a position. You should start by adding a cash deposit.");
	}	
	
	if (transactions != '[]'){
		$('#transactions_table').json2html(transactions, transactions_transform);
	} else{
		$('#transactions').html("No transactions to display.");
	}
	
	if (history != '[]'){
		$('#history_table').json2html(history, history_transform);
	} else{
		$('#history').html("Historical values are calculated at the end of each business day.");
	}	
	
	if (corrections != '[]'){
		$('#corrections_table').json2html(corrections, corrections_transform);
	} else{
		$('#corrections').html("No corrections have posted.");
	}
	
	${HoldingsChart}
    
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
	<li class="active"><a href="ViewPortfolio?portfolio_id=${portfolio_id}">Portfolio Details</a></li>
	<li><a href="PostTransaction?portfolio_id=${portfolio_id}">Post Transaction</a></li>
	<li><a href="CreatePortfolio">Create New Portfolio</a></li>
	<li><a href="EditUser">Edit User Profile</a></li>
	<li><a href="StockSearch">Research</a></li>	
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

<form autocomplete="off" action="ViewPortfolio" method="post">
<input type="hidden" name="portfolio_id" value="${portfolio_id}">
<div class="panel panel-default">
  <div class="panel-heading">Portfolio Details</div>
  <div class="panel-body">
  	<ul class="list-group">
  		<li class="list-group-item"><span class="badge">${created}</span>Portfolio created on</li>
  		<li class="list-group-item"><span class="badge">${invested}</span>Total amount invested</li>
  		<li class="list-group-item"><span class="badge">${value}</span>Current portfolio value</li>
  		<li class="list-group-item"><span class="badge">${valuedt}</span>Current value as of</li>
	</ul>
		<div class="input-group" style="margin-bottom: 1em;">
		  <span class="input-group-addon" id="basic-addon1">Description</span>
		  <input type="text" class="form-control" value="${description}" name="description" id="description">
		</div>	
		<div class="input-group">
			<button class="btn btn-default" type="submit" id="submit"><span class="glyphicon glyphicon-floppy-disk"></span>Save Changes</button>
		</div>
  </div>
</div>
</form>

<div class="panel panel-default">
  <div class="panel-heading">Holdings</div>
  <div class="panel-body" id="holdings">
    <div>
		<table class="table">
		<thead><tr><th>Investment</th><th>Quantity</th><th>Last Trade</th><th>Current Value</th></thead>
		<tbody id="holdings_table"></tbody>
		</table>
	</div>
	
	<div class="row">
		<div class="col-md-6" id="holdings_pie" style="height:300px; width:500px;"></div>
		<div class="col-md-6" id="stock_line" style="height:300px; width:600px;"></div>
	</div>
	
  </div>
</div>

<div class="panel panel-default">
  <div class="panel-heading">Transactions</div>
  <div class="panel-body" id="transactions">
		<table class="table">
		<thead><tr><th>Transaction Post Date</th><th>Effective Date</th><th>Symbol</th><th>Price</th><th>Quantity</th><th>Amount</th></thead>
		<tbody id="transactions_table"></tbody>
		</table>
  </div>
</div>

<div class="panel panel-default">
  <div class="panel-heading">Historical Performance</div>
  <div class="panel-body" id="history">
		<table class="table">
		<thead><tr><th>Date</th><th>Original Value</th><th>Current Value (Corrected)</th><th>Adjustment</th></thead>
		<tbody id="history_table"></tbody>
		</table>
  </div>
</div>

<div class="panel panel-default">
  <div class="panel-heading">Corrections</div>
  <div class="panel-body" id="corrections">
		<table class="table">
		<thead><tr><th>Correction Date</th><th>Effective Date</th><th>Symbol</th><th>Quantity</th><th>Status</th></thead>
		<tbody id="corrections_table"></tbody>
		</table>
  </div>
</div>

</div>
</body>
</html>