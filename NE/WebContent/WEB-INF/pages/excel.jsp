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

<link href="./css/bootstrap-theme.css" rel="stylesheet" type="text/css">
<link href="./css/bootstrap-theme.css.map" rel="stylesheet"
	type="text/css">
<link href="./css/bootstrap-theme.min.css" rel="stylesheet"
	type="text/css">
<link href="./css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="./css/bootstrap.css.map" rel="stylesheet" type="text/css">
<link href="./css/bootstrap.min.css" rel="stylesheet" type="text/css">

<!-- <link href="./css/style.css" rel="stylesheet" type="text/css"> -->
<meta charset="ISO-8859-1">
<title>NE - Excel</title>
<style type="text/css">
input.xtCell {
	border: none;
	width: 120px; // width base cella font-size : 14px;
	padding: 2px;
}

input.xtCell:hover {
	background-color: #eee;
}

input.xtCell:focus {
	background-color: #ccf;
}

table.xtCell {
	border-collapse: collapse;
}

td.xtCell {
	border: 1px solid #999;
	padding: 0;
	font-weight: bold;
}

tr.xtCell:first-child td.xtCell, td.xtCell:first-child {
	background-color: #ccc;
	padding: 1px 3px;
	font-weight: bold;
	text-align: center;
}

.nascosto {
	visibility: hidden;
}

.row {
	margin-left: 20px;
}
</style>
</head>
<body>




	<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span>
				</button>
				<a class="navbar-brand"> |<i><u>Pro</u>g<u>etto NE</u></i>|NTT
					DATA |
				</a>
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
	<div class="jumbotron"></div>

	<%-- <%
		Map<String, Object> session2 = com.opensymphony.xwork2.ActionContext
				.getContext().getSession();
	%> --%>


	<div class="content">
		<script type="text/javascript" src="js/tabella.js"></script>


		<div class="row">
			<ol>			
				<s:iterator value="currentFileList" status="status">
					<li><a onclick="window.loadExcel( '${session.username}/' + $(this).html());" href="#"><s:property/></a></li>
				</s:iterator>
			</ol>
		</div>

		<div class="row">

			<br />
			<s:form theme="bootstrap" cssClass="form-horizontal" method="post"
				action="saveExcel">
				<s:textfield label="Filename" type="text" maxlength="50"
					cssStyle="width:100px;" cssClass="" name="filename" />

				<s:hidden name="jsonData" />

				<s:submit cssClass="btn nascosto" type="submit" value="save"
					onclick="window.packJson()" align="center" />
			</s:form>




		
	</div>
	<div class="row">
		<div class="col-md-2">
			<h3>Excel table</h3>


			<table class="table table-bordered excelt xtCell">
			</table>

		</div>
	</div>

	<div class="row">
		<footer>
			<p>
				<a>&copy; 2014 Ondrej Zara, Giovanni Giorgi and Nunzio Mele</a>
			</p>
		</footer>
	</div>
	</div>
</body>
</html>