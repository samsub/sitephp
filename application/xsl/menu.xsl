<?xml version="1.0" encoding="ISO-8859-15"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template name="menuDynamique">
		<div class="col-xs-2"><br/></div>
		<div class="col-xs-8">
			<nav class="navbar navbar-default">
				<div class="container-fluid">
					<xsl:apply-templates select="/root/data/ListeMenuPrimaire/Dynamic"/>
				</div>
			</nav>
		</div>
	</xsl:template>
	
	
	<xsl:template match="Dynamic">
		<xsl:if test="type=2">
			<ul class="nav navbar-nav">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><xsl:value-of select="nom"/><span class="caret"></span></a>
					<ul class="dropdown-menu">
						<xsl:apply-templates select="associatedObjet/listeSousMenus/Dynamic" mode="dropdown"/>
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
							<li><a href="index.php?domaine=menu&amp;service=getpage">Gestion menu</a></li>
						</ul>
					</li>
				</ul>
			</xsl:if>
		</xsl:if>
		<xsl:if test="type=1">
			<ul class="nav navbar-nav">
				<li><a href="{url}.html"><xsl:value-of select="nom"/></a></li>
			</ul>
		</xsl:if>
	</xsl:template>
	
	<xsl:template match="Dynamic" mode="dropdown">
		<li><a href="{url}.html"><xsl:value-of select="nom"/></a></li>
	</xsl:template>
	
</xsl:stylesheet>