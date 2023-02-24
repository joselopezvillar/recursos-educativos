<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:template match="/">
  <html>
  <body>
  <h1>Os meus viños</h1>
  <xsl:apply-templates/>
  </body>
  </html>
</xsl:template>

<xsl:template match="viño">
  <p>
  <xsl:apply-templates select="nome"/>
  <xsl:apply-templates select="prezo"/>
  </p>
</xsl:template>

<xsl:template match="nome">
  Nome: <span style="color:#ff0000">
  <xsl:value-of select="."/></span>
  <br />
</xsl:template>

<xsl:template match="prezo">
  Prezo: <span style="color:#00ff00">
  <xsl:value-of select="."/></span>
  <br />
</xsl:template>

</xsl:stylesheet>
