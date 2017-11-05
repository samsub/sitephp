<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:import href="commun.xsl"/>
    <xsl:template name="controleMenu">N</xsl:template>

    <xsl:template name="Contenu">
        <br/>
        <br/>
		<xsl:apply-templates select="/root/data/NewsListe/News"/>
		
		
        <br/>
        <br/>
		
		
    </xsl:template>
	<xsl:template name="js.module.sheet">
    </xsl:template>
	
	<xsl:template match="News">
		<div class="conteneur_news">
			<div>
				<h2 class="titre_news"><xsl:value-of select="titre"/></h2>
			</div>
			<div>Publié le <xsl:value-of select="datepublication"/> par <xsl:value-of select="concat(associatedObjet/Auteur/Membre/prenom, ' ', associatedObjet/Auteur/Membre/nom)"/></div>
			<div class="contenu_news">
				<xsl:value-of select="contenu" disable-output-escaping="yes"/>
			</div>
		
		</div>
	</xsl:template >
	
	
	
</xsl:stylesheet>
