$(document).ready(
		function() {

			document.DEBUG=false;
			var righe=25;  // 50 in prod
			var colonne=11 ; // 22 in prod
			for (var i = 0; i < righe+1; i++) {
				var row = document.querySelector("table").insertRow(-1);
				for (var j = 0; j < colonne; j++) {
					var letter = String.fromCharCode("A".charCodeAt(0)+ j - 1);
					if(document.DEBUG){
						console.log("letter=" + letter + " i=" + i + " j="+ j);
					}
					/*
				row.insertCell(-1).innerHTML = i && j ? 
						"<input id='"+ letter + i + "'/>"
						: i || letter;
					 */
					// GG Add .xtCell as css style via $

					if (i && j) {

						row.insertCell(-1).innerHTML ="<input  class='xtCell'  id='"+ letter + i + "'/>";
					}else {
						// INTESTAZIONE!  col-md-1 <td class="col-md-1">D</td>
						row.insertCell(-1).innerHTML =i || letter ; // + " "+i+ " "+j;
					}
				}
			}

			// WAS document.querySelectorAll("input")
			var DATA = {}, INPUTS = [].slice.call(
					document.querySelectorAll(".excelt input")
			);
			INPUTS.forEach(function(elm) {
				elm.onfocus = function(e) {
					e.target.value = localStorage[e.target.id] || "";
				};
				elm.onblur = function(e) {
					localStorage[e.target.id] = e.target.value;
					computeAll();
				};
				var getter = function() {
					var value = localStorage[elm.id] || "";
					if (value != "" && document.DEBUG) {
						console.log("Getter di " + elm.id + " Valuta:"
								+ value);
					}
					if (value.charAt(0) == "=") {
						with (DATA)
						return eval(value.substring(1));
					} else {
						return isNaN(parseFloat(value)) ? value
								: parseFloat(value);
					}
				};
				Object.defineProperty(DATA, elm.id, {
					get : getter
				});
				Object.defineProperty(DATA, elm.id.toLowerCase(), {
					get : getter
				});
			});

			// Definisce la funzione e forza un caricamento di default dell'excel vuoto
			(window.loadExcel=function( fileName ){
				var url="http://127.0.0.1:8080/NE/data/"+fileName;
				//lert('Da implementare caricamento di '+fileName);
				console.log("url="+url);
				// Step 1 carico il file da un url, per es da http://127.0.0.1:8080/NE/data/admin/demo.json
				console.log("$="+$);
				$.get( url, function( data ) {

					var dataLoaded= data;
					//alert('Caricato:'+datastr);
					// Step 3 carico dataLoaded in DATA
					//DATA
					
					
					var newData={};
					dataLoaded.forEach(function (elem) {
						//console.log("Carico"+JSON.stringify(elem));
						var chiave,valore;
						//DATA[elem.id]=elem.value;
						console.log("elm.id "+elem.Position);
						console.log("elm.value "+elem.Value);
						
						newData[ elem.Position ] = elem.Value;
						//console.log(""+JSON.stringify(DATA));						
					});
					
					// Forzo i dati caricati negli input
					INPUTS.forEach(function(elm) {
						if(elm.id in newData ){		
							localStorage[elm.id]=newData[elm.id];
							elm.value=newData[elm.id];									
							console.log("Refreshed:"+elm.id+" WITH:"+elm.value);
						}else{
							localStorage[elm.id]="";
							elm.value="";							
						}
						//elm.onblur(elm);	
					});
					
					
					// Step 4 page refresh
					console.log("LOADED "+url);
					//window.computeAll();
				});
			})("default-excel.json");
			
			
			(window.computeAll = function() {
				INPUTS.forEach(function(elm) {
					try {
						elm.value = DATA[elm.id];
					} catch (e) {
					}
				});
			})();

			(function() {
				console.log("Eseguita solo una volta appena sono incontrata da javascript interpreter");
			})();

			window.packJson=function(){
				var dataList=[]; 
				INPUTS.forEach(function(elm) {
					if(elm.value != "" ){
						var data={  "Position" :elm.id,
								"Value" : elm.value};
						dataList.push(data);
						//console.log("elm.value "+elm.value);
						//console.log("elm.id "+DATA[elm.id]);
					}
				});
				var jsonstr = JSON.stringify(dataList);
				$("#saveExcel_jsonData").val(jsonstr);
				//$("#saveExcel_jsonData").focus();
				$("#saveExcel").submit();
				// $(".jsonDest").val(jsonstr);
				// alert("Esportazione avvenuta con successo");
			}


			
			
		});
