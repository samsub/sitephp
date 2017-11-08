$(document).ready(function() {
	alimenterMedia();
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

function upload() {
	
	var form = $('form').get(0);
	var file_data = $('#fichier').prop('files')[0]; 
	var formData = new FormData(form);
	
	formData.append('fichier', file_data);
	
	$.ajax({
		type		: 'POST',
		url		: 'index.php?domaine=media&service=upload',
		data		: formData,
		dataType	: 'json',
		processData: false,
		contentType: false,
		success: function(resultat) {
			$('#fichier').val('');
			alimenterMedia();
		}
	});
	return false;
}

function suppmedia(fichier) {
	var params='fichier='+fichier
	
	$.ajax({
		type		: 'POST',
		url		: 'index.php?domaine=media&service=delete',
		data		: {
			fichier:fichier
		},
		dataType	: 'json',
		success: function(resultat) {
			alimenterMedia();
		}
	});
	return false;
}
