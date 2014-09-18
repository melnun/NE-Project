<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="./js/jquery-1.11.1.js"></script>
<link rel="icon" href="./img/NTTData.ico" type="image/x-icon" />
<link href="./css/style.css" rel="stylesheet" type="text/css">
<link href="./css/bootstrap-theme.css" rel="stylesheet" type="text/css">
<link href="./css/bootstrap-theme.css.map" rel="stylesheet"
	type="text/css">
<link href="./css/bootstrap-theme.min.css" rel="stylesheet"
	type="text/css">
<link href="./css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="./css/bootstrap.css.map" rel="stylesheet" type="text/css">
<link href="./css/bootstrap.min.css" rel="stylesheet" type="text/css">


<meta charset="ISO-8859-1">
<title>NE - Excel</title>
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
					Esporta Excel |</a>
			</div>
			<div>
				<a class="navbar-brand">[ Benvenuto <c:out
						value="${session.username}" /> ]
				</a>
			</div>
		</div>
	</div>
	<div class="jumbotron">
		<h1>
			<u>|Pro</u>g<u>etto NE|</u>
		</h1>
	</div>

	<%-- <%
		Map<String, Object> session2 = com.opensymphony.xwork2.ActionContext
				.getContext().getSession();
	%> --%>

	<script type="text/javascript" src="js/tabella.js"></script>


	<div class="col-md-2">
		<table class="table table-bordered excelt">

		</table>

		<h2>Nome del file</h2>
		<s:form cssClass="form-signin" method="post" action="saveExcel">
		    <s:textfield type="text" name="filename" /> 
			
			<h2>JSon</h2>
			<s:textarea rows="2" cols="30" name="jsonData" />
			
			<s:submit cssClass="btn btn-large btn-primary" type="submit"
				value="save" align="center"></s:submit>
		</s:form>
		
		<footer>
			<p>
				&copy; 2014 Ondrej Zara, Giovanni Giorgi and Nunzio Mele</a>
			</p>
		</footer>
		
	</div>

</body>
</html>