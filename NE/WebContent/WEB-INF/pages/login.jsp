<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="icon" href="./img/NTTData.ico" type="image/x-icon" />
<link href="./css/bootstrap-theme.min.css" rel="stylesheet"
	type="text/css">
<link href="./css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="./css/bootstrap.css.map" rel="stylesheet" type="text/css">
<link href="./css/bootstrap.min.css" rel="stylesheet" type="text/css">
<meta charset="utf-8">
<title>NE - Login</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- Le styles -->
<link href="/SeatLocatorWebApp/css/bootstrap.css" rel="stylesheet">
<style type="text/css">
body {
	padding-top: 40px;
	padding-bottom: 40px;
	background-color: #f5f5f5;
}

.form-signin {
	max-width: 300px;
	padding: 19px 29px 29px;
	margin: 0 auto 20px;
	background-color: #fff;
	border: 1px solid #e5e5e5;
	-webkit-border-radius: 5px;
	-moz-border-radius: 5px;
	border-radius: 5px;
	-webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
	-moz-box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
	box-shadow: 0 1px 2px rgba(0, 0, 0, .05);
}

.form-signin .form-signin-heading, .form-signin .checkbox {
	margin-bottom: 10px;
}

.form-signin input[type="text"], .form-signin input[type="password"] {
	font-size: 16px;
	height: auto;
	margin-bottom: 15px;
	padding: 7px 9px;
}
</style>
<link href="/SeatLocatorWebApp/css/bootstrap-responsive.css"
	rel="stylesheet">

<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="/SeatLocatorWebApp/js/html5shiv.js"></script>
    <![endif]-->

<!-- Fav and touch icons -->
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="../assets/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="../assets/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="../assets/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="../assets/ico/apple-touch-icon-57-precomposed.png">
<link rel="shortcut icon" href="../assets/ico/favicon.png">
</head>

<body>
	<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span>
				</button>
				<a class="navbar-brand"
					href="http://emea.nttdata.com/it/home/index.html" target="_blank">|
					NTT DATA |</a>
			</div>
			<div>
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span>
				</button>
				<a class="navbar-brand" href="#" onclick="window.packJson()">|
					Registrati |</a>
			</div>
		</div>
	</div>

	<div class="jumbotron">
		<h1>
			<u>|Pro</u>g<u>etto NE|</u>
		</h1>
	</div>
	
	
	
	<s:div cssClass="container">
		<s:form cssClass="form-signin" method="post" action="login"
			validate="true" theme="bootstrap">
			<s:actionerror />

			<h2 class="form-signin-heading">Effettua il login</h2>

			<s:textfield type="text" name="username" cssClass="input-block-level"
				placeholder="Username" />
			<s:password name="password" cssClass="input-block-level"
				placeholder="Password" />

			<s:submit cssClass="btn btn-large btn-primary" type="submit"
				value="Login" align="center"></s:submit>
		</s:form>

	</s:div>
	<!-- /container -->

	<!-- Le javascript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="/SeatLocatorWebApp/js/jquery-1.9.1.js"></script>
	<script src="/SeatLocatorWebApp/js/bootstrap.min.js"></script>
	<script src="/SeatLocatorWebApp/js/bootstrap.js"></script>

</body>
</html>
