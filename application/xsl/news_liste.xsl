<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:import href="template_name.xsl"/>
    <xsl:import href="commun.xsl"/>

    <xsl:template name="js.module.sheet">
		<link href="front/summernote/summernote.css" rel="stylesheet"/>
        <script language="JavaScript" src="front/summernote/summernote.js" type="text/javascript"/>
        <script language="JavaScript" src="front/js/gestionnews.js" type="text/javascript"/>
    </xsl:template>
    <xsl:template name="Contenu">

		<div class="row">
			<input type="hidden" id="retour" name="retour"/>
			<xsl:call-template name="rubriqueEdition"/>

			<form method="post" action="#" onsubmit="return rechercherOperations(this);" name="recherche" id="recherche">
				<xsl:call-template name="formulaireJson"/>
				<aside class="col-sm-2 formulaire">
					<br/>
					<div class="btn-toolbar justify-content-between" role="toolbar" aria-label="Toolbar with button groups">
						<div class="btn-group" role="group" aria-label="First group">
							<button type="submit" class="btn btn-primary">Rechercher</button>
						</div>

						<div class="btn-group" role="group" aria-label="Third group" style="float:right;">
							<button type="button" class="btn btn-primary" id="" name="" onclick="editerOperation('{$NUMEROCOMPTE}','');" style="font-size:20px;">
								<span class="glyphicon glyphicon-plus"/>
							</button>
						</div>
					</div>

					<div class="form-group">
						<label for="recDate" class="form-control-label">
							<xsl:value-of select="$LBL.DATE"/> - (YYYY-MM-DD)
						</label>
						<input type="text" id="recDate" name="recDate" class="form-control numerique" size="10"/>
					</div>



					<br/>
				</aside>
			</form>
			<div class="col-sm-10">
				<table class="table table-striped table-bordered" name="tableauResultat" id="tableauResultat">
					<thead>
						<tr>
							<th>
								<xsl:value-of select="$LBL.TITRE"/>
							</th>
							<th>
								<xsl:value-of select="$LBL.DATEPUBLICATION"/>
							</th>
							<th class="text-center">
								<xsl:value-of select="$LBL.ACTION"/>
							</th>
						</tr>
					</thead>
					<tbody id="tbodyResultat"/>
				</table>

				<!--xsl:call-template name="paginationJson">
					<xsl:with-param name="formulairePrincipal" select="'recherche'"/>
				</xsl:call-template-->
			</div>
		</div>
        <br/>



        <br/>
    </xsl:template>
</xsl:stylesheet>
