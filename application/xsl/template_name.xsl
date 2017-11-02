<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


<!--
  Edition d'une opération
-->
<xsl:template name="rubriqueEdition">
	<div id="boiteRubrique" title="{$LBL.EDITIONRUBRIQUE}" style="display: none;">
		<div class="popup_admin">
			<div class="container">
			<form method="POST" action="#" onsubmit="return soumettre(this);" name="rubrique" id="rubrique">
				<input type="hidden" name="service" id="service"/>
				<input type="hidden" name="rubriqueid" id="rubriqueid"/>
					<div class="row">
						<div class=" form-group col-xs-2">
							<label for="titre" class="form-control-label">
								<xsl:value-of select="$LBL.TITRE"/>
							</label>
							<input class="form-control" size="40" name="titre" id="titre" tabindex="10"/>
						</div>
					</div>
					<div class="row">
						<div class="form-group">
							<label for="contenu" class="form-control-label">
								<xsl:value-of select="$LBL.CONTENU"/>
							</label>
							<div id="summernote"/>
						</div>
						<div class="row">
							<div class="col-xs-4"/>
							<div class="form-group row">
								<div class="col-sm-offset-5 col-sm-5">
									<button type="submit" class="btn btn-primary">Valider</button>
								</div>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</xsl:template>
</xsl:stylesheet>
