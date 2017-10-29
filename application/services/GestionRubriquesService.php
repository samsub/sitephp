<?php

class GestionRubriquesService extends ServiceStub {

	public function getListe(ContextExecution $p_contexte){
		$requete="SELECT rubriqueid, titre FROM rubrique";
		$listeRubriques = new ListDynamicObject();
		$listeRubriques->name = 'ListeRubriques';
		$listeRubriques->request($requete, 1);
		$p_contexte->addDataBlockRow($listeRubriques);
	}

	public function getOne(ContextExecution $p_contexte){
		//$userid = $p_contexte->getUser()->userId;
		$rubriqueid = $p_contexte->m_dataRequest->getData('rubriqueid');
		$rubrique = new Rubrique();
		$rubrique->rubriqueid = $rubriqueid;
		$rubrique->load();
		//$rubrique->contenu = html_entity_decode($news->contenu);
		$p_contexte->addDataBlockRow($rubrique);
	}

	public function create(ContextExecution $p_contexte){
        /*$userid = $p_contexte->getUser()->userId;
        $numeroCompte = $p_contexte->m_dataRequest->getData('numeroCompte');
        $compte = new Comptes();
        $compte->numeroCompte = $numeroCompte;
        $compte->userId = $userid;
        $compte->fieldObject($p_contexte->m_dataRequest);
        $compte->create();*/
    }

    public function update(ContextExecution $p_contexte){
        $rubriqueid = $p_contexte->m_dataRequest->getData('rubriqueid');
        $contenu = $p_contexte->m_dataRequest->getData('contenu');
        $rubrique = new Rubrique();
        $rubrique->rubriqueid = $rubriqueid;
        $rubrique->load();
        $rubrique->contenu=html_entity_decode($contenu);
        $rubrique->update();
		//$p_contexte->addDataBlockRow($rubrique);
    }
}
?>
