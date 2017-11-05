<?php
class Membre extends SavableObject {
	static private $key='userid';
	public function getPrimaryKey(){
		return self::$key;
	}
	public $userid=NULL;
	
	public $nom;
	
	public $prenom;
	
}
?>