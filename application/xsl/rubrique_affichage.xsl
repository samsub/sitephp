<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:import href="commun.xsl"/>
    <xsl:template name="controleMenu">N</xsl:template>

    <xsl:template name="Contenu">
        <br/>
        <h3><xsl:value-of select="/root/data/Rubrique/titre"/></h3>
        <br/>
		<xsl:value-of select="/root/data/Rubrique/contenu" disable-output-escaping="yes"/>
    </xsl:template>
</xsl:stylesheet>
