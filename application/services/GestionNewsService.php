<?php

class GestionNewsService extends ServiceStub {

	public function gesListe(ContextExecution $p_contexte){
				
	}

	public function getOne(ContextExecution $p_contexte){
		//$userid = $p_contexte->getUser()->userId;
		//$numeroCompte = $p_contexte->m_dataRequest->getData('numeroCompte');
		$news = new News();
		$news->newsid = 1;
		$news->load();
		$news->contenu = html_entity_decode($news->contenu);
		$p_contexte->addDataBlockRow($news);
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
        $newsid = $p_contexte->m_dataRequest->getData('newsid');
        $contenu = $p_contexte->m_dataRequest->getData('contenu');
        $news = new News();
        $news->newsid = $newsid;
        $news->load();
        $news->contenu=html_entity_decode($contenu);
        $news->update();
		$p_contexte->addDataBlockRow($news);
    }
	
	public function getListe(ContextExecution $p_contexte){
        $requete = "SELECT newsid, titre, datepublication, contenu FROM news";
		$listeLibelles = new ListDynamicObject();
		$listeLibelles->name = 'ListeLibelles';
		$listeLibelles->request($requete, 1);
		$p_contexte->addDataBlockRow($listeLibelles);
    }
}
?>
