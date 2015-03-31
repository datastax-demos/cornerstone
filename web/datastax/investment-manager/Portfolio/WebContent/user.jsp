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
	
	//Error messages	
	var error = '${ERMSG}';
	if (error != ''){
		$('#errormsg').text(error);
		$('#errorbox').show();
	}
	
	//Info Message
	var info = '${Info}';
	if (info != ''){
		$('infomsg').text(info);
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
	<li class="active"><a href="EditUser">Edit User Profile</a></li>
	<li><a href="StockSearch">Research</a></li>	
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


<form autocomplete="off" action="EditUser" method="post">
<div class="panel panel-default">
  <div class="panel-heading"><span class="glyphicon glyphicon-user"></span> Update Username and Password</div>
  <div class="panel-body">
		<div class="input-group" style="margin-bottom: 1em;">
		  <span class="input-group-addon" id="basic-addon1">User Name</span>
		  <input type="text" class="form-control" name="user_name" value="${user_name}">
		</div>
		<div class="input-group" style="margin-bottom: 1em;">
		  <span class="input-group-addon" id="basic-addon1">Old Password</span>
		  <input type="password" class="form-control" placeholder="Enter current password" name="old_password">
		</div>		
		<div class="input-group" style="margin-bottom: 1em;">
		  <span class="input-group-addon" id="basic-addon1">New Password</span>
		  <input type="password" class="form-control" placeholder="Enter new password" name="new_password1">
		  <input type="password" class="form-control" placeholder="Re-enter new password" name="new_password2">
		</div>
						
		<div class="input-group">
			<button class="btn btn-default" type="submit"><span class="glyphicon glyphicon-save"></span>Save</button>
		</div>
  </div>
</div>
</form>



</div>
</body>
</html>