<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:import href="template_name.xsl"/>
    <xsl:import href="commun.xsl"/>
    
    <xsl:template name="js.module.sheet">
        <script language="JavaScript" src="front/js/gestionrubriques.js" type="text/javascript"/>
    </xsl:template>
    <xsl:template name="Contenu">
		
		<div class="row">
			<input type="hidden" id="retour" name="retour"/>
			<xsl:call-template name="operationEdition">
				<xsl:with-param name="numeroCompte" select="$NUMEROCOMPTE"/>
			</xsl:call-template>
			<form method="post" action="#" onsubmit="return rechercherOperations(this);" name="recherche" id="recherche">
				<xsl:call-template name="formulaireJson"/>
				<!--input type="hidden" id="numeroCompte" name="numeroCompte" value="{$NUMEROCOMPTE}"/>
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
						<label for="numerocompte" class="form-control-label">
							<xsl:value-of select="$LBL.SOLDE"/>
						</label>
						<input type="text" id="solde" name="solde" class="form-control numerique" readonly="readonly" size="8"/>
					</div>
					<div class="form-group">
						<label for="recDate" class="form-control-label">
							<xsl:value-of select="$LBL.DATE"/> - (YYYY-MM-DD)
						</label>
						<input type="text" id="recDate" name="recDate" class="form-control numerique" size="10"/>
					</div>
					
					<div class="form-group">
						<label for="recFlux" class="form-control-label">
							<xsl:value-of select="$LBL.FLUX"/>
						</label>
						<select name="recFlux" id="recFlux" class="form-control"  multiple="multiple"/>
					</div>
					<div class="form-group">
						<label for="recMontant" class="col-sm-5 form-control-label">
							<xsl:value-of select="$LBL.MONTANT"/>
						</label>
						<input type="text" id="recMontant" name="recMontant" class="form-control numerique" size="8"/>
					</div>
					<br/>
				</aside-->
			</form>
			<div class="col-sm-10">
				<table class="table table-striped table-bordered" name="tableauResultat" id="tableauResultat">
					<thead>
						<tr>
							<th>
								<xsl:value-of select="$LBL.TITRE"/>
							</th>
							<th>
								<xsl:value-of select="$LBL.DATE"/>
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
