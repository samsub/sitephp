<?php

class GestionMailContactService extends ServiceStub {

	public function envoiMail(ContextExecution $p_contexte){
		//$userid = $p_contexte->getUser()->userId;
		$prenomnom = $p_contexte->m_dataRequest->getData('prenomnom');
		$adressemail = $p_contexte->m_dataRequest->getData('adressemail');
		$sujet = $p_contexte->m_dataRequest->getData('sujet');
		$message = $p_contexte->m_dataRequest->getData('message');
		//$message = 'corps de test';
		
		$EmailTo = "samsub.merignac@gmail.com";
		
		$this->logger->debug('envoi mail');
		$this->logger->debug('prenomnom:'.$prenomnom);
		$this->logger->debug('adressemail:'.$adressemail);
		$this->logger->debug('EmailTo:'.$EmailTo);
		$this->logger->debug('sujet:'.$sujet);
		$this->logger->debug('message:'.$message);
		
		$success = mail($EmailTo, $sujet, $message, "From:".$adressemail);
		
		$reponse = new ReponseAjax();
		if ($success){
			$reponse->status='OK';
		}else{
			$reponse->status='KO';
		}
		$p_contexte->addDataBlockRow($reponse);
	}
}
?>