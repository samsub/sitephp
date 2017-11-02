<?php
class User extends SavableObject {
	static private $key='userid';
	public function getPrimaryKey(){
		return self::$key;
	}
	public $userid=NULL;
	
	public $nom;
	
	public $prenom;
	
	public $login;
	
	public $motdepasse;
	
}
?>