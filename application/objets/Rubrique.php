<?php
class Rubrique extends SavableObject {
	static private $key='rubriqueid';
	public function getPrimaryKey(){
		return self::$key;
	}
	public $rubriqueid=NULL;
	
	public $titre;
	
	public $url;
	
	public $contenu;
	
}
?>