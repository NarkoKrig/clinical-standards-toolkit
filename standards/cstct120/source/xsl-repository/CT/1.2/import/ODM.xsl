<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:odm="http://www.cdisc.org/ns/odm/v1.3"
  xmlns:nciodm="http://ncicb.nci.nih.gov/xml/odm/EVS/CDISC">

  <xsl:import href="Study.xsl" />

  <xsl:template match="odm:ODM">
     <xsl:element name="LIBRARY">
      <xsl:element name="ODM">
           <xsl:element name="FileOID"><xsl:value-of select="@FileOID"/></xsl:element>
           <xsl:element name="Archival"><xsl:value-of select="@Archival"/></xsl:element>
           <xsl:element name="AsOfDateTime"><xsl:value-of select="@AsOfDateTime"/></xsl:element>
           <xsl:element name="CreationDateTime"><xsl:value-of select="@CreationDateTime"/></xsl:element>
           <xsl:element name="Description"><xsl:value-of select="@Description"/></xsl:element>
           <xsl:element name="FileType"><xsl:value-of select="@FileType"/></xsl:element>
           <xsl:element name="Granularity"><xsl:value-of select="@Granularity"/></xsl:element>
           <xsl:element name="Id"><xsl:value-of select="@Id"/></xsl:element>
           <xsl:element name="ODMVersion"><xsl:value-of select="@ODMVersion"/></xsl:element>
           <xsl:element name="Originator"><xsl:value-of select="@Originator"/></xsl:element>
           <xsl:element name="PriorFileOID"><xsl:value-of select="@PriorFileOID"/></xsl:element>
           <xsl:element name="SourceSystem"><xsl:value-of select="@SourceSystem"/></xsl:element>
           <xsl:element name="SourceSystemVersion"><xsl:value-of select="@SourceSystemVersion"/></xsl:element>
           <xsl:element name="Context"><xsl:value-of select="@nciodm:Context"/></xsl:element>
           <xsl:element name="ControlledTerminologyVersion"><xsl:value-of select="@nciodm:ControlledTerminologyVersion"/></xsl:element>
      </xsl:element>
      <xsl:apply-templates/>
    </xsl:element>
  </xsl:template>
  <!-- suppress default with this template -->
  <xsl:template match="text()"/>
</xsl:stylesheet>