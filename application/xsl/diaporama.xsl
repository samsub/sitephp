<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:import href="commun.xsl"/>
    <xsl:template name="controleMenu">N</xsl:template>

    <xsl:template name="Contenu">
        <br/>
        <br/>
		<center>
		<section class="row" id="sectionDiaporama"/>
		<br/>
		<div class="diapo">
			<ul class="diaporama1"/>
		</div>
		</center>
        <br/>
        <br/>
		
		
    </xsl:template>
	<xsl:template name="js.module.sheet">
		<script language="JavaScript" src="front/js/convertxml2json.js" type="text/javascript"/>
		<script language="JavaScript" src="front/js/diaporama.js" type="text/javascript"/>
    </xsl:template>
	
	
	<xsl:template name="affichageLateral">N</xsl:template>
</xsl:stylesheet>
