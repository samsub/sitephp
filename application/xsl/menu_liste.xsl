<?xml version="1.0" encoding="ISO-8859-15"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import href="template_name.xsl"/>
    <xsl:import href="commun.xsl"/>
	<xsl:template name="js.module.sheet">
		<script language="JavaScript" src="front/js/gestionmenu.js" type="text/javascript"/>
    </xsl:template>
    <xsl:template name="Contenu">
		<div class="row">
			<div class="col-sm-3">
				<form id="ajourmedia" onsubmit="return upload();">
					<label class="custom-file">
						<input type="file" id="fichier" class="custom-file-input"/>
						<span class="custom-file-control"></span>
					</label>
					<input type="submit" class="btn btn-primary" value="Uploader"></input>
				</form>
				
				<ul id="listeMenuPrimaire">
				  <li class="ui-state-default"><a href="#">Item 1</a></li>
				  <li class="ui-state-default">Item 2</li>
				  <li class="ui-state-default">Item 3</li>
				  <li class="ui-state-default">Item 4</li>
				  <li class="ui-state-default">Item 5</li>
				</ul>
				
			</div>
			<div class="col-sm-9">
			</div>
		</div>
    </xsl:template>
	<xsl:template name="affichageLateral">N</xsl:template>
	
</xsl:stylesheet>