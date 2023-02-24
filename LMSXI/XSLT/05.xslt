<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template match="/">
    <html>
      <body>
        <h1>Os meus viños</h1>
        <table border="1">
          <tr bgcolor="#aabbcc">
            <th>Nome</th>
            <th>Prezo</th>
          </tr>
          <xsl:for-each select="viños/viño">
            <tr>
              <td>
                <xsl:value-of select="nome"/>
              </td>
              <xsl:choose>
                <xsl:when test="prezo &gt; 30">
                  <td bgcolor="#FF0000">
                    <xsl:value-of select="prezo"/>
                  </td>
                </xsl:when>
                <xsl:when test="prezo &lt; 10">
                  <td bgcolor="#008000">
                    <xsl:value-of select="prezo"/>
                  </td>
                </xsl:when>
                <xsl:otherwise>
                  <td bgcolor="#FFFF00">
                    <xsl:value-of select="prezo"/>
                  </td>
                </xsl:otherwise>
              </xsl:choose>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
