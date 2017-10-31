$(document).ready(function() {
	//$('#summernote').val($('#summernote').val().html());
	/*$('#summernote').html($('#summernote').text()).text()
	$('#summernote').summernote({
		height: 250
	});*/
	alimenterNews();
});

function alimenterNews() {

	$.ajax({
		url: "index.php?domaine=news&service=getliste",
		dataType: 'json',
		success : function(resultat, statut, erreur){
			tab = document.getElementById('tableauResultat');
			$('tr[typetr=news]').remove();

			var total = resultat[0].nbLineTotal;
			var nbpage = Math.ceil(total/resultat[0].nbLine);


			var nb=resultat[0].nbLine;
			var tabJson = resultat[0].tabResult;
			var i=0;
			for(i=0; i<nb; i++) {
				var row = $('<tr typetr="news"/>');
				row.append($('<td/>').text(tabJson[i].titre));
				row.append($('<td/>'));


				row.append($('<td class="text-center"/>').append('<a href="#" onclick="editerRubrique(\''+ tabJson[i].rubriqueid +'\')"><span class="glyphicon glyphicon-pencil"/></a>'));

				$("#tbodyResultat").append(row);
			}
		}
	});
}


/*function enregistreNews() {
	/*var params = "newsid=1&contenu="+$('#summernote').summernote('code');
	$.ajax({
		url:"index.php?domaine=news&service=update",
		data:params,
		method:'POST',
		function(json){

		}
	});
}*/
