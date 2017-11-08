<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE html>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import href="menu.xsl"/>
	<!--xsl:output method="html" version="5.0" encoding="UTF-8" indent="yes" /-->
	<xsl:output indent="yes" method="html" omit-xml-declaration="yes" />
	<!--regle principal-->
	<xsl:template match="/">
		<xsl:variable name="affichageLateral">
			<xsl:call-template name="affichageLateral"/>
		</xsl:variable>
		<!--xsl:value-of select="'&lt;!DOCTYPE html&gt;'"  disable-output-escaping="yes"/-->
		<xsl:text disable-output-escaping="yes">&lt;!DOCTYPE html&gt;</xsl:text>
		<html lang="fr">
			<!-- entête HTML -->
			<xsl:call-template name="Header">
				<xsl:with-param name="HeadTitre"><xsl:value-of select="/root/titre"/></xsl:with-param>
			</xsl:call-template>
			<body>
				<xsl:attribute name="onload">
					<xsl:call-template name="onLoadTemplate"/>
				</xsl:attribute>
				<div class="container">
					<!-- bannière -->
					<div class="row" id="banniere_centre">
						<div class="col-xs-12"><br/></div>
						<!--div class="col-xs-2"><span class="align-middle"><img src="front/images/LogoSUB.png" width="180px"/></span-->
						<div class="col-xs-2"><img src="front/images/logo_t.png" width="180px" alt="logo sub"/></div>
						<div class="col-xs-8"><br/></div>
						<div class="col-xs-2"><img src="front/images/logo_sam_t.png"  width="180px" alt="logo sam"/></div>
						<div class="col-xs-12"><br/></div>
						<div class="col-xs-12"><br/></div>
						<div class="col-xs-12"><br/></div>
						<!--xsl:call-template name="menuDynamique"/-->
						<xsl:call-template name="BarreMenu"/>
						<!--div class="col-xs-12"><br/></div>
						<div class="col-xs-12"><br/></div-->
					<!-- menu -->
						<div class="row"><br/></div>
					</div>
					
					<xsl:choose>
						<xsl:when test="$affichageLateral='O'">
							<div class="row">
								<div class="col-sm-9">
									<xsl:call-template name="Contenu"/>
								</div>
								<aside>
									<br/>
									<div class="col-sm-3">
										<div class="cadre_bord_rond colonne_droite">
											<xsl:call-template name="LiensUtiles"/>
										</div>
									</div>
								</aside>
							</div>
						</xsl:when>
						<xsl:otherwise>
							<xsl:call-template name="Contenu"/>
						</xsl:otherwise>
					</xsl:choose>

					<div class="row">
						<!--div class="col-xs-4"></div-->
						<div class="col-xs-12 cadre_bord_rond">
							<br/>
							<p style="text-align:center;">Copyright © 2017 Sam Subaquatique Mérignac - Tous droits réservés</p>
							<br/>
						</div>
					</div>
				</div>

			</body>
		</html>
	</xsl:template>
	<!-- template entete -->
	<xsl:template name="entete">
		<!-- banniere -->
		<xsl:call-template name="banniere"/>
		<!-- menu -->
		<xsl:variable name="affMenu">
			<xsl:call-template name="controleMenu"/>
		</xsl:variable>
		<xsl:if test="$affMenu='O'">
			<xsl:call-template name="menu"/>
		</xsl:if>
	</xsl:template>
	<!--header de la domaine-->
	<xsl:template name="Header">
		<xsl:param name="HeadTitre"/>
		<head>
			<title>Samsubaquatique</title>
			<meta content="text/html;charset=UTF-8" http-equiv="content-type"/>
			<meta NAME="DESCRIPTION" CONTENT="Samsubaquatique"/>
			<meta NAME="KEYWORDS" CONTENT="site web"/>
			<meta http-equiv="Pragma" content="no-cache"/>
			<meta http-equiv="Cache-Control" content="no-cache"/>
			<meta http-equiv="Expires" content="0"/>
			<meta http-equiv="X-UA-Compatible" content="IE=8"/>

			<link href="front/bootstrap/bootstrap-{$BOOTSTRAP-VERSION}-dist/css/bootstrap.min.css" rel="stylesheet"/>
			<link href="front/bootstrap/bootstrap-{$BOOTSTRAP-VERSION}-dist/css/bootstrap-theme.min.css" rel="stylesheet"/>

			<link href="front/jquery/jquery-ui-{$JQUERY-VERSION}.custom/jquery-ui.min.css" rel="stylesheet" type="text/css"/>

			<script type="text/javascript" src="front/jquery/jquery-ui-{$JQUERY-VERSION}.custom/external/jquery/jquery.js" charset="iso-8859-1">&#160;</script>
			<script type="text/javascript" src="front/bootstrap/bootstrap-{$BOOTSTRAP-VERSION}-dist/js/bootstrap.min.js" charset="iso-8859-1">&#160;</script>
			<script type="text/javascript" src="front/jquery/jquery-ui-{$JQUERY-VERSION}.custom/jquery-ui.min.js" charset="iso-8859-1">&#160;</script>

			<script type="text/javascript" src="front/js/commun.js" charset="iso-8859-1">&#160;</script>
			<script type="text/javascript" src="front/js/communFormulaire.js" charset="iso-8859-1">&#160;</script>
			<script type="text/javascript" src="front/js/dateFormat.js" charset="iso-8859-1">&#160;</script>
			<script type="text/javascript" src="front/js/communJson.js" charset="iso-8859-1">&#160;</script>

			<script type="text/javascript" src="front/js/core_ajax.js" charset="iso-8859-1">&#160;</script>

			<!-- plugins -->
			<link href="front/css/jquery.multiselect.css" rel="stylesheet" type="text/css"/>
			<script type="text/javascript" src="front/js/jquery.multiselect.js" charset="iso-8859-1">&#160;</script>

			<!--link href="front/css/bootstrap-force.css" rel="stylesheet" type="text/css"/-->
			<link href="front/css/samsub.css" rel="stylesheet/less" type="text/css"/>
			<script type="text/javascript" src="front/lessjs/lessjs.js" charset="iso-8859-1">&#160;</script>
			<xsl:call-template name="js.module.sheet"/>
		</head>
	</xsl:template>
	<!-- banniere -->
	<xsl:template name="BarreMenu">
		<div class="row">
			<div class="col-xs-2"><br/></div>
			<div class="col-xs-8">
				<nav class="navbar navbar-default">
					<div class="container-fluid">
						<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
							<ul class="nav navbar-nav">
								<li class="dropdown">
									<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Accueil<span class="caret"></span></a>
									<ul class="dropdown-menu">
										<li><a href="news.html">News</a></li>
										<li><a href="rubrique-3-qui-sommes-nous.html">Qui sommes-nous?</a></li>
										<li><a href="rubrique-7-l-historique-du-sam-subaquatique.html">L'historique du Sam subaquatique</a></li>
									</ul>
								</li>
								<li><a href="rubrique-1-tarifs-et-inscriptions.html">Tarifs et inscriptions</a></li>
								<li class="dropdown">
									<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Le Club<span class="caret"></span></a>
									<ul class="dropdown-menu">
										<li><a href="rubrique-2-l-encadrement.html">L'encadrement</a></li>
										<li class="dropdown-submenu">
											<a href="#" class="dropdown-toggle" data-toggle="dropdown">Infos pratiques</a>
											<ul class="dropdown-menu">
												<li><a href="#">Action</a></li>
												<li><a href="#">Another action</a></li>
												<li><a href="#">Something else here</a></li>
												<li class="divider"></li>
												<li><a href="#">Separated link</a></li>
												<li class="divider"></li>
												<li><a href="#">One more separated link</a></li>
											</ul>
										</li>
										<li><a href="rubrique-8-infos-pratiques.html">Infos pratiques</a></li>
										<li><a href="rubrique-4-agenda-de-la-sub.html">Agenda de la Sub</a></li>
									</ul>
								</li>
							</ul>

							<xsl:if test="/root/user/userId!=''">
								<ul class="nav navbar-nav navbar-right">
									<li class="dropdown">
										<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Admin<span class="caret"></span></a>
										<ul class="dropdown-menu">
											<li><a href="index.php?domaine=news&amp;service=getpage">Saisie news</a></li>
											<li><a href="index.php?domaine=rubrique&amp;service=getpage">Saisie rubrique</a></li>
											<li><a href="index.php?domaine=media&amp;service=getpage">Gestion média</a></li>
										</ul>
									</li>
								</ul>
							</xsl:if>
							<ul class="nav navbar-nav navbar-right">
								<li class="dropdown">
									<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Contacts<span class="caret"></span></a>
									<ul class="dropdown-menu">
										<li><a href="contacts.html">Nous contacter</a></li>
										<li><a href="rubrique-9-nous-localiser.html">Nous localiser</a></li>
									</ul>
								</li>
							</ul>
						</div>
					</div>
				</nav>
			</div>
		</div>
	</xsl:template>
	<xsl:template name="LiensUtiles">
		<h2 style="text-align:center;">Liens Utiles</h2>
		<a href="http://www.ffessm.fr" class="list-group-item list-lien" target="blank">FFESSM (siteofficiel)</a>
		<a href="http://www.plongee-cias.org" class="list-group-item list-lien" target="blank">CIALPC</a>
		<a href="http://www.plongee-gironde.org" class="list-group-item list-lien" target="blank">CODEP 33</a>
		<a href="https://tiv.ffessm.fr" class="list-group-item list-lien" target="blank">Application TIV</a>
		<a href="https://ffessm.fr/pages_manuel.asp" class="list-group-item list-lien" target="blank">La page du MFT</a>
		<a href="http://www.plongee-hendaye.net" class="list-group-item list-lien" target="blank">Base fédérale d'Hendaye</a>
		<a href="http://www.oceanobs.fr" class="list-group-item list-lien" target="blank">Océan OBS</a>
		<a href="http://maree.info/135" class="list-group-item list-lien" target="blank">Marée info Cap Ferret</a>
		<a href="http://www.cabinet-lafont.com" class="list-group-item list-lien" target="blank">Lafont assurances</a>
		<a href="https://www.longitude181.org/la-charte" class="list-group-item list-lien" target="blank">La charte du plongeur responsable</a>
		<br/>
	</xsl:template>

	<xsl:template name="affichageLateral">O</xsl:template>
	<xsl:template name="onLoadTemplate"/>
</xsl:stylesheet>
