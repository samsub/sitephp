<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:import href="commun.xsl"/>
    <xsl:template name="controleMenu">N</xsl:template>

    <xsl:template name="Contenu">
        <br/>
        <br/>
		<center>
		<section class="row" id="sectionDiaporama">
			<!--div class="col-lg-2">
				<button class="btn btn-primary" onclick="afficheDiaporama(0)">D1</button>
			</div>
			<div class="col-lg-2">
				<button class="btn btn-primary" onclick="afficheDiaporama(1)">D2</button>
			</div-->
			
		</section>
		
		<br/>
		<div class="diapo">
			<ul class="diaporama1">
				<!--li><img src="front/diaporama/image1.jpg" alt="On the road again" title="Sur la route de l'ouest, Arizona Guillaume Voisin" /></li>
				<li><img src="front/diaporama/image2.jpg" alt="Venice Beach, California" /></li>
				<li><img src="front/diaporama/image3.jpg" alt="" title="Les garde-côte sur les plages de Malibu  Guillaume Voisin" /></li>
				<li><img src="front/diaporama/image4.jpg" alt="Universal Studios" title="Le parc d'attractions Universal Studios Guillaume VoisinGrande grande description blabla blabla blabla blabla blabla blabla blabla blabla blabla blabla blabla blabla blabla blabla" /></li>
				<li><img src="front/diaporama/image5.jpg" alt="Hollywood Sign" title="Le fameux panneau Hollywood sur la colline Guillaume Voisin" /></li-->
			</ul>
		</div>
		</center>
        <br/>
        <br/>
		
		
    </xsl:template>
	<xsl:template name="js.module.sheet">
		<script language="JavaScript" src="front/js/convertxml2json.js" type="text/javascript"/>
		<script language="JavaScript" src="front/js/diaporama.js" type="text/javascript"/>
    </xsl:template>
	
	
	
</xsl:stylesheet>
