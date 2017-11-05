$(document).ready(function() {
	alimenterNews();
	$( "#datepublication" ).datepicker();
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
				
				row.append($('<td class="text-center"/>').append('<a href="#" onclick="editernews(\''+ tabJson[i].newsid +'\')"><span class="glyphicon glyphicon-pencil"/></a>'));

				$("#tbodyResultat").append(row);
			}
		}
	});
}

function editernews(newsid) {
	var params="&newsid="+newsid;

	if(newsid=='') {
		document.news.service.value='create';
		document.news.newsid.value='';
		document.news.titre.value='';
		document.news.datepublication.value='';
		$('#summernote').summernote('destroy');
		$('#summernote').html('');
		$('#summernote').summernote({
			height: 450,
			callbacks: {
				onImageUpload: function(files, editor, welEditable) {
					sendFile(files[0],$('#summernote'),welEditable);
				}
			}
		});
		$( "#divFormulaire").show();
	} else {
		$.getJSON(
			"index.php?domaine=news&service=getone",
			data=params,
			function(json){
				document.news.service.value='update';
				document.news.newsid.value=json[0].newsid;
				document.news.titre.value=json[0].titre;
				document.news.datepublication.value=json[0].datepublication;
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
}

/******************************************************/
// soumettre
/******************************************************/
function soumettre(form) {
	var service = form.service.value;
	$.ajax({
		url:"index.php?domaine=news&service="+service,
		data: {
			newsid: $("#newsid").val(),
			titre: $("#titre").val(),
			datepublication: $("#datepublication").val(),
			contenu: $('#summernote').summernote('code')
		},
		method:'POST',
		dataType: 'json',
		success: function(json){
			$( "#divFormulaire").hide();
			alimenterNews();
			return false;
		}
	});
	return false;
}

function fermerFormulaire() {
	$( "#divFormulaire").hide();
}
