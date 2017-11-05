<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:import href="commun.xsl"/>
    <xsl:template name="controleMenu">N</xsl:template>

    <xsl:template name="Contenu">
		<br/>
		<div class="col-sm-offset-1 col-sm-10">
			<p>(*) Champs obligatoires</p>
			<br/>
			<form id="formmail" method="POST" onsubmit="return envoyermail(this);">
				<div class="row">
					<div class="col-sm-5">
						<label class="col-form-label" for="prenomnom">Prénom et nom (*)</label>
						<input type="text" class="form-control" id="prenomnom" placeholder="Vos prénom et nom" maxlength="40" required="required"/>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-5">
						<label class="col-form-label" for="adressemail">E-mail (*)</label>
						<div class="input-group mb-2 mb-sm-0">
							<div class="input-group-addon">@</div>
							<input type="email" class="form-control" id="adressemail" placeholder="Votre e-mail" maxlength="40" required="required"/>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-5">
						<label class="col-form-label" for="sujet">Sujet</label>
						<input type="text" class="form-control" id="sujet" placeholder="Sujet" maxlength="40" required="required"/>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-9">
						<label class="col-form-label" for="message">Message (*)</label>
						<textarea id="message" class="form-control" rows="6" required="required"/>
					</div>
				</div>
				<br/>
				<div  class="col-sm-9" style="text-align:center">
					<button type="submit" id="bontonEnvoyer" class="btn btn-primary">Envoyer</button>
				</div>
				<div  class="col-sm-9" id="messageok" style="text-align:center;display:none;">Votre email a bien été envoyé.</div>
			</form>
		</div>
    </xsl:template>
	<xsl:template name="js.module.sheet">
		<script language="JavaScript" src="front/js/gestionmail.js" type="text/javascript"/>
    </xsl:template>
</xsl:stylesheet>
