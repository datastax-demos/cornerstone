<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DataStax Investment Manager</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="scripts/bootstrap-3.3.2-dist/css/bootstrap.min.css">
<link rel="stylesheet" href="scripts/bootstrap-3.3.2-dist/css/bootstrap-theme.min.css">

<!-- Scripts -->
<script src="scripts/jquery-latest.min.js"></script>
<script src="scripts/bootstrap-3.3.2-dist/3.3.2/js/bootstrap.min.js"></script>  
<script src="scripts/json2html.js"></script>
<script src="scripts/jquery.json2html.js"></script>

<script type="text/javascript">

$(document).ready(function(){
	//Search data
	var results = '${Results}';
	var results_transform = {'tag':'tr','html':'<td>\${exchange}</td><td><a href="ViewSymbol?symbol=\${symbol}">\${symbol}</a></td><td>\${industry}</td><td>\${marketcap}</td><td>\${name}</td><td>\${sector}</td><td>\${lasttradepricecurrency}</td>'};	
	

	//Check for search results
	if (results == '[]' || results == ''){
		$('#search_results').hide();
	} else {
	    $('#search_result').empty();
	    $('#search_result').json2html(results, results_transform);
		$('#search_results').show();
	}
	
	//Error messages	
	var error = '${ERMSG}';

	if (error != ''){
		$('#errormsg').text(error);
		$('#errorbox').show();
	}
	
	//Info Message
	var info = '${Info}';

	if (info != ''){
		$('infomsg').text(error);
		$('#infobox').show();
	}	
	
	//Check for active portfolio
	var active_portfolio = '${active_portfolio}';
	if (active_portfolio != ''){
		$('#active_portfolio_msg').text(active_portfolio);
		$('#active_portfolio_box').show();
		$('#view_port').show();
		$('#post_tran').show();
	}		
	
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

<div class="alert alert-info" id="active_portfolio_box" style="display:none">
  <span class="glyphicon glyphicon-pushpin"></span>
  <span id="active_portfolio_msg"></span>
</div>

<div class="alert alert-success" id="infobox" style="display:none">
  <span class="glyphicon glyphicon-info-sign"></span>
  <span id="infomsg"></span>
</div>


<form autocomplete="off" action="StockSearch" method="post">
<div class="panel panel-default">
  <div class="panel-heading"><span class="glyphicon glyphicon-filter"></span> Stock Search</div>
  <div class="panel-body">
		<div class="input-group" style="margin-bottom: 1em;">
		  <span class="input-group-addon" id="basic-addon1">Symbol</span>
		  <input type="text" class="form-control" placeholder="Symbol" name="symbol" value="${search_symbol}">
		</div>
		<div class="input-group" style="margin-bottom: 1em;">
		  <span class="input-group-addon" id="basic-addon1">Exchange</span>
		  <input type="text" class="form-control" placeholder="Exchange" name="exchange" value="${search_exchange}">
		</div>		
		<div class="input-group" style="margin-bottom: 1em;">
		  <span class="input-group-addon" id="basic-addon1">Industry</span>
		  <input type="text" class="form-control" placeholder="Industry" name="industry" value="${search_industry}">
		</div>
		<div class="input-group" style="margin-bottom: 1em;">
		  <span class="input-group-addon" id="basic-addon1">Name</span>
		  <input type="text" class="form-control" placeholder="Name" name="name" value="${search_name}">
		</div>
		<div class="input-group" style="margin-bottom: 1em;">
		  <span class="input-group-addon" id="basic-addon1">Sector</span>
		  <input type="text" class="form-control" placeholder="Sector" name="sector" value="${search_sector}">
		</div>
						
		<div class="input-group">
			<button class="btn btn-default" type="submit"><span class="glyphicon glyphicon-search"></span>Search</button>
		</div>
  </div>
</div>
</form>

<div class="panel panel-default" id="search_results">
  <div class="panel-heading">Search Results</div>
  <div class="panel-body">
	  		<table class="table">
				<thead><tr><th>Exchange</th><th>Symbol</th><th>Industry</th><th>Cap</th><th>Name</th><th>Sector</th><th>Last Trade</th></thead>
				<tbody id="search_result"></tbody>
			</table>
  </div>
</div>

</div>
</body>
</html>