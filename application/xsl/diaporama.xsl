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
			<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
				<div class="carousel-inner">
					<div class="carousel-item active">
					<img class="d-block" src="diaporama/images/2018-03-01-001.jpg" alt="First slide"/>
					</div>
					<div class="carousel-item">
					<img class="d-block" src="diaporama/images/2018-03-01-002.jpg" alt="Second slide"/>
					</div>
					<div class="carousel-item">
					<img class="d-block" src="diaporama/images/2018-03-01-003.jpg" alt="Third slide"/>
					</div>
				</div>
				<a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a>
				<a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>
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
