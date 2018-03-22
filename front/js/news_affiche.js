$(document).ready(function() {
	$('a[type=lirelasuite]').click(
		function( event ) {
			var params='newsid='+$(this).attr('newsid');
			$.getJSON(
				"index.php?domaine=news&service=getone",
				data=params,
				function(json){
					$('#titre') .html(json[0].titre);
					$('#introduction') .html(json[0].introduction);
					$('#contenu') .html(json[0].contenu);
					//affichage popup
					$('#popupNews').modal('show');
				}
			);
			
		}
	);
});

