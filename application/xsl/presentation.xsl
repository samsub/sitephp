<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<!--regle principal-->
	<xsl:template match="/">
		<html>
			<!-- entête HTML -->
			<xsl:call-template name="Header">
				<xsl:with-param name="HeadTitre"><xsl:value-of select="/root/titre"/></xsl:with-param>
			</xsl:call-template>
			<body>
				<xsl:attribute name="onload">
					<xsl:call-template name="onLoadTemplate"/>
				</xsl:attribute>
				
				<br/>
				<div class="container">
					<!-- bannière -->
					<div class="row">
						<div class="col-xs-2"><span class="align-middle"><img src="front/images/Logo Hippo.jpg" width="180px"/></span>
						</div>
						<div class="col-xs-8">image ou nom du site...
						</div>
						<div class="col-xs-2"><img src="front/images/logoSAM201617.jpg"  width="180px"/>
						</div>
					</div>
					<!-- menu -->
					<xsl:call-template name="BarreMenu"/>
					<div class="row">
					<div class="col-sm-10 cadre_bord_rond">
						<xsl:call-template name="Contenu"/>
					</div>
					<div class="col-sm-2"  style="background-color:#FFAAAA;">
						partie utilisateur
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-4"></div>
				<div class="col-xs-4" style="background-color:#FFBBAA;">pied de page
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
			<meta content="text/html;charset=UTF-8" http-equiv="content-type"/>
			<meta NAME="DESCRIPTION" CONTENT="PhpMyBudget"/>
			<meta NAME="KEYWORDS" CONTENT="gestion compte"/>
			<meta http-equiv="Pragma" content="no-cache"/>
			<meta http-equiv="Cache-Control" content="no-cache"/>
			<meta http-equiv="Expires" content="0"/>
			<meta http-equiv="X-UA-Compatible" content="IE=8"/>
			<title>
				<xsl:choose>
				<xsl:when test="$HeadTitre!=''">
					<xsl:value-of select="$HeadTitre"/>
				</xsl:when>
					<xsl:value-of select="'PhpMyBudget'"/>
				</xsl:choose>
			</title>
			
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
			<link href="front/css/samsub.css" rel="stylesheet" type="text/css"/>
			<xsl:call-template name="js.module.sheet"/>
		</head>
	</xsl:template>
	<!-- banniere -->
	<xsl:template name="BarreMenu">
		<div class="row">
			<div class="col-xs-2"></div>
			<div class="col-xs-8">
				<nav class="navbar navbar-default">
				  <div class="container-fluid">
					

					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					  <ul class="nav navbar-nav">
						<!--li class="active"><a href="#">Link <span class="sr-only">(current)</span></a></li-->
						<li><a href="#">Accueil</a></li>
						<li><a href="index.php?domaine=rubrique&amp;service=affiche&amp;rubriqueid=1">Tarifs et inscriptions</a></li>
						<li class="dropdown">
						  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Le Club<span class="caret"></span></a>
						  <ul class="dropdown-menu">
							<li><a href="#">L'encadrement</a></li>
							<li><a href="#">Infos pratiques</a></li>
							<li><a href="#">Agenda de la Sub</a></li>
						  </ul>
						</li>
						<!--li class="dropdown">
						  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Contacts<span class="caret"></span></a>
						  <ul class="dropdown-menu">
							<li><a href="#">L'encadrement</a></li>
							<li><a href="#">Infos pratiques</a></li>
							<li><a href="#">Agenda de la Sub</a></li>
						  </ul>
						</li>
						<li class="dropdown">
						  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Admin<span class="caret"></span></a>
						  <ul class="dropdown-menu">
							<li><a href="index.php?domaine=news&amp;service=getone">Saisie news</a></li>
						  </ul>
						</li-->
					  </ul>
					  
					  <ul class="nav navbar-nav navbar-right">
						<li class="dropdown">
						  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Contacts<span class="caret"></span></a>
						  <ul class="dropdown-menu">
							<li><a href="#">L'encadrement</a></li>
							<li><a href="#">Infos pratiques</a></li>
							<li><a href="#">Agenda de la Sub</a></li>
						  </ul>
						</li>
						<li class="dropdown">
						  <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Admin<span class="caret"></span></a>
						  <ul class="dropdown-menu">
							<li><a href="index.php?domaine=news&amp;service=getone">Saisie news</a></li>
							<li><a href="index.php?domaine=rubrique&amp;service=getpage">Saisie rubrique</a></li>
						  </ul>
						</li>
					  </ul>
					</div><!-- /.navbar-collapse -->
				  </div><!-- /.container-fluid -->
				</nav>
			</div>
		</div>
	</xsl:template>
	<xsl:template name="controleMenu">O</xsl:template>
	<xsl:template name="onLoadTemplate"/>
</xsl:stylesheet>
