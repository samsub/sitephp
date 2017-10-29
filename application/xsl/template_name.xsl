<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <!--
        liste flux
    -->
    <xsl:template name="ListeFlux">
        <xsl:param name="liste"/>
        <xsl:param name="champ"/>
        <xsl:param name="valeur"/>
        <xsl:param name="obligatoire" select="'N'"/>
        <xsl:param name="class" select="''"/>
        <xsl:param name="valeurVide" select="'O'"/>
        <xsl:param name="tabindex" select="''"/>
        <xsl:param name="onchange" select="''"/>
        <select name="{$champ}" id="{$champ}" class="form-control {$class}">
            <xsl:if test="$obligatoire='true'">
                <xsl:attribute name="class">obligatoire</xsl:attribute>
            </xsl:if>
            <xsl:if test="$tabindex!=''">
                <xsl:attribute name="tabindex">
                    <xsl:value-of select="$tabindex"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="$onchange!=''">
                <xsl:attribute name="onchange">
                    <xsl:value-of select="$onchange"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="$valeurVide='' or $valeurVide='O'">
                <option/>
            </xsl:if>
            <xsl:for-each select="$liste/Flux">
                <option value="{fluxId}">
                    <xsl:if test="$valeur=fluxId">
                        <xsl:attribute name="selected">selected</xsl:attribute>
                    </xsl:if>
                    <xsl:value-of select="flux"/>
                </option>
            </xsl:for-each>
        </select>
    </xsl:template>

    <!--
        affichage montant
    -->
    <!--xsl:template name="Montant">
        <xsl:param name="montant" select="0"/>
        <xsl:value-of select="format-number($montant, $FORMAT_MNT)"/>
    </xsl:template-->
    <!--
        Modif select
    -->
    <xsl:template name="ModifSelect">
        <xsl:param name="value" select="''"/>
        <xsl:param name="Node"/>
        <xsl:param name="nom"/>
        <xsl:param name="defaultValue"/>
        <xsl:param name="defaultDisplay"/>
        <xsl:param name="onChange" select="''"/>
        <xsl:param name="class" select="''"/>
        <xsl:param name="tabindex" select="''"/>
        <xsl:param name="optionVide" select="'O'"/>
        <select class="form-control {$class}" name="{$nom}" id="{$nom}">
            <xsl:if test="$onChange!=''">
                <xsl:attribute name="onchange">
                    <xsl:value-of select="$onChange"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="$tabindex!=''">
                <xsl:attribute name="tabindex">
                    <xsl:value-of select="$tabindex"/>
                </xsl:attribute>
            </xsl:if>
            <xsl:if test="$optionVide='O'">
                <option/>
            </xsl:if>
            <xsl:if test="$defaultValue!=''">
                <option value="{$defaultValue}">
                    <xsl:value-of select="$defaultDisplay"/>
                </option>
            </xsl:if>
            <xsl:for-each select="$Node/Segment">
                <xsl:choose>
                    <xsl:when test="$value=codseg">
                        <option value="{codseg}" selected="selected">
                            <xsl:value-of select="liblong"/>
                        </option>
                    </xsl:when>
                    <xsl:otherwise>
                        <option value="{codseg}">
                            <xsl:value-of select="liblong"/>
                        </option>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
        </select>
    </xsl:template>
    <!--
        liste mois
    -->
    <xsl:template name="SelectMois">
        <xsl:param name="name"/>
        <xsl:param name="obligatoire" select="'N'"/>
        <select name="{$name}" id="{$name}" class="form-control">
            <xsl:if test="$obligatoire='O'">
                <xsl:attribute name="class">form-control obligatoire</xsl:attribute>
            </xsl:if>
            <option/>
            <option value="01">Janvier</option>
            <option value="02">Février</option>
            <option value="03">Mars</option>
            <option value="04">Avril</option>
            <option value="05">Mai</option>
            <option value="06">Juin</option>
            <option value="07">Juillet</option>
            <option value="08">Aoùt</option>
            <option value="09">Septembre</option>
            <option value="10">Octobre</option>
            <option value="11">Novembre</option>
            <option value="12">Décembre</option>
        </select>
    </xsl:template>
    <!--
        édition d'une opération
    -->
    <xsl:template name="rubriqueEdition">
        <div id="boiteRubrique" title="{$LBL.EDITIONRUBRIQUE}" style="display: none;">
			<div class="row">
            <form method="POST" action="#" onsubmit="return soumettre(this);" name="rubrique" id="rubrique">
                <input type="hidden" name="service" id="service"/>
                <input type="hidden" name="rubriqueid" id="rubriqueid"/>
                <div class="popup_operation">
                    <div class="col-lg-12">
                        <div class="form-group row">
                            <label for="titre" class="form-control-label">
                                <xsl:value-of select="$LBL.TITRE"/>
                            </label>
                            <input class="form-control" size="25" name="titre" id="titre" tabindex="10"/>
                        </div>
                        <div class="form-group row">
                            <label for="contenu" class="form-control-label">
                                <xsl:value-of select="$LBL.CONTENU"/>
                            </label>
                            <div id="summernote"/>
                        </div>
                        <div class="row">
                            <div class="col-xs-4"/>
                            <div class="form-group row">
                                <div class="col-sm-offset-5 col-sm-5">
                                    <button type="submit" class="btn btn-primary">Valider</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
			</div>
        </div>
    </xsl:template>

    <!--
        édition d'un compte
    -->
    <xsl:template name="compteEdition">
        <div id="boiteCompte" title="{$LBL.EDITIONCOMPTE}" style="display: none;">
            <br/>
            <form method="POST" action="#" onsubmit="return soumettre(this);">
                <input type="hidden" name="service" id="service"/>
                <div class="container popup_operation">
                    <div class="col-lg-12">
                        <div class="form-group row">
                            <label for="numeroCompte" class="col-sm-6 form-control-label">
                                <xsl:value-of select="$LBL.NUMEROCOMPTE"/>
                            </label>
                            <div class="col-sm-6">
                                <input class="form-control" size="12" name="numeroCompte" id="numeroCompte"
                                       tabindex="10"/>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="libelle" class="col-sm-6 form-control-label">
                                <xsl:value-of select="$LBL.DESCRIPTION"/>
                            </label>
                            <div class="col-sm-6">
                                <input class="form-control" type="text" name="libelle" id="libelle" size="11"
                                       maxlength="40" tabindex="20"/>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label for="solde" class="col-sm-6 form-control-label">
                                <xsl:value-of select="$LBL.SOLDEBASE"/>
                            </label>
                            <div class="col-sm-6">
                                <input class="form-control numerique" type="text" name="solde" id="solde" size="10"
                                       onblur="return isDouble(this);" tabindex="30"/>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-4"/>
                            <div class="form-group row">
                                <div class="col-sm-offset-5 col-sm-5">
                                    <button type="submit" class="btn btn-primary">Valider</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </xsl:template>

    <!--
        édition d'un segment
    -->
    <xsl:template name="segmentDetailEdition">
        <div id="boiteSegmentDetail" title="{$LBL.EDITIONSEGMENT}" style="display: none;">
            <center>
                <br/>
                <form method="POST" action="#" onsubmit="return soumettreDetail(this, 'formulaireDetail');"
                      name="segmentDetailForm" id="segmentDetailForm">
                    <input type="hidden" name="service" id="service"/>
                    <div class="container popup_operation">
                        <div class="col-lg-12">
                            <div class="form-group row">
                                <label for="numeroCompte" class="col-sm-6 form-control-label">
                                    <xsl:value-of select="$LBL.SEGMENT"/>
                                </label>
                                <div class="col-sm-6">
                                    <input class="form-control" size="12" name="cleseg" id="cleseg" tabindex="10"
                                           readonly="readonly"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="libelle" class="col-sm-6 form-control-label">
                                    <xsl:value-of select="$LBL.CLE"/>
                                </label>
                                <div class="col-sm-6">
                                    <input class="form-control" type="text" name="codseg" id="codseg" size="11"
                                           readonly="readonly"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="solde" class="col-sm-6 form-control-label">
                                    <xsl:value-of select="$LBL.LIBCOURT"/>
                                </label>
                                <div class="col-sm-6">
                                    <input class="form-control" name="libcourt" id="libcourt" size="12"/>
                                </div>
                            </div>
                            <div class="form-group row">
                                <label for="solde" class="col-sm-6 form-control-label">
                                    <xsl:value-of select="$LBL.LIBLONG"/>
                                </label>
                                <div class="col-sm-6">
                                    <input class="form-control" name="liblong" id="liblong" size="40"/>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-4"/>
                                <div class="form-group row">
                                    <div class="col-sm-offset-5 col-sm-5">
                                        <button type="submit" class="btn btn-primary">Valider</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </center>
        </div>
    </xsl:template>
</xsl:stylesheet>