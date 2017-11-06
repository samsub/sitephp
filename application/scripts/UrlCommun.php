<?php
public class UrlCommun {
	
	public static function caractereValideUrl($string) {
		$string= strtr($string,
			"ÀÁÂÃÄÅàáâãäåÒÓÔÕÖØòóôõöøÈÉÊËèéêëÇçÌÍÎÏìíîïÙÚÛÜùúûüÿÑñ",
			"aaaaaaaaaaaaooooooooooooeeeeeeeecciiiiiiiiuuuuuuuuynn");

		// Mettez ici les caractères spéciaux qui seraient susceptibles d'apparaître dans les titres. La liste ci-dessous est indicative.
		$speciaux = array("?","!","@","#","%","&amp;","*","(",")","[","]","=","+"," ",";",":","'",".","_");
		$string = str_replace($speciaux, "-", $string); // Les caractères spéciaux dont les espaces, sont remplacés par un tiret.
		$string = strtolower(strip_tags($string));

		return $string;
	}

	
}



?>