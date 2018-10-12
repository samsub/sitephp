$(document).ready(function() {
	alimenterNews();
	$( "#datepublication" ).datepicker();
});

/******************************************************/
// alimenterNews
// alimente le tableau des news
/******************************************************/
function alimenterNews() {
	$('#numeroPage').val($.isNumeric($('#numeroPage').val())? $('#numeroPage').val():1);
	var params = 'numeroPage='+$('#numeroPage').val();
	$.ajax({
		url: "index.php?domaine=news&service=getliste",
		data: params,
		dataType: 'json',
		success : function(resultat, statut, erreur){
			tab = document.getElementById('tableauResultat');
			$('tr[typetr=news]').remove();

			var total = resultat[0].nbLineTotal;
			var nbpage = Math.ceil(total/resultat[0].nbLine);


			$('#numeroPage').val(resultat[0].page);
			$('#rch_page').val(resultat[0].page);
			$('#max_page').val(resultat[0].totalPage);
	
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

/******************************************************/
// editernews
// permet d'afficher le formulaire pour créer ou
// modifier une news
/******************************************************/
function editernews(newsid) {
	var params="&newsid="+newsid;

	if(newsid=='') {
		document.news.service.value='create';
		document.news.newsid.value='';
		document.news.titre.value='';
		$("input[name=etatpublication]").prop('checked', false);
		document.news.datepublication.value='';
		$('#summernote').summernote('destroy');
		$('#summernote').html('');
		$('#summernote').summernote({
			height: 450,
			callbacks: {
				//callback d'upload d'image
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
				if (json[0].etatpublication==1) {
					$("input[name=etatpublication]").prop('checked', true);
				} else {
					$("input[name=etatpublication]").prop('checked', false);;
				}
				//on supprime et on ouvre l'éditeur
				$('#summernote').summernote('destroy');
				$('#summernote').html(json[0].contenu);
				$('#summernote').summernote({
					height: 450,
					callbacks: {
						//callback d'upload d'image
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
// permet d'enregistrer une news en création et 
// modification
/******************************************************/
function soumettre(form) {
	
	$.ajax({
		url:"index.php?domaine=news&service="+form.service.value,
		data: {
			newsid: $("#newsid").val(),
			titre: $("#titre").val(),
			datepublication: $("#datepublication").val(),
			etatpublication: $("#etatpublication").is(':checked'),
			contenu: $('#summernote').summernote('code')
		},
		method:'POST',
		dataType: 'json',
		success: function(json){
			//fermeture du formulaire
			fermerFormulaire();
			//mise à jour de la liste des news
			alimenterNews();
			return false;
		}
	});
	return false;
}

function supprimernews() {
	if( confirm("Confirmer la suppression?")) {
		$.getJSON(
			"index.php?domaine=news&service=suppression",
			data="newsid="+ $("#newsid").val(),
			function(json){
				fermerFormulaire();
				alimenterNews();
			}
		);
	}
}


function fermerFormulaire() {
	$( "#divFormulaire").hide();
}
