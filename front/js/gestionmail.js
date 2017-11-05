$(document).ready(function() {

});

function envoyermail(form) {
	//validationFormulaire(form);
	
	$.ajax({
		type: "POST",
		url: "index.php?domaine=mail&service=envoi",
		dataType: 'json',
		data: {
			prenomnom: $("#prenomnom").val(),
			adressemail: $("#adressemail").val(),
			sujet: $("#sujet").val(),
			message: $("#message").val()
		},
		success : function(resultat, statut, erreur){
				if(resultat[0].status=='OK'){
					$("#bontonEnvoyer").attr('disabled', true);
					$("#messageok").show();
				} else {
					alert("Erreur lors de l'envoi");
				}
			}
		
	});
	return false;
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
