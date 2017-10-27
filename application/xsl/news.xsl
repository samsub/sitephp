<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:import href="commun.xsl"/>
    <xsl:template name="controleMenu">N</xsl:template>

    <xsl:template name="Contenu">
        <br/>
        <br/>
        <br/>
        <br/>
		<div id="summernote"><xsl:value-of select="/root/data/News/contenu"/></div>
		
        <br/>
		
		<input type="button" onclick="enregistreNews();">enregistre</input>
		
    </xsl:template>
	<xsl:template name="js.module.sheet">
		<link href="front/summernote/summernote.css" rel="stylesheet"/> 
        <script language="JavaScript" src="front/summernote/summernote.js" type="text/javascript"/>
        <script language="JavaScript" src="front/js/gestionnews.js" type="text/javascript"/>
    </xsl:template>
</xsl:stylesheet>
