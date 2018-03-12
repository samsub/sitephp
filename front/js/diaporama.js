tab1 = ["image1.jpg", "image2.jpg", "image3.jpg"];
tab2 = ["image4.jpg", "image5.jpg"];
var tableauDiapo=[]; //[tab1, tab2];
$(document).ready(function(){
	
	$.ajax({
		url: 'diaporama/diaporama.xml',
		success: function(data) {
			tableauDiapo=xmlToJson(data);
			initListeDiaporama();
			afficheDiaporama(0);
		}
	});
	
	

});


function initListeDiaporama() {
	for(i=0; i<tableauDiapo.diaporamas.diaporama.length; i++) {
		var div=$('<div class="col-lg-2"/>');
		div.append('<button class="btn btn-primary" onclick="afficheDiaporama('+i+')">'+tableauDiapo.diaporamas.diaporama[i]["@attributes"].titre+'</button>');
		$("#sectionDiaporama").append(div);
	}
}

function afficheDiaporama(idDIapo) {
	$('.diaporama1').children().remove();
	$('.jDiaporama_controls').remove();
	$('.jDiaporama_status').remove();
	
	//tableauDiapo.diaporamas.diaporama[0]["@attributes"]
	
	var tabImage=tableauDiapo.diaporamas.diaporama[idDIapo].image;
	var i=0;
	for(i=0; i<tabImage.length; i++) {
		var li = $('<li/>');
		$(li).append('<img src="diaporama/images/' + tabImage[i]["@attributes"].src + '" alt="'+tabImage[i]["@attributes"].alt+'" title="'+tabImage[i]["@attributes"].title+'" style="width:700px">'),
		$('.diaporama1').append(li);
	}
	$(".diaporama1").jDiaporama({
		animationSpeed: "slow",
		delay:5
	});
	
}