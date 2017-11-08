<?php
class Itemmenu extends SavableObject {
	static private $key='itemmenuid';
	public function getPrimaryKey(){
		return self::$key;
	}
	public $itemmenuid=NULL;
	
	public $Nom;
	
	public $type;
	
	public $noordre;
	
	public $rubriqueid;
	
	public $itempere;
	
}
?>