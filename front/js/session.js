
function deconnexion() {
	$.ajax({
		url: "index.php?domaine=technique&service=deconnexion",
		dataType: 'json',
		success : function(resultat, statut, erreur){
			document.location.href='index.html';
		}
	});
}