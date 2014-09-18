
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sb" uri="/struts-bootstrap-tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>SeatLocator Welcome</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">


<style>
body {
	padding-top: 60px;
	/* 60px to make the container go all the way to the bottom of the topbar */
}

.imgDaEvidenziare {
	border-style: solid;
	border-width: 5px;
	border-color: green;
}

label {
	display: inline-block;
	width: 5em;
}
</style>


<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
      <script src="/SeatLocatorWebApp/js/html5shiv.js"></script>
    <![endif]-->


</head>



<body>

	<!-- Start Header -->
	<%@include file="headerMenu.jsp"%>
	<!-- End Header -->

	<div class="container">

		<!--Sidebar content-->
		<div class="hero-unit">
			<h2 class="text-left">Pagina di ricerca</h2>
			<p class="text-left">Da questo pannello è possibile effettuare la
				ricerca di tutti i dipendenti, effettuare una ricerca per nome,
				cognome o codice postazione oppure sganciare la postazione da un
				dipendente.</p>

		</div>




		<s:form action="ricerca" method="post" cssClass="form-search"
			theme="bootstrap" id="frmRicerca">
			<div>
				<s:actionerror />
			</div>

			<s:div cssClass="input-append">

				<input type="text" name="frmRicerca" id="frmRicerca"
					class="input-xxlarge search-query" style="margin-left: 3cm" />
				<button type="submit" class="btn" name="find"
					title="Ricerca uno o più dipendenti">
					<i class="icon-search"></i>
				</button>


			</s:div>


			<div class="btn-group" style="margin-left: 2cm;">

				<button class="btn" name="viewAll"
					title="Ricerca tutti i dipendenti esistenti" type="submit">Visualizza
					tutti</button>

			</div>
		</s:form>



		<div style="margin-top: 3cm;">
			<table class="table table-striped">
				<thead>
					<tr>

						<th>Cognome</th>
						<th>Nome</th>
						<th>Codice Postazione</th>
						<th>Opzioni</th>
					</tr>
				</thead>
				<c:forEach var="dipendenti" items="${dip}">
					<tbody>
						<tr>

							<td><c:out value="${dipendenti.cognome}"></c:out></td>
							<td><c:out value="${dipendenti.nome}"></c:out></td>
							<td style="color: blue; cursor: pointer;"
								class="ricerca-postazione" title="Visualizza nella mappa"><c:out
									value="${dipendenti.codice_postazione}"></c:out></td>

							<td style="margin-left: 3cm"><c:if
									test="${ dipendenti.codice_postazione != null }">
									<div class="funzioneEliminazione">

										<s:form method="post" action="rimuoviPostazione"
											cssClass="formEliminazione"
											onsubmit="return confirm('Vuoi veramente rimuovere la postazione?');"
											theme="bootstrap">
											<input type="hidden" name="id_dipendente"
												value="<c:out value='${dipendenti.id_dipendente}'/>" />
											<s:submit type="button" cssClass="btn btn-mini btn-remove"
												name="remove" title="Elimina postazione"
												id="rimuovi-postazione">
												<i class="icon-remove"></i>

											</s:submit>

										</s:form>

									</div>
								</c:if></td>
						</tr>
					</tbody>
				</c:forEach>
			</table>
		</div>

		<div id="dialog-mappa" title="Mappa">
			<%@include file="mappaForSearch.jsp"%>
		</div>



		<footer style="margin-top: 4cm">
			<hr>
			<p>&copy; NTTDATA</p>
		</footer>


	</div>
	<!-- /container -->



	<script type="text/javascript">
	
	  $(function() {
	    $( document ).tooltip();
	  });
	  
	
		$(document).ready(function() {
			
			//	$("progressbar").progressbar("destroy");

			$("#dialog-mappa").dialog({
				resizable : true,
				autoOpen : false,
				height : 500,
				width : 980,
				modal : true,
				close : function () {
					// Resetto tutto
					$(".mappa img").each(function(i,e){
						
						$(e).attr("src", "/SeatLocatorWebApp/img/postazione.png");
						
					});
					
				}
			});
			
		
			
			$(".ricerca-postazione").click(function() {

				if ($(this).html() != null && $(this).html() != '') {
					
						
					$("#dialog-mappa").dialog("open");

					var postazioneAttuale = $(this).html();
					//console.log(postazioneAttuale);
					var e = $("#" + postazioneAttuale);

					// Evidenzio postazione 
					e.attr("src", "/SeatLocatorWebApp/img/postazioneEvidenziata.png");
													
					
					// Trovo tab e lo clicco
					if($("#tabs-1 #"+postazioneAttuale).length >0){
						$( "#tabs" ).tabs( "enable", 0 );
						$( "#tabs" ).tabs( 'option', 'active', 0 );
						$( "#tabs" ).tabs( "option", "disabled", [ 1, 2, 3 ] );
					}else if($("#tabs-2 #"+postazioneAttuale).length >0){
						$( "#tabs" ).tabs( "enable", 1 );
						$( "#tabs" ).tabs( 'option', 'active', 1 );
						$( "#tabs" ).tabs( "option", "disabled", [ 0, 2, 3 ] );
					}else if($("#tabs-3 #"+postazioneAttuale).length >0){
						$( "#tabs" ).tabs( "enable", 2 );
						$( "#tabs" ).tabs( 'option', 'active', 2 );
						$( "#tabs" ).tabs( "option", "disabled", [ 0, 1, 3 ] );
					}else{
						$( "#tabs" ).tabs( "enable", 3 );
						$( "#tabs" ).tabs( 'option', 'active', 3 );
						$( "#tabs" ).tabs( "option", "disabled", [ 0, 1, 2 ] );
						
					}
					e.hide('slow');
					e.fadeIn('slow');
					
					
				}
					
					
				
			});
			
			
		
		});
	</script>

</body>
</html>
