
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
	var info = '${Info}';
	var error = '${ERMSG}';
	var portfolios = '${Portfolios}';
	var transform = {'tag':'tr','html':'<td><a href="ViewPortfolio?portfolio_id=\${portfolio_id}">\${description}</a></td><td>\${created}</td><td>\${invested_currency}</td><td>\${value_currency}</td><td>\${valuedt}</td>'};

	if (info != ''){
		$('#infomsg').text(info);
		$('#infobox').show();
	}
	
	if (error != ''){
		$('#errormsg').text(error);
		$('#errorbox').show();
	}	
	
	if (portfolios != '[]'){
		$('#portfolio_table').json2html(portfolios, transform);
	} else{
		$('#portfolios').html("No portfolios found. Try adding one.");
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
	<li class="active"><a href="Manage">Manage Portfolios</a></li>
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

<div class="panel panel-default">
  <div class="panel-heading">Active Portfolios</div>
  <div class="panel-body" id="portfolios">
		<table class="table">
		<thead><tr><th>Description</th><th>Created</th><th>Invested</th><th>Value</th><th>Last Updated</th></tr></thead>
		<tbody id="portfolio_table"></tbody>
		</table>
  </div>
</div>




</div>
</body>
</html>