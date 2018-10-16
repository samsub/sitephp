tab1 = ["image1.jpg", "image2.jpg", "image3.jpg"];
tab2 = ["image4.jpg", "image5.jpg"];
var tableauDiapo=[]; //[tab1, tab2];
var titreDiapo=[];
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
		var div=$('<div class="col-lg-3"/>');
		div.append('<button class="btn btn-primary" onclick="afficheDiaporama('+i+')">'+tableauDiapo.diaporamas.diaporama[i]["@attributes"].titre+'</button>');
		titreDiapo[i] = tableauDiapo.diaporamas.diaporama[i]["@attributes"].titre;
		$("#sectionDiaporama").append(div);
	}
}

function afficheDiaporama(idDiapo) {
	$('.diaporama1').children().remove();
	$('.jDiaporama_controls').remove();
	$('.jDiaporama_status').remove();
	
	//tableauDiapo.diaporamas.diaporama[0]["@attributes"]
	$('#titreDiapo').text(titreDiapo[idDiapo]);
	var tabImage=tableauDiapo.diaporamas.diaporama[idDiapo].image;
	var i=0;
	for(i=0; i<tabImage.length; i++) {
		var li = $('<li style="width:100%"/>');
		$(li).append('<img src="diaporama/images/' + tabImage[i]["@attributes"].src + '" alt="'+tabImage[i]["@attributes"].alt+'" title="'+tabImage[i]["@attributes"].title+'" style="margin:0px auto;">'),
		$('.diaporama1').append(li);
	}
	$(".diaporama1").jDiaporama({
		animationSpeed: "slow",
		delay:5
	});
	
}