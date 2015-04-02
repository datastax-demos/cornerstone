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

<script type="text/javascript">

function initialize() {
	var error = '${ERMSG}';

	if (error != ''){
		$('#errormsg').text(error);
		$('#errorbox').show();
	}
}

</script>

</head>
<body onload="initialize()">
<div class="container">

<div class="page-header">
	<h3><img src="images/logo.png"><span class="pull-right"><span class="glyphicon glyphicon-briefcase"></span>  Investment Manager</span></h3>
</div>

<div class="alert alert-danger" id="errorbox" style="display:none">
  <span class="glyphicon glyphicon-exclamation-sign"></span>
  <span id="errormsg"></span>
</div>


<form action="Login" method="post">

<div class="panel panel-default">
  <div class="panel-heading">Enter user information to continue</div>
  <div class="panel-body">
		<div class="input-group" style="margin-bottom: 1em;">
		  <span class="input-group-addon" id="basic-addon1">User ID</span>
		  <input type="text" class="form-control" placeholder="Email Address" name="email_address">
		</div>
		
		<div class="input-group" style="margin-bottom: 1em;">
		  <span class="input-group-addon" id="basic-addon1">Password</span>
		  <input type="password" class="form-control" name="password">
		</div>
		
		<div class="input-group">
			<button class="btn btn-default" type="submit"><span class="glyphicon glyphicon-lock"></span>Login</button>
		</div>
  </div>
</div>


</form>

</div>
</body>
</html>