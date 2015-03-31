
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
<script type="text/javascript" src="scripts/moment/min/moment.min.js"></script>
<script type="text/javascript" src="scripts/datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>

<script type="text/javascript">

$(document).ready(function() {
	var price;
	var info = '${Info}';
	var results_transform = {'tag':'tr','html':'<td>\${exchange}</td><td>\${symbol}</td><td>\${industry}</td><td>\${marketcap}</td><td>\${name}</td><td>\${sector}</td><td>\${lasttradepricecurrency}</td>'};	

	if (info != ''){
		$('#infomsg').text(info);
		$('#infobox').show();
	}
	
	//Check for active portfolio
	var active_portfolio = '${active_portfolio}';
	if (active_portfolio != ''){
		$('#active_portfolio_msg').text(active_portfolio);
		$('#active_portfolio_box').show();
	}		
	
	$('#effective_date').hide();
	$('#symbol').show();
	$('#quantity').attr("placeholder", "Enter number of shares.");
	
	//Hide search results
	$('#search_results').hide();
	
	//Disable submit button
	$('#submit').prop('disabled', true);

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
	
	
	$("#symbol_search").keyup(function () {
		var search = $('#symbol_search').val();
        if (search != "") {
            $.ajax({
                type: "GET",
                url: "SearchSymbol",
                data: {
                    's' : search
                },
                dataType: "text",
                success: function(results){
                    //Process search results
                    $('#search_result').empty();
                    $('#search_result').json2html(results, results_transform);
                	$('#search_results').show();
                    }
                });
        }
        else{
        	$('#search_results').hide();
        }
    });	
	
	$('#quantity').keyup(function () {
		var q = $('#quantity').val();
		$('#submit').prop('disabled', (q == ""));
    });
	
	
	//Check for symbol
	var symbol = '${symbol}';
	if (symbol != ''){
		$("#symbol_search").keyup();
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
	<li><a href="ViewPortfolio?portfolio_id=${portfolio_id}">Portfolio Details</a></li>
	<li class="active"><a href="PostTransaction?portfolio_id=${portfolio_id}">Post Transaction</a></li>
	<li><a href="CreatePortfolio">Create New Portfolio</a></li>
	<li><a href="EditUser">Edit User Profile</a></li>
	<li><a href="StockSearch">Research</a></li>	
</ul>
<p class="navbar-text pull-right">Signed in as ${Username}</p>
</nav>

<div class="alert alert-success" id="infobox" style="display:none">
  <span class="glyphicon glyphicon-info-sign"></span>
  <span id="infomsg"></span>
</div>

<div class="alert alert-info" id="active_portfolio_box" style="display:none">
  <span class="glyphicon glyphicon-pushpin"></span>
  <span id="active_portfolio_msg"></span>
</div>

<form autocomplete="off" action="PostTransaction" method="post">
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
	  <input type="text" class="form-control" id="symbol_search" name="symbol" value="${symbol}">
	  <span class="form-control" style="height: 85px;">
	  		<table class="table" id="search_results">
				<thead><tr><th>Exchange</th><th>Symbol</th><th>Industry</th><th>Cap</th><th>Name</th><th>Sector</th><th>Last Trade</th></thead>
				<tbody id="search_result"></tbody>
			</table>
	  </span>
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