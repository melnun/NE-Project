$(document).ready(
	function() {
		for (var i = 0; i < 101; i++) {
			var row = document.querySelector("table").insertRow(-1);
			for (var j = 0; j < 27; j++) {
				var letter = String.fromCharCode("A".charCodeAt(0)+ j - 1);
				console.log("letter=" + letter + " i=" + i + " j="+ j);
				/*
				row.insertCell(-1).innerHTML = i && j ? 
						"<input id='"+ letter + i + "'/>"
						: i || letter;
						*/
				if (i && j) {
					row.insertCell(-1).innerHTML ="<input id='"+ letter + i + "'/>";
				}else {
					// INTESTAZIONE!
					row.insertCell(-1).innerHTML =i || letter ; // + " "+i+ " "+j;
				}
			}
		}

		var DATA = {}, INPUTS = [].slice.call(document
				.querySelectorAll("input"));
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
				var data={ "Position" : DATA[elm.id],
						   "Value" : elm.value};
				console.log("elm.value "+elm.value);
				console.log("elm.id "+DATA[elm.id]);
			});
			var jsonstr = JSON.stringify(data);
		})();

		(function() {
			console.log("Eseguita solo una volta appena sono incontrata da javascript interpreter");
		})();
});
