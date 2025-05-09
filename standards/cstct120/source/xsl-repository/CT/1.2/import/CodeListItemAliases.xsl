<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:odm="http://www.cdisc.org/ns/odm/v1.3"
  xmlns:nciodm="http://ncicb.nci.nih.gov/xml/odm/EVS/CDISC">

  <xsl:template name="CodeListItemAliases">

    <xsl:for-each select=".">

      <xsl:element name="CodeListItemAliases">
         <xsl:element name="Context"><xsl:value-of select="@Context"/></xsl:element>
         <xsl:element name="Name"><xsl:value-of select="@Name"/></xsl:element>
         <xsl:element name="FK_CodeListItems"><xsl:value-of select="generate-id(..)"/></xsl:element>
      </xsl:element>

    </xsl:for-each>

  </xsl:template>
</xsl:stylesheet>