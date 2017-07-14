<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.og/2001/XMLSchema" xmlns:xlink="http://www.w3.org/1999/xlink"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://www.loc.gov/mods/v3"
    xsi:schemaLocation="http://www.loc.gov/mods/v3 http://www.loc.gov/standards/mods/v3/mods-3-5.xsd"
    exclude-result-prefixes="xs" xpath-default-namespace="http://www.loc.gov/mods/v3" version="2.0">
    
    <xsl:output encoding="UTF-8" method="xml" indent="yes"/>
    <xsl:strip-space elements="*"/>
    
    <!-- identity transform -->
    <xsl:template match="@* | node()">
        <xsl:copy>
            <xsl:apply-templates select="@* | node()"/>
        </xsl:copy>
    </xsl:template>
    
    <xsl:variable name="filename" select="collection('../modsxml/?select=*.xml')"/>
    
    <xsl:template name="main">
        <xsl:for-each select="$filename">
            <xsl:variable name="fn" select="normalize-space(tokenize(document-uri(.), '/')[last()])"/>
            <!--<xsl:value-of select="concat($fn, '&#10;')"/>-->
            <xsl:result-document href="{concat('./output/',$fn)}">
                <xsl:copy>
                    <xsl:apply-templates select="@* | node()"/>
                </xsl:copy>
            </xsl:result-document>
        </xsl:for-each>
    </xsl:template>
    
    <!-- apply rights statements.org -->
    <xsl:template match="accessCondition">
        <accessCondition type="use and reproduction" xlink:href="https://creativecommons.org/licenses/by-nc-nd/3.0/">Attribution-NonCommercial-NoDerivs 3.0 Unported (CC BY-NC-ND 3.0)</accessCondition>
        <note displayLabel="Attribution">Photograph © Alan S. Heilman; Digital Image © 2011 The University of Tennessee Libraries. Creative Commons License Attribution-NonCommercial-NoDerivs 3.0 Unported (CC BY-NC-ND 3.0) with attribution as follows: [Photograph title and item number], The Botanical Photography of Alan S. Heilman, © Alan S. Heilman, © The University of Tennessee Libraries, 2011.</note>
    </xsl:template>
</xsl:stylesheet>