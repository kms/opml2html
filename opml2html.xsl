<?xml version="1.0" encoding="UTF-8"?>
<!-- opml2html -->
<!-- Transform Bloglines OPML to HTML. --> 
<!-- -->
<!-- (c) Karl-Martin Skontorp kms@skontorp.net ~ http://picofarad.org/ -->
<!-- Licensed under the GNU GPL 2.0 or later. -->

<!DOCTYPE xsl:stylesheet [ 
<!ENTITY nbsp "&#160;"> 
]> 

<xsl:stylesheet version="1.0" 
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:output method="xml"
        doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
        doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN" 
        omit-xml-declaration="yes" />

    <xsl:template match="/opml">
        <html>
            <head>
                <meta http-equiv="Content-Type" 
                    content="text/html; charset=UTF-8" />
                <title>
                    <xsl:value-of select="head/title" />
                    (<xsl:value-of select="head/ownerName" />)
                </title>
                <link rel="stylesheet" type="text/css" title="Standard"
                    href="opml2html-standard.css" />
                <link rel="alternate stylesheet" type="text/css" title="Plain"
                    href="opml2html-plain.css" />
            </head>
            <body>
                <xsl:apply-templates select="head" />
                <div>
                    <xsl:apply-templates select="body" />
                </div>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="/opml/head">
        <div class="heading">
            <span class="headingTitle">
                <xsl:value-of select="title" />
            </span>
            (<xsl:value-of select="ownerName" />)<br />
            <xsl:value-of select="dateCreated" /><br />
        </div>
    </xsl:template>

    <xsl:template match="/opml/body//outline">
        <div class="list">
            <div class="listEntry">
                    <xsl:choose>
                        <xsl:when test="@htmlUrl">
                            <span class="link">
                                <a>
                                    <xsl:attribute name="href">
                                        <xsl:value-of select="@htmlUrl" />
                                    </xsl:attribute>
                                    <xsl:value-of select="@title" />
                                </a>
                            </span>
                        </xsl:when>
                        <xsl:otherwise>
                            <span class="category">
                                <xsl:value-of select="@title" />
                            </span>
                        </xsl:otherwise>
                    </xsl:choose>

                    <xsl:if test="@type = 'rss'">
                        <xsl:text> </xsl:text>
                        <a>
                            <xsl:attribute name="href">
                                <xsl:value-of select="@xmlUrl" />
                            </xsl:attribute>
                            <img src="xml-tiny.png" alt="XML" />
                        </a>
                    </xsl:if>
                </div>
            <xsl:apply-templates />
        </div>
    </xsl:template>

</xsl:stylesheet>
