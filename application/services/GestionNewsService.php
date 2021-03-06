<?php

class GestionNewsService extends ServiceStub {

	public function gesListe(ContextExecution $p_contexte){
				
	}

	public function getOne(ContextExecution $p_contexte){
		$newsid = $p_contexte->m_dataRequest->getData('newsid');
		//$numeroCompte = $p_contexte->m_dataRequest->getData('numeroCompte');
		$news = new News();
		$news->newsid = $newsid;
		$news->load();
		$news->contenu = html_entity_decode($news->contenu);
		$p_contexte->addDataBlockRow($news);
	}

	public function create(ContextExecution $p_contexte){
        $userid = $p_contexte->getUser()->userId;
        $contenu = $p_contexte->m_dataRequest->getData('contenu');
        $news = new News();
        $news->auteur = $userid;
        $news->fieldObject($p_contexte->m_dataRequest);
		/*if($news->datefinpublication=='') {
			$news->datefinpublication=null;
		}*/
		
		$news->contenu=html_entity_decode($contenu);
        $news->create();
		$p_contexte->ajoutReponseAjaxOK();
    }

    public function update(ContextExecution $p_contexte){
        $newsid = $p_contexte->m_dataRequest->getData('newsid');
        $contenu = $p_contexte->m_dataRequest->getData('contenu');
        $news = new News();
        $news->newsid = $newsid;
        $news->load();
		$news->fieldObject($p_contexte->m_dataRequest);
        $news->contenu=html_entity_decode($contenu);
		/*if($news->datefinpublication=='') {
			$news->datefinpublication=null;
		}*/
        $news->update();
		//$p_contexte->addDataBlockRow($news);
		$p_contexte->ajoutReponseAjaxOK();
    }
	
	public function delete(ContextExecution $p_contexte){
        $newsid = $p_contexte->m_dataRequest->getData('newsid');
        $news = new News();
        $news->newsid = $newsid;
        $news->load();
		$news->delete();
		$p_contexte->ajoutReponseAjaxOK();
    }
	
	public function getListe(ContextExecution $p_contexte){
        $numeroPage=$p_contexte->m_dataRequest->getData('numeroPage');
		$page=1;
		if($numeroPage!=null && $numeroPage!='') {
        	$page=$numeroPage;
        }
		$requete = "SELECT newsid, titre, datepublication, contenu FROM news ORDER BY datepublication DESC";
		$listeNews = new ListDynamicObject();
		$listeNews->name = 'ListeLibelles';
		$listeNews->request($requete, $page);
		$p_contexte->addDataBlockRow($listeNews);
    }
	
	public function affiche(ContextExecution $p_contexte){
		$auteur = new ListObject();
        $auteur->name='Auteur';
        $l_clause=' userid=$parent->auteur'; 
        $auteur->setAssociatedRequest('Membre', $l_clause);
        
		$listeNews = new ListObject();
		$listeNews->name = 'NewsListe';
		$listeNews->setAssociatedKey($auteur);
		$clause = ' etatpublication=1 AND archive=0 ORDER BY datepublication DESC';
		$listeNews->request('News', $clause);
		$p_contexte->addDataBlockRow($listeNews);
	}
	
	public function archive(ContextExecution $p_contexte){
		$numeroPage=$p_contexte->m_dataRequest->getData('numeroPage');
		$page=1;
		if($numeroPage!=null && $numeroPage!='') {
        	$page=$numeroPage;
        }
		$auteur = new ListObject();
        $auteur->name='Auteur';
        $l_clause=' userid=$parent->auteur'; 
        $auteur->setAssociatedRequest('Membre', $l_clause);
        
		$listeNews = new ListObject();
		$listeNews->name = 'NewsListe';
		$listeNews->setAssociatedKey($auteur);
		$clause = ' etatpublication=1 AND archive=1 ORDER BY datepublication DESC';
		$listeNews->request('News', $clause);
		$p_contexte->addDataBlockRow($listeNews, $page);
	}
}
?>
