<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>SeatLocator</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">


<style type="text/css">
body {
	padding-top: 60px;
	padding-bottom: 40px;
}

.sidebar-nav {
	padding: 9px 0;
}

@media ( max-width : 980px) {
	/* Enable use of floated navbar text */
	.navbar-text.pull-right {
		float: none;
		padding-left: 5px;
		padding-right: 5px;
	}
}
</style>


<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="../assets/js/html5shiv.js"></script>
    <![endif]-->


</head>

<body>

	<!-- Start Header -->
	<%@include file="headerMenu.jsp"%>
	<!-- End Header -->

	<div class="container-fluid">

		<div class="hero-unit">
			<h1>Pannello modifica postazione</h1>
			<p>Da questo pannello � possibile modificare la postazione del
				dipendente.</p>

		</div>
		<div class="row">
			<s:form cssClass="form-horizontal" action="modificaPostazione"
				theme="bootstrap">
				<s:actionerror cssStyle="margin-left: 0.5cm"/>

				<s:hidden name="nome"></s:hidden>
				<s:hidden name="cognome"></s:hidden>
				<div class="control-group">
					<label class="control-label" style="margin-left: 5cm">Codice
						Postazione</label>
					<div class="controls">
						<s:textfield name="codice_postazione" readonly="true"></s:textfield>

					</div>
				</div>
				<div class="control-group">
					<div class="controls">

						<button type="submit" class="btn" 
							style="margin-left: 5cm">Conferma Modifica</button>
					</div>
				</div>
			</s:form>

		</div>



		<hr style="margin-top: 10cm">

		<footer>

			<p>&copy; NTTDATA</p>
		</footer>

	</div>
	<!--/.fluid-container-->

	

</body>
</html>
