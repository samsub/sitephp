$(document).ready(function() {
	$( "#listeMenuPrimaire" ).sortable({
		revert: true,
		stop: function(event, ui) {
			alert("New position: " + ui.item.index());
		}
    });
	//alimenterMenu();
});

function alimenterMedia() {
	$.ajax({
		url: "index.php?domaine=media&service=getliste",
		dataType: 'json',
		success : function(resultat, statut, erreur){
			tab = document.getElementById('tableauResultat');
			$('tr[typetr="media"]').remove();

			var total = resultat[0].nbLineTotal;
			var nbpage = Math.ceil(total/resultat[0].nbLine);


			var nb=resultat[0].length;
			var tabJson = resultat[0];
			var i=0;
			for(i=0; i<nb; i++) {
				var row = $('<tr typetr="media"/>');
				row.append($('<td/>').text(tabJson[i].nom));
				row.append($('<td class="text-center"/>').append('<a href="#" onclick="suppmedia(\''+ tabJson[i].nom +'\')"><span class="glyphicon glyphicon-trash"/></a>'));

				$("#tbodyResultat").append(row);
			}
		}
	});
}


