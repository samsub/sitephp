<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:import href="commun.xsl"/>
    <xsl:template name="controleMenu">N</xsl:template>

	<xsl:template name="js.module.sheet">
		<script language="JavaScript" src="front/js/news_affiche.js" type="text/javascript"/>
    </xsl:template>
	
    <xsl:template name="Contenu">
        <xsl:call-template name="popup"/>
		<br/>
        <br/>
		<xsl:apply-templates select="/root/data/NewsListe/News"/>
        <br/>
        <br/>
    </xsl:template>
		
	<xsl:template name="popup">
		<div class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true" id="popupNews">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title" id="titre"></h4>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">
						<p id="introduction" class="p_introduction"/>
						<br/>
						<p id="contenu"/>
					</div>
				</div>
			</div>
		</div>
	</xsl:template>
	
	<xsl:template match="News">
		
		<div class="conteneur_news">
			<div>
				<h2 class="titre_news"><xsl:value-of select="titre"/></h2>
			</div>
			<div>Publié le <xsl:value-of select="datepublication"/> par <xsl:value-of select="concat(associatedObjet/Auteur/Membre/prenom, ' ', associatedObjet/Auteur/Membre/nom)"/></div>
			<xsl:choose>
				<xsl:when test="introduction!=''">
					<div class="contenu_news">
						<p><xsl:value-of select="introduction"/></p>
						<p><a href="#" class="" type="lirelasuite" newsid="{newsid}">Lire la suite...</a></p>
					</div>
				</xsl:when>
				<xsl:otherwise>
					<div class="contenu_news">
						<xsl:value-of select="contenu" disable-output-escaping="yes"/>
					</div>
				</xsl:otherwise>
			</xsl:choose>
		</div>	
	</xsl:template >
	
	
	
</xsl:stylesheet>
