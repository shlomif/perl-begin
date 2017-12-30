<?xml version='1.0' encoding='UTF-8'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:db="http://docbook.org/ns/docbook" xmlns:d="http://docbook.org/ns/docbook" xmlns:vrd="http://www.shlomifish.org/open-source/projects/XML-Grammar/Vered/" xmlns="http://docbook.org/ns/docbook" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xhtml="http://www.w3.org/1999/xhtml">

    <xsl:import href="shlomif-essays-5-xhtml-common.xsl" />

    <!-- Ok, using the onechunk parameter makes this all work again. -->
    <!-- It does have the disadvantage that it only works for documents that have -->
    <!-- a root element that is considered a chunk by the chunk.xsl stylesheet. -->
    <!-- Ideally, onechunk would let anything be a chunk. But not today. -->

    <xsl:param name="onechunk" select="1"/>
    <xsl:param name="suppress.navigation">1</xsl:param>

    <xsl:template name="href.target.uri">
        <xsl:param name="object" select="."/>
        <xsl:text>#</xsl:text>
        <xsl:call-template name="object.id">
            <xsl:with-param name="object" select="$object"/>
        </xsl:call-template>
    </xsl:template>

    <!-- Avoid Generating a Table-of-Contents-->
    <xsl:param name="generate.toc">
        article toc
    </xsl:param>

<!-- Disable the title="" attribute in sections. -->
<xsl:template name="generate.html.title">
</xsl:template>

<xsl:template match="d:article" priority="1">
    <xsl:call-template name="id.warning"/>

    <div>
        <xsl:call-template name="common.html.attributes">
            <xsl:with-param name="inherit" select="1"/>
        </xsl:call-template>
        <xsl:if test="$generate.id.attributes != 0">
            <xsl:attribute name="id">
                <xsl:call-template name="object.id"/>
            </xsl:attribute>
        </xsl:if>

        <xsl:call-template name="article.titlepage"/>

        <xsl:variable name="toc.params">
            <xsl:call-template name="find.path.params">
                <xsl:with-param name="table" select="normalize-space($generate.toc)"/>
            </xsl:call-template>
        </xsl:variable>

        <!--Move the introduction before the ToC. -->
        <xsl:apply-templates select="*[@role='introduction']"/>

        <xsl:call-template name="make.lots">
            <xsl:with-param name="toc.params" select="$toc.params"/>
            <xsl:with-param name="toc">
                <xsl:call-template name="component.toc">
                    <xsl:with-param name="toc.title.p" select="contains($toc.params, 'title')"/>
                </xsl:call-template>
            </xsl:with-param>
        </xsl:call-template>

        <xsl:apply-templates select="*[not(@role = 'introduction')]"/>
        <xsl:call-template name="process.footnotes"/>
    </div>
</xsl:template>
</xsl:stylesheet>
