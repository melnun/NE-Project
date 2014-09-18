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
	<div class="container">

	
			<div class="hero-unit">
				<h2>
					Welcome Admin<br>
				</h2>
				<p>Da questo pannello è possibile inserire i dati di un
					dipendente ed effettuare la ricerca</p>

			</div>
			<div class="row">

				<div class="span1" style="margin-left: 3cm">
					<h4 align="left">Inserisci</h4>
					<ul class="thumbnails">
						<li class="span1"><s:a action="inserisciPanel" cssClass="thumbnail">
								<img src="/SeatLocatorWebApp/img/add.jpg" >
							</s:a></li>


					</ul>
				</div>
				<div class="span1" style="margin-left: 3cm">
					<h4 align="left">Ricerca</h4>
					<ul class="thumbnails">
						<li class="span1"><s:a action="ricerca" cssClass="thumbnail">
								<img src="/SeatLocatorWebApp/img/search.jpg" >
							</s:a></li>

					</ul>

				</div>
				<div class="span1" style="margin-left: 3cm">
					<h4 align="left" >Inserimento grafico</h4>
					<ul class="thumbnails">
						<li class="span1"><s:a action="inserisciPanelGrafico" cssClass="thumbnail">
								<img src="/SeatLocatorWebApp/img/add.jpg" >
							</s:a></li>

					</ul>

				</div>
			</div>
		

		<hr>

		<footer>
			<p>&copy; NTTDATA 2013</p>
		</footer>

	</div>
	<!--/.fluid-container-->


</body>
</html>
