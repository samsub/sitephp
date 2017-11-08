<?php
class Membre extends SavableObject {
	static private $key='';
	public function getPrimaryKey(){
		return self::$key;
	}
	public $userid;
	
	public $nom;
	
	public $prenom;
	
}
?>