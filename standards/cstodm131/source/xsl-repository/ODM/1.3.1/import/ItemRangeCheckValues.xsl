<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:odm="http://www.cdisc.org/ns/odm/v1.3">

	<xsl:template name="ItemRangeCheckValues">

		<xsl:for-each select=".">

			<xsl:element name="ItemRangeCheckValues">
				<xsl:element name="CheckValue">
					<xsl:value-of select="." />
				</xsl:element>
				<xsl:element name="FK_ItemRangeChecks">
				    <!--  The parent OID was generated so we have something to reference as a parent -->
                    <xsl:value-of select="generate-id(..)" />
				</xsl:element>
			</xsl:element>

		</xsl:for-each>

	</xsl:template>
</xsl:stylesheet>