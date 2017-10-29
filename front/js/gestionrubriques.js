$(document).ready(function() {
	//$('#summernote').val($('#summernote').val().html());
	/*$('#summernote').html($('#summernote').text()).text()*/
	/*$('#summernote').summernote({
		height: 250
	});*/
	alimenterRubriques();
});

function alimenterRubriques() {

	$.ajax({
		url: "index.php?domaine=rubrique&service=getliste",
		dataType: 'json',
		success : function(resultat, statut, erreur){
			tab = document.getElementById('tableauResultat');
			$('tr[typetr=rubrique]').remove();

			var total = resultat[0].nbLineTotal;
			var nbpage = Math.ceil(total/resultat[0].nbLine);


			var nb=resultat[0].nbLine;
			var tabJson = resultat[0].tabResult;
			var i=0;
			for(i=0; i<nb; i++) {
				var row = $('<tr typetr="rubrique"/>');
				row.append($('<td/>').text(tabJson[i].titre));
				row.append($('<td/>'));


				row.append($('<td class="text-center"/>').append('<a href="#" onclick="editerRubrique(\''+ tabJson[i].rubriqueid +'\')"><span class="glyphicon glyphicon-pencil"/></a>'));

				$("#tbodyResultat").append(row);
			}
		}
	});
}

function editerRubrique(rubriqueid) {
	var params="&rubriqueid="+rubriqueid;

	var hauteur = 600;
	var largeur = 1100;

	$.getJSON(
		"index.php?domaine=rubrique&service=getone",
		data=params,
		function(json){
			document.rubrique.service.value='update';
			document.rubrique.rubriqueid.value=json[0].rubriqueid;
			document.rubrique.titre.value=json[0].Titre;
			//document.rubrique.contenu.value=json[0].contenu;
			//$('#summernote').html(json[0].contenu).text()
			$('#summernote').summernote('destroy');
			$('#summernote').html(json[0].contenu);
			$('#summernote').summernote({
				height: 250
			});
			$("div#boiteRubrique").dialog({
				resizable: false,
				height:hauteur,
				width:largeur,
				modal: true
			});
		}
	);
}

/******************************************************/
// soumettre
/******************************************************/
function soumettre(form) {
	if(!validForm(form)) {
		return false;
	}
	var params = "rubriqueid="+form.rubriqueid.value+"&contenu="+$('#summernote').summernote('code');
	var service = form.service.value;
	$.ajax({
		url:"index.php?domaine=rubrique&service=update",
		data:params,
		method:'POST',
		dataType: 'json',
		function(json){
			alimenterRubriques();
			return false;
		}
	});
	return false;
}

function enregistreNews() {
	var params = "newsid=1&contenu="+$('#summernote').summernote('code');
	$.ajax({
		url:"index.php?domaine=news&service=update",
		data:params,
		method:'POST',
		function(json){

		}
	});
}
