<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   
   <xsl:output method="xml" indent="yes"/>
   
   <!-- Identity transform to copy everything by default -->
   <xsl:template match="@*|node()">
      <xsl:copy>
         <xsl:apply-templates select="@*|node()"/>
      </xsl:copy>
   </xsl:template>
   
   <!-- Template to match and process the root element -->
   <xsl:template match="/images">
      <xsl:copy>
         <!-- Apply templates to all images, sorted by manuscript/@mysql_id and then by page/@mysql_id -->
         <xsl:apply-templates select="image">
            <xsl:sort select="manuscript/@mysql_id" data-type="number" order="ascending"/>
            <xsl:sort select="page/@mysql_id" data-type="number" order="ascending"/>
         </xsl:apply-templates>
      </xsl:copy>
   </xsl:template>
   
   <!-- Template to process image elements and sort their children pages by @mysql_id -->
   <xsl:template match="image">
      <xsl:copy>
         <xsl:apply-templates select="@*|archive|manuscript|path"/>
         <xsl:apply-templates select="page">
            <xsl:sort select="@mysql_id" data-type="number" order="ascending"/>
         </xsl:apply-templates>
      </xsl:copy>
   </xsl:template>
   
</xsl:stylesheet>
