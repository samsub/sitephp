$(document).ready(function() {
	//$('#summernote').val($('#summernote').val().html());
	$('#summernote').html($('#summernote').text()).text()
	$('#summernote').summernote({
		height: 250
	});
});

function enregistreNews() {
	var params = "newsid=1&contenu="+$('#summernote').summernote('code');
	$.ajax({
		url:"index.php?domaine=news&service=update",
		data:params,
		method:'POST',
		function(json){
				
		}
	});
}