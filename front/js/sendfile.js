/******************************************************/
// sendFile
// permet d'uploader un fichier et de mettre à jour le
// wisiwig
/******************************************************/
function sendFile(file,editor,welEditable) {
    data = new FormData();
    data.append("file", file);
    $.ajax({
        data: data,
        type: "POST",
        url: "index.php?domaine=media&service=uploadImage",
        cache: false,
		dataType: 'json',
        contentType: false,
        processData: false,
        success: function(retour) {
			if(retour[0].status=='OK'){
				var image = retour[0].valeur;
				editor.summernote("insertImage", image);
			} else {
				alert("Erreur d'upload!");
				return false;
			}
        }
    });
}
