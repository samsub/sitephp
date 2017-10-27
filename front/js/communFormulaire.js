
var ERRINTEGER = "Le champ saisi comporte des caract�res non num�riques, veuillez le ressaisir SVP";

/* Contr�le sur le format chiffre
*/
function isDigit (c) 
{
	return ((c >= "0") && (c <= "9"));
}
/* Contr�le sur le format num�rique
*/
var errDouble = "Le champ saisi comporte des caract�res non num�riques, veuillez le ressaisir SVP";
function isDouble (s) 
{
	var i;
	for (i = 0; i < s.value.length; i++) 
	{
		var c = s.value.charAt(i);
		if ((c=='-') && (i==0)) ;
			else if ((!isDigit(c)) && (c!='.') || !s.value.match(/^\d*\D?\d*$/))
		{
					alert(errDouble);
					s.select();
					s.focus();
					return false;
		}
	}
	return true;
}

/* Contr�le sur le format double avec possiblit� de saisir un double n�gatif
*/
function isDouble (s)
{
	var partieDecimale = false;
	for (var i = 0; i < s.value.length; i++)
	{	
		var c = s.value.charAt(i);

		if ((i == 0 && c == "-") || isDigit(c)) { /* ok */  }
		else if (c == "." && partieDecimale == false)
		{
			partieDecimale = true;
		}
		else 
		{
			alert(ERRINTEGER);
			s.select();
			s.focus();
			return false;
		}
	}
	return true;
}

/**
 * fonction de validation des formulaire
 */
function validForm(pForm) {
	//$('#new_user_form input, #new_user_form select').each(function(key, value) {
	/*$($(pForm).prop('elements')).each(function(indice, objet){
		//this
		if(objet.attr('class').indexOf('obligatoire').indexOf("obligatoire")!=-1 && e.value =='') {
			alert('Champs obligatoire!!!');
			return false;
		}
	});*/
		
		
	for (var i=0; i < pForm.elements.length; i++) {
		var e = pForm.elements[i];
		if((e.className.indexOf("obligatoire")!=-1 || e.className.indexOf("numerique_obligatoire")!=-1)  && e.value =='') {
			alert('Champs obligatoire!!!');
			return false;
		}
		
		if(e.className.indexOf("numerique")!=-1 || e.className.indexOf("numerique_obligatoire")!=-1) {
			if(!isDouble(e)) {
				return false;
			}
		}
	}
	return true;
}

