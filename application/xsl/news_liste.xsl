<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:import href="template_name.xsl"/>
    <xsl:import href="commun.xsl"/>

    <xsl:template name="js.module.sheet">
		<link href="front/summernote/summernote.css" rel="stylesheet"/>
        <script language="JavaScript" src="front/summernote/summernote.js" type="text/javascript"/>
        <script language="JavaScript" src="front/js/datepicker.js" type="text/javascript"/>
		<script language="JavaScript" src="front/js/sendfile.js" type="text/javascript"/>
        <script language="JavaScript" src="front/js/gestionnews.js" type="text/javascript"/>
    </xsl:template>
    <xsl:template name="Contenu">
		<div class="row">
			<div class="col-sm-3">
				<input type="button" onclick="editernews('');" value="Créer une news"></input>
				<table class="table table-striped table-bordered" name="tableauResultat" id="tableauResultat">
					<thead>
						<tr>
							<th>
								<xsl:value-of select="$LBL.TITRE"/>
							</th>
							<th class="text-center">
								<xsl:value-of select="$LBL.ACTION"/>
							</th>
						</tr>
					</thead>
					<tbody id="tbodyResultat"/>
				</table>
			</div>
			<div class="col-sm-9">
				<div id="divFormulaire" style="display:none;">
					<form method="POST" action="#" onsubmit="return soumettre(this);" name="news" id="news">
						<input type="hidden" name="service" id="service"/>
						<input type="hidden" name="newsid" id="newsid"/>
						<div class="row">
							<div class="col-sm-5">
								<label class="col-form-label" for="titre">Titre</label>
								<input class="form-control" size="40" name="titre" id="titre" tabindex="10" required="required"/>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-3">
								<label class="col-form-label" for="titre">Date de publication</label>
								<input class="form-control" size="40" name="datepublication" id="datepublication" tabindex="20" type="date" required="required"/>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-12">
								<label class="col-form-label" for="contenu">Contenu</label>
								<div id="summernote" required="required"/>
							</div>
							<div class="row">
								<div class="form-group row">
									<div class="col-sm-offset-4 col-sm-2" style="text-align:center;">
										<button type="submit" class="btn btn-primary">Valider</button>
									</div>
									<div class="col-xs-2" style="text-align:center;" onclick="fermerFormulaire()">
										<button type="button" class="btn btn-primary">Annuler</button>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>			
			</div>
		</div>
        <br/>
        <br/>
    </xsl:template>
	<xsl:template name="affichageLateral">N</xsl:template>
</xsl:stylesheet>
