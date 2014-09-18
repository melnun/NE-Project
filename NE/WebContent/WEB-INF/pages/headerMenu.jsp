<%@page import="org.apache.struts2.components.Include"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags"%>


<meta charset="utf-8">
<title>SeatLocator</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- Le styles -->
<link href="/SeatLocatorWebApp/css/bootstrap.css" rel="stylesheet">


<link href="/SeatLocatorWebApp/css/redmond/jquery-ui-1.10.3.custom.css"
	rel="stylesheet" type="text/css">



<style type="text/css">
body {
	padding-top: 60px;
	padding-bottom: 40px;
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


<script type="text/javascript"
	src="/SeatLocatorWebApp/js/jquery-1.9.1.js"></script>
<script type="text/javascript"
	src="/SeatLocatorWebApp/js/jquery.validate.js"></script>
<script type="text/javascript" src="/SeatLocatorWebApp/js/bootstrap.js"></script>
<script type="text/javascript"
	src="/SeatLocatorWebApp/js/jquery-ui-1.10.3.custom.js"></script>

<script type="text/javascript">
	
		
		
$(document).ready(function() {
			$("#help-dialog").dialog({
				autoOpen : false,
				height : 500,
				width : 500,
				modal : true,
				show : {
					effect : "clip",
					duration : 1000
				},
				hide : {
					effect : "clip",
					duration : 1000
				}
			});
			$("#opener").click(function() {
				$("#help-dialog").removeClass("hidden");
				$("#help-dialog").dialog("open");
			});
		});
	
</script>


<div class="navbar navbar-inverse navbar-fixed-top">
	<div class="navbar-inner">
		<div class="container">
			<div class="dropdown">

				<button type="button" class="btn btn-navbar" data-toggle="collapse"
					data-target=".nav-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<s:a cssClass="brand" action="adminPanel">SeatLocator</s:a>
				<div class="nav-collapse collapse">
					<p class="navbar-text pull-right">
						<i class=" icon-user icon-white"></i>
						<s:property value="#session.user" />
					</p>

				</div>
				<div class="nav-collapse collapse" style="margin-right: 4cm"
					id="help">
					<p class="navbar-text pull-right" id="opener">
						<i class=" icon-question-sign icon-white"></i> Help
					</p>

				</div>
				<ul class="nav">

					<li><s:a action="inserisciPanelGrafico">Inserimento grafico</s:a></li>
					<li><s:a action="ricerca">Ricerca</s:a></li>
					<li><s:a action="inserisciPanel">Inserimento diretto</s:a></li>

				</ul>

			</div>
			<!--/.nav-collapse -->
		</div>
	</div>
</div>
<!-- Start Help -->
<%@include file="help.jsp"%>
<!-- End Help -->

<!-- /container -->

<!-- Le javascript
    ================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script type="text/javascript">
(function() {
	  if (!window.console) {
	    window.console = {};
	  }
	  // union of Chrome, FF, IE, and Safari console methods
	  var m = [
	    "log", "info", "warn", "error", "debug", "trace", "dir", "group",
	    "groupCollapsed", "groupEnd", "time", "timeEnd", "profile", "profileEnd",
	    "dirxml", "assert", "count", "markTimeline", "timeStamp", "clear"
	  ];
	  // define undefined methods as noops to prevent errors
	  for (var i = 0; i < m.length; i++) {
	    if (!window.console[m[i]]) {
	      window.console[m[i]] = function() {};
	    }    
	  } 
	})();
</script>


