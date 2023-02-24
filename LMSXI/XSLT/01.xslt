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
          <tr>
            <td>
              <xsl:value-of select="viños/viño/nome"/>
            </td>
            <td>
              <xsl:value-of select="viños/viño/prezo"/>
            </td>
          </tr>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
