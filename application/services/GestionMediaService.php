<?php 

class GestionMediaService extends ServiceStub {
	
	public function uploadImage(ContextExecution $p_contexte){
		$reponse = new ReponseAjax();
		//$message['is_ok'] = false;
		$reponse->status = 'KO';
		
		if(isset($_FILES))
		{
			if(!$_FILES['file']['error'])
			{
				if(preg_match("/image/", $_FILES['file']['type']))
				{
					//$name = md5(rand(100, 200));
					//$ext = explode('.', $_FILES['file']['name']);
					$filename = $_FILES['file']['name']; //$name . '.' . $ext[1];
					$destination = RACINE_SITE .'/front/upload/' . $filename;
					$location = $_FILES["file"]["tmp_name"];
					//$this->logger->debug('file: '. __FILE__);
					$this->logger->debug('location: '. $location);
					$this->logger->debug('destination: '. $destination);
					$retour=move_uploaded_file($location, $destination);
					//$message['url'] = '/summernote/images/' . $filename; 
					//$message['is_ok'] = true;
					if($retour) {
						$reponse->status = 'OK';
						$reponse->valeur = 'front/upload/' . $filename;
					} else {
						$reponse->status = 'KO';
						$reponse->valeur = 'pb move';
					}
				}
				else
				{
					//$message['error'] = 'El tipo de archivo no es una imagen';
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

		//echo json_encode($message);
		$p_contexte->addDataBlockRow($reponse);
	}
	
}


?>