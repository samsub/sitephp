<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


  <!--
  �dition d'une op�ration
-->
<xsl:template name="rubriqueEdition">
  <div id="boiteRubrique" title="{$LBL.EDITIONRUBRIQUE}" style="display: none;">
    <div class="container">
      <form method="POST" action="#" onsubmit="return soumettre(this);" name="rubrique" id="rubrique">
        <input type="hidden" name="service" id="service"/>
        <input type="hidden" name="rubriqueid" id="rubriqueid"/>
        <div class="popup_operation">

          <div class="row">
            <div class=" form-group col-xs-2">
              <label for="titre" class="form-control-label">
                <xsl:value-of select="$LBL.TITRE"/>
              </label>
              <input class="form-control" size="25" name="titre" id="titre" tabindex="10"/>
            </div>
          </div>
          <div class="row">
            <div class="form-group">
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
�dition d'un compte
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
      �dition d'un segment
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
