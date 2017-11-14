
/******************************************************/
// connexion
// permet d'ouvrir une session via un appel ajax
/******************************************************/
function connexion() {
	var form = $('form').get(0);
	var params = 'nom='+$('#nom').val()+'&motDePasse='+$('#motDePasse').val();
	$.ajax({
		type: 'POST',
		url: "index.php?domaine=technique&service=connexion",
		dataType: 'json',
		data		: params,
		success : function(retour, statut, erreur){
			if(retour[0].status=='OK'){
				document.location.href='index.html';
			} else {
				alert(retour[0].message);
				return false;
			}
		}
	});
	return false;
}

/******************************************************/
// deconnexion
// permet de fermer une session via un appel ajax
/******************************************************/
function deconnexion() {
	$.ajax({
		url: "index.php?domaine=technique&service=deconnexion",
		dataType: 'json',
		success : function(resultat, statut, erreur){
			document.location.href='index.html';
		}
	});
}
