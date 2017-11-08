<?php

/**
 * Description of GenerateurMenu
 *
 * @author ingeni
 *
 */
class GenerateurMenu {

	/**
	 * 
	 */
	public static function genereMenu(){
		$requeteSecondaire = 'SELECT itemmenuid, nom, noordre, url FROM itemmenu '
			. 'LEFT JOIN rubrique ON itemmenu.rubriqueid=rubrique.rubriqueid '
			. 'WHERE itempere=\'$parent->itemmenuid\' ORDER BY noordre';
		$listeSousMenus = new ListDynamicObject();
		$listeSousMenus->name = 'listeSousMenus';
		$listeSousMenus->setAssociatedRequest(null,$requeteSecondaire);
		
		$requetePrimaire = 'SELECT itemmenuid, nom, type, noordre, url FROM itemmenu '
			. 'LEFT JOIN rubrique ON itemmenu.rubriqueid=rubrique.rubriqueid '
			. "WHERE itempere='0' ORDER BY noordre";
		
		$listeMenuPrimaire = new ListDynamicObject();
		$listeMenuPrimaire->name = 'ListeMenuPrimaire';
		$listeMenuPrimaire->setAssociatedKey($listeSousMenus);
		
		$listeMenuPrimaire->request($requetePrimaire);
		
		return $listeMenuPrimaire;
    }
}
?>
