<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="./js/jquery-1.11.1.js"></script>
<link rel="icon" href="./img/NTTData.ico" type="image/x-icon" />
<link href="./css/style.css" rel="stylesheet" type="text/css">
<link href="./css/bootstrap-theme.css" rel="stylesheet" type="text/css">
<link href="./css/stylee.css" rel="stylesheet" type="text/css">
<link href="./css/bootstrap-theme.css.map" rel="stylesheet"
	type="text/css">
<link href="./css/bootstrap-theme.min.css" rel="stylesheet"
	type="text/css">
<link href="./css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="./css/bootstrap.css.map" rel="stylesheet" type="text/css">
<link href="./css/bootstrap.min.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>
<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span>
				</button>
				<a class="navbar-brand" href="http://emea.nttdata.com/it/home/index.html" target="_blank">| NTT DATA |</a>
			</div>
			
		</div>
	</div>
	<div class="jumbotron">
		<h1>
			<u>|Pro</u>g<u>etto NE|</u>
		</h1>

	</div>
	<div class="content">
		<div id="form_wrapper" class="form_wrapper"
			style="width: 350px; height: 381px;">
			<form class="register" style="display: none;">
				<h3>
					<cufon class="cufon cufon-canvas" alt="Register"
						style="width: 106px; height: 25px;"> <canvas width="122"
						height="28"
						style="width: 122px; height: 28px; top: -2px; left: 0px;"></canvas>
					<cufontext>Register</cufontext></cufon>
				</h3>
				<div class="column">
					<div>
						<label>First Name:</label> <input type="text"> <span
							class="error">This is an error</span>
					</div>
					<div>
						<label>Last Name:</label> <input type="text"> <span
							class="error">This is an error</span>
					</div>
					<div>
						<label>Website:</label> <input type="text" value="http://">
						<span class="error">This is an error</span>
					</div>
				</div>
				<div class="column">
					<div>
						<label>Username:</label> <input type="text"> <span
							class="error">This is an error</span>
					</div>
					<div>
						<label>Email:</label> <input type="text"> <span
							class="error">This is an error</span>
					</div>
					<div>
						<label>Password:</label> <input type="password"> <span
							class="error">This is an error</span>
					</div>
				</div>
				<div class="bottom">
					<div class="remember">
						<input type="checkbox"> <span>Send me updates</span>
					</div>
					<input type="submit" value="Register"> <a href="login.jsp"
						rel="login" class="linkform">You have an account already? Log
						in here</a>
					<div class="clear"></div>
				</div>
			</form>
			<form class="login active">
				<h3>
					<cufon class="cufon cufon-canvas" alt="Login"
						style="width: 73px; height: 25px;"> <canvas width="84"
						height="28"
						style="width: 84px; height: 28px; top: -2px; left: 0px;"></canvas>
					<cufontext>Login</cufontext></cufon>
				</h3>
				<div>
					<label>Username:</label> <input type="text"> <span
						class="error">This is an error</span>
				</div>
				<div>
					<label>Password: <a href="forgot_password.html"
						rel="forgot_password" class="forgot linkform">Forgot your
							password?</a></label> <input type="password"> <span class="error">This
						is an error</span>
				</div>
				<div class="bottom">
					<div class="remember">
						<input type="checkbox"><span>Keep me logged in</span>
					</div>
					<input type="submit" value="Login"> <a href="register.html"
						rel="register" class="linkform">You don't have an account yet?
						Register here</a>
					<div class="clear"></div>
				</div>
			</form>
			<form class="forgot_password" style="display: none;">
				<h3>
					<cufon class="cufon cufon-canvas" alt="Forgot "
						style="width: 88px; height: 25px;"> <canvas width="109"
						height="28"
						style="width: 109px; height: 28px; top: -2px; left: 0px;"></canvas>
					<cufontext>Forgot </cufontext></cufon>
					<cufon class="cufon cufon-canvas" alt="Password"
						style="width: 123px; height: 25px;"> <canvas width="134"
						height="28"
						style="width: 134px; height: 28px; top: -2px; left: 0px;"></canvas>
					<cufontext>Password</cufontext></cufon>
				</h3>
				<div>
					<label>Username or Email:</label> <input type="text"> <span
						class="error">This is an error</span>
				</div>
				<div class="bottom">
					<input type="submit" value="Send reminder"> <a
						href="index.html" rel="login" class="linkform">Suddenly
						remebered? Log in here</a> <a href="register.html" rel="register"
						class="linkform">You don't have an account? Register here</a>
					<div class="clear"></div>
				</div>
			</form>
		</div>
		<div class="clear"></div>
	</div>
</body>
</html>