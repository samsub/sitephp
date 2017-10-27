<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of List
 *
 * @author ingeni
 */
abstract class ListStructure extends Objects {
    //put your code here
    protected $associatedKey= array();
    //public $associatedObjet = array();
    
	private $logger;
	
	public function __construct(){
		parent::__construct();
		//$this->logger = Logger::getRootLogger();
	}
	protected function getLogger() {
		if($this->logger==null) {
			$this->logger = Logger::getRootLogger();
		}
		return $this->logger;
	}
	
    public function setAssociatedKey(IList $list){
        $this->associatedKey[]=$list;
    }
    
    //contient les donn�es de la requ�te associ�e
    private $associatedClasse;
    private $associatedClause;
    public function setAssociatedRequest($classe, $clause){
        $this->associatedClasse=$classe;
        $this->associatedClause=$clause;
        $this->getLogger()->debug('clause this:'.$this->associatedClause);
    }
    
    /**
     * fonction ex�cutant les requ�tes associ�es� l'objet en cours
     * 
     */
    public function callAssoc() {
        if(count($this->associatedKey)!=0){
        	//pour chaque row de la requete principale
            foreach ($this->getData() as $element) {
            	//on ex�cute chaque requ�te associ�e
                foreach ($this->associatedKey as $sousrequete) {
                	//on clone la cl� pour la garder intacte pour les autres rows
                    $nsous = clone $sousrequete;
                    $nsous->execAssociatedRequest($element);
                    $element->associatedObjet[]=$nsous;
                }
            }
        }
    }
    
    /**
     * Execute une requ�te associ�e
     * @param unknown_type $parent objet parent dans la structure de donn�es
     */
    private function execAssociatedRequest($parent){
        $this->getLogger()->debug('clause av:'.$this->associatedClause);
        $this->getLogger()->debug('name:'.$this->name);
        $retour=null;
        $clause=null;
        eval("\$clause=\"$this->associatedClause\";");
        $this->logger->debug('clause:'.$clause);
        if($this->associatedClasse!=null){
            $retour=$this->request($this->associatedClasse, $clause);
        } else {
            $retour=$this->request($clause);
        }
    }
    
   abstract public function request($st1, $st2=null,$st3=null);
    
}
?>