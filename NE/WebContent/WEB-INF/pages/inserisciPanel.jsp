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
			<h2 class="text-left">Pannello inserimento</h2>
			<p class="text-left">Da questo pannello è possibile inserire un nuovo dipendente
				oppure variare la posizione di un dipendente esistente</p>

		</div>
		<div class="row">
			<s:form cssClass="form-horizontal" action="inserimentoDati" validate="true"
				 theme="bootstrap" >
				
				<div class="control-group">
					<label class="control-label" style="margin-left: 5cm">Nome</label>
					<div class="controls">
						<s:textfield type="text"  placeholder="Nome" name="nome" />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" style="margin-left: 5cm">Cognome</label>
					<div class="controls">
						<s:textfield type="text" placeholder="Cognome" name="cognome" />
					</div>
				</div>
				<div class="control-group">
					<label class="control-label" style="margin-left: 5cm">Codice Postazione</label>
					<div class="controls">
						 
						<s:select name="codice_postazione" list="listaPostazioni"></s:select>
						 
					</div>
				</div>
				<div class="control-group">
					<div class="controls">

						<s:submit type="button" cssClass="btn" align="left" cssStyle="margin-left: 5cm">Inserisci</s:submit>
					</div>
				</div>
			</s:form>

		</div>
		<hr>

		<footer>
			<p>&copy; NTTDATA</p>
		</footer>

	</div>
	<!--/.fluid-container-->

	
</body>
</html>
