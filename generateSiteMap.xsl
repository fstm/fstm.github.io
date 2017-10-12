<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:image="http://www.google.com/schemas/sitemap-image/1.1">

    <xsl:template match="/">
        <urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9"
                xmlns:image="http://www.google.com/schemas/sitemap-image/1.1">
            <url>
                <loc>http://fstm.de/</loc>
            </url>
            
            <xsl:apply-templates select="//section[@title and @id] | //header[@title and @id]"/>
        </urlset>
    </xsl:template>

    <xsl:template match="section | header">
        <url>
            <loc>http://fstm.de/?<xsl:value-of select="@id"/></loc>
            <xsl:apply-templates select="*//img[@src and @alt]"/>
        </url>

    </xsl:template>

    <xsl:template match="img">
        <image:image>
            <image:loc>http://fstm.de/<xsl:value-of select="@src"/></image:loc>
            <image:caption>
                <xsl:value-of select="@alt"/>
            </image:caption>
        </image:image>
    </xsl:template>
</xsl:stylesheet>
