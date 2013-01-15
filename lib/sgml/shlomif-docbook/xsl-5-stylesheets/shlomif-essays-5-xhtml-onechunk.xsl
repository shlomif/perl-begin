<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:db="http://docbook.org/ns/docbook" xmlns:vrd="http://www.shlomifish.org/open-source/projects/XML-Grammar/Vered/" xmlns="http://docbook.org/ns/docbook" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xhtml="http://www.w3.org/1999/xhtml">


    <xsl:import href="shlomif-essays-5-xhtml-common.xsl" />
    <xsl:import href="http://docbook.sourceforge.net/release/xsl-ns/current/xhtml-1_1/chunk.xsl" />
    <xsl:import href="http://docbook.sourceforge.net/release/xsl-ns/current/xhtml-1_1/onechunk.xsl" />
    <xsl:import href="http://docbook.sourceforge.net/release/xsl-ns/current/xhtml-1_1/docbook.xsl" />


    <!-- Avoid Generating a Table-of-Contents-->
    <xsl:param name="generate.toc">
        article toc
    </xsl:param>

<!-- Disable the title="" attribute in sections. -->
<xsl:template name="generate.html.title">
</xsl:template>

<xsl:template match="db:article">
    <xsl:call-template name="id.warning"/>

    <xsl:if test="false()">
    </xsl:if>

    <xsl:element name="xhtml:div">
        <xsl:call-template name="common.html.attributes">
            <xsl:with-param name="inherit" select="1"/>
        </xsl:call-template>
        <xsl:call-template name="id.attribute">
            <xsl:with-param name="conditional" select="0"/>
        </xsl:call-template>

        <xsl:call-template name="article.titlepage"/>
        <xsl:variable name="toc.params">
            <xsl:call-template name="find.path.params">
                <xsl:with-param name="table" select="normalize-space($generate.toc)"/>
            </xsl:call-template>
        </xsl:variable>

        <xsl:call-template name="make.lots">
            <xsl:with-param name="toc.params" select="$toc.params"/>
            <xsl:with-param name="toc">
                <xsl:call-template name="component.toc">
                    <xsl:with-param name="toc.title.p" select="contains($toc.params, 'title')"/>
                </xsl:call-template>
            </xsl:with-param>
        </xsl:call-template>
        <xsl:element name="xhtml:h1">
            <xsl:attribute name="xhtml:style">
                <xsl:text>color: red</xsl:text>
            </xsl:attribute>
            <xsl:text>Foobar.</xsl:text>
        </xsl:element>
    </xsl:element>

    <xsl:if test="false()">
        <xhtml:h1 style="color:red">Hello Plakokok:W</xhtml:h1>
        <xsl:apply-templates/>
        <xsl:call-template name="process.footnotes"/>
    </xsl:if>
</xsl:template>

</xsl:stylesheet>

