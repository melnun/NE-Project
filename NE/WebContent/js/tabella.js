$(document).ready(
	function() {
		
		document.DEBUG=false;
		var righe=5;  // 50 in prod
		var colonne=3 ; // 22 in prod
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
				if (i && j) {
					row.insertCell(-1).innerHTML ="<input id='"+ letter + i + "'/>";
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
				if (value != "") {
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
