<?php
class News extends SavableObject {
	static private $key='newsid';
	public function getPrimaryKey(){
		return self::$key;
	}
	public $newsid=NULL;
	
	public $titre;
	
	public $contenu;
	
}
?>