$(document).ready(function() {
	alimenterRubriques();
});

/******************************************************/
// alimenterRubriques
// alimente le tableau des rubriques
/******************************************************/
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
				row.append($('<td class="text-center"/>').append('<a href="#" onclick="editerRubrique(\''+ tabJson[i].rubriqueid +'\')"><span class="oi oi-pencil"/></a>'));
				$("#tbodyResultat").append(row);
			}
		}
	});
}

/******************************************************/
// editerRubrique
// permet d'afficher le formulaire pour créer une
// rubrique
/******************************************************/
function editerRubrique(rubriqueid) {
	var params="&rubriqueid="+rubriqueid;

	var hauteur = 600;
	var largeur = 1170;

	$.getJSON(
		"index.php?domaine=rubrique&service=getone",
		data=params,
		function(json){
			document.rubrique.service.value='update';
			document.rubrique.rubriqueid.value=json[0].rubriqueid;
			document.rubrique.titre.value=json[0].titre;
			$('#summernote').summernote('destroy');
			$('#summernote').html(json[0].contenu);
			$('#summernote').summernote({
				height: 450,
				callbacks: {
					onImageUpload: function(files, editor, welEditable) {
						sendFile(files[0],$('#summernote'),welEditable);
					}
				}
			});
			$( "#divFormulaire").show();
		}
	);
}

/******************************************************/
// soumettre
// récupère les donées du formulaire et effectue un
// appel ajax pour enregistrer les données
/******************************************************/
function soumettre(form) {
	if(!validForm(form)) {
		return false;
	}
	var params = "rubriqueid="+form.rubriqueid.value+"&titre="+form.titre.value+"&contenu="+$('#summernote').summernote('code');
	var service = form.service.value;
	$.ajax({
		url:"index.php?domaine=rubrique&service=update",
		data:params,
		method:'POST',
		dataType: 'json',
		success: function(json){
			fermerFormulaire();
			alimenterRubriques();
			return false;
		}
	});
	return false;
}

/******************************************************/
// fermerFormulaire
// permet de cacher le formulaire
/******************************************************/
function fermerFormulaire() {
	$( "#divFormulaire").hide();
}
