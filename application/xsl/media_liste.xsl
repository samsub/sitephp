<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:import href="template_name.xsl"/>
    <xsl:import href="commun.xsl"/>

    <xsl:template name="js.module.sheet">
		<script language="JavaScript" src="front/js/gestionmedia.js" type="text/javascript"/>
    </xsl:template>
    <xsl:template name="Contenu">
		<div class="row">
			<div class="col-sm-3">
				<form id="ajourmedia" onsubmit="return upload();">
				<!--input type="file" class="custom-file-input" id="fichier"></input-->
				<label class="custom-file">
					<input type="file" id="fichier" class="custom-file-input"/>
					<span class="custom-file-control"></span>
				</label>
				<input type="submit" class="btn btn-primary" value="Uploader"></input>
				
				</form>
			</div>
			<div class="col-sm-9">
				<table class="table table-striped table-bordered" name="tableauResultat" id="tableauResultat">
					<thead>
						<tr>
							<th>Nom fichier</th>
							<th class="text-center">
								<xsl:value-of select="$LBL.ACTION"/>
							</th>
						</tr>
					</thead>
					<tbody id="tbodyResultat"/>
				</table>		
			</div>
		</div>
        <br/>
        <br/>
    </xsl:template>
	<xsl:template name="affichageLateral">N</xsl:template>
</xsl:stylesheet>
