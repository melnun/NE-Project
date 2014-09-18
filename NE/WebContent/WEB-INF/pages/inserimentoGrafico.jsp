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

label {
	display: inline-block;
	width: 5em;
}

label,input {
	display: block;
}

input.text {
	margin-bottom: 12px;
	width: 95%;
	padding: .4em;
}

fieldset {
	padding: 0;
	border: 0;
	margin-top: 25px;
}

.ui-dialog .ui-state-error {
	padding: .3em;
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
      <script src="/SeatLocatorWebApp/js/html5shiv.js"></script>
    
    <![endif]-->



</head>

<body>

	<!-- Start Header -->
	<%@include file="headerMenu.jsp"%>
	<!-- End Header -->



	<div class="container-fluid">

		<div class="hero-unit">
			<h2 class="text-left">Pannello inserimento grafico</h2>
			<p class="text-left">Da questo pannello è possibile inserire un
				nuovo dipendente, variare la posizione di un dipendente
				esistente o liberare la sua postazione.</p>

		</div>

		<!-- *******Mappa piani********* -->


		<%@include file="mappa.jsp"%>



		<div id="formInserimento" title="Inserisci Dipendente">
			<s:form action="inserimentoDatiGrafico" id="inserimentoDatiGrafico"
				validate="true" theme="simple">
				<fieldset>

					<label for="nome">Nome</label>

					<s:textfield type="text" placeholder="Nome" name="nome" id="nome"
						cssClass="text ui-widget-content ui-corner-all" />



					<label for="cognome">Cognome</label>

					<s:textfield type="text" placeholder="Cognome" name="cognome"
						id="cognome" cssClass="text ui-widget-content ui-corner-all" />



					<label for="codice_postazione">Codice Postazione</label>


					<s:textfield name="codice_postazione" readonly="true"
						cssClass="text ui-widget-content ui-corner-all"
						id="codice_postazione" />

				</fieldset>
				
			</s:form>
		</div>


		<s:form cssClass="form-horizontal formRichiestaAjax"
			action="statoPostazione" theme="bootstrap" id="StatoPostazioneInput">

			<div class="control-group" hidden="true">
				<label class="control-label" style="margin-left: 5cm"
					id="labelCodice">Postazione</label>
				<div class="controls">
					<s:textfield id="codice_postazione_out" class="codice" type="text"
						placeholder="postazione" name="codicePostazione" />
				</div>
			</div>

			<div class="control-group" hidden="true">
				<div class="controls">

					<s:submit type="button" cssClass="btn" align="left"
						cssStyle="margin-left: 5cm" id="verificaSubmit">Verifica</s:submit>
				</div>
			</div>

		</s:form>

		<s:form action="rimuoviPostazioneGrafica" id="formLiberaPostazione">
			<s:hidden id="idDipendente" name="id_dipendente" />
		</s:form>

	</div>


	<div id="liberaPostazione" title="Libera postazione">
		<p>La postazione è già occupata. Si desidera liberarla?</p>
	</div>

	<hr>

	<footer>
		<p>&copy; NTTDATA</p>
	</footer>
	<!--/.fluid-container-->






	<script type="text/javascript">
	
		$(document).ready(function() {
			
			$("#tabs").removeClass("hidden");
			$("#tabs").hide();
			
			$("#inserimentoDatiGrafico").validate({
				rules:{
					nome:"required",
					cognome:"required"
				},
				
				messages:{
					nome:"inserisci un nome",
					cognome:"inserisci un cognome"
				}
					});
			
			 
			 
			$("#formInserimento").dialog({
			      autoOpen: false,
			      height: 350,
			      width: 400,
			      modal: true,
			      show : {
						effect : "clip",
						duration : 500
					},
					hide : {
						effect : "clip",
						duration : 500
					},
			      buttons: {
			        "Inserisci utente": function() {
			        	
			        	$('#inserimentoDatiGrafico').submit();
			        		
			        },
			        Annulla: function() {
			          $( this ).dialog( "close" );
			          $(this).hide();
			        }
			      },
			      close: function() {
			    	  $(this).hide();
			      }
			    });
			
			$("#liberaPostazione").dialog({
			      autoOpen: false,
			      height: 250,
			      width: 300,
			      modal: true,
			      show : {
						effect : "clip",
						duration : 500
					},
					hide : {
						effect : "clip",
						duration : 500
					},
			      buttons: {
			        "Libera Postazione": function() {
			        	
			        	$('#formLiberaPostazione').submit();
			        		
			        },
			        Annulla: function() {
			          $( this ).dialog( "close" );
			          $(this).hide();
			        }
			      },
			      close: function() {
			    	  $(this).hide();
			      }
			    });
			
		
			 jQuery.extend({
				   postJSON: function( url, data, callback) {
				      return jQuery.post(url, data, callback, "json");
				   }
			});
			 
			$.ajaxSetup({  cache: false,async:true});
			
			$(".formRichiestaAjax").hide();
		
					
			var l = $(".mappa img").length;
			
			$(".mappa img").each(function(i, e) {

				
				var postazioneCorrente= $(e);
				var src = $(e).attr("src");
				var id = $(e).attr("id");
				console.log(id + " " + src);

				
				$("#codice_postazione_out").val(id);
				
				var statoPostazioneForm = $("#StatoPostazioneInput").serialize();
				
				// Era getJSON
				$.postJSON("statoPostazione.action", statoPostazioneForm, function(statoPostazione){
					console.log("Stato posto:"+id+" occupato="+statoPostazione.occupato);
					// Marco  il posto occupato, cambio colore immagine  e metto nome persona
					
					if(statoPostazione.occupato){
											
						postazioneCorrente.click(function(){
							$("#idDipendente").attr("value",statoPostazione.id_dipendente);
							console.log(statoPostazione.id_dipendente);
							 $("#liberaPostazione").dialog( "open" );
						
						});
						postazioneCorrente.attr("title",statoPostazione.nome+" "+statoPostazione.cognome+"("+ postazioneCorrente.attr("id") +")");
						
						
					}else{
						postazioneCorrente.attr("title","[Vuota: "+ postazioneCorrente.attr("id") +"]");
					}
					
					if(statoPostazione.occupato && src=='/SeatLocatorWebApp/img/postazioneVuota.png') {
						$(e).attr("src", "/SeatLocatorWebApp/img/postazioneOccupata.png");
						
					
					
					}else if(!statoPostazione.occupato){
						// Faccio in modo che sia cliccabile		
						postazioneCorrente.click(function(){
							
							 $("#formInserimento").dialog( "open" );
						        
	  
							$("#codice_postazione").val($(this).attr("id"));
							$("#nome").focus();							
						});
					}
					
					
					 $(".progressbar").progressbar({value:i+1, max: l, complete: function () {
						console.log(i+" "+l);
						 $( ".progressbar" ).hide();
						 $( ".progressbar" ).progressbar("destroy");
						 $("#tabs").fadeIn(1000);
							
						}
					    });
					
				}); 
								
			 }); //each
			 
		});
							
	</script>


</body>
</html>
