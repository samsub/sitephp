<?php 

class GestionMediaService extends ServiceStub {
	
	public function uploadImage(ContextExecution $p_contexte){
		$reponse = new ReponseAjax();
		$reponse->status = 'KO';
		
		if(isset($_FILES))
		{
			if(!$_FILES['file']['error'])
			{
				if(preg_match("/image/", $_FILES['file']['type']))
				{
					$filename = $_FILES['file']['name'];
					$destination = RACINE_SITE.'/'.REPERTOIRE_UPLOAD.'/' . $filename;
					$location = $_FILES["file"]["tmp_name"];
					
					$this->logger->debug('location: '. $location);
					$this->logger->debug('destination: '. $destination);
					$retour=move_uploaded_file($location, $destination);
					if($retour) {
						$reponse->status = 'OK';
						$reponse->valeur = REPERTOIRE_UPLOAD.'/' . $filename;
					} else {
						$reponse->status = 'KO';
						$reponse->valeur = 'pb move';
					}
				}
				else
				{
					$reponse->message = 'El tipo de archivo no es una imagen';
				}
			}
			else
			{
				$reponse->message = "La imagen no se ha subido correctamente error(".$_FILES['file']['error'].")";
			}	
		}
		else
		{
			$reponse->message = "No se ha enviado ningun archivo";
		}

		$p_contexte->addDataBlockRow($reponse);
	}

	public function upload(ContextExecution $p_contexte){
		$reponse = new ReponseAjax();
		$reponse->status = 'KO';
		
		if(isset($_FILES))
		{
			if(!$_FILES['fichier']['error'])
			{
				
				$filename = $_FILES['fichier']['name'];
				$destination = RACINE_SITE.'/'.REPERTOIRE_UPLOAD.'/' . $filename;
				$location = $_FILES['fichier']["tmp_name"];
				$this->logger->debug('location: '. $location);
				$this->logger->debug('destination: '. $destination);
				$retour=move_uploaded_file($location, $destination);
				if($retour) {
					$reponse->status = 'OK';
					$reponse->valeur = REPERTOIRE_UPLOAD.'/' . $filename;
				} else {
					$reponse->status = 'KO';
					$reponse->valeur = 'pb move';
				}
				
			}
			else
			{
				$reponse->message = "La imagen no se ha subido correctamente error(".$_FILES['file']['error'].")";
			}	
		}
		else
		{
			$reponse->message = "No se ha enviado ningun archivo";
		}

		$p_contexte->addDataBlockRow($reponse);
	}
	
	
	public function getListe(ContextExecution $p_contexte) {
		$repertoire = REPERTOIRE_UPLOAD;
		$dir = opendir($repertoire); 
		
		$retour = array();
		
		while($file = readdir($dir)) {
			if($file != '.' && $file != '..' && !is_dir($repertoire.'/'.$file))
			{
				$fichier = array();
				$fichier['nom']=$file;
				$retour[]=$fichier;
			}
		}
		$p_contexte->addDataBlockRow($retour);
	}

	public function delete(ContextExecution $p_contexte) {
		$fichier = html_entity_decode($p_contexte->m_dataRequest->getData('fichier'));
		unlink('./'.REPERTOIRE_UPLOAD.'/'.$fichier);
		$p_contexte->ajoutReponseAjaxOK();
	}
}


?>