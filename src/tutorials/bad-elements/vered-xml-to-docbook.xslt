<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version = '1.0'
    xmlns:xsl='http://www.w3.org/1999/XSL/Transform'
    xmlns:vrd="http://www.shlomifish.org/open-source/projects/XML-Grammar/Vered/"
    xmlns="http://docbook.org/ns/docbook"
    xmlns:db="http://docbook.org/ns/docbook"
    xmlns:xlink="http://www.w3.org/1999/xlink">

<xsl:output method="xml" encoding="UTF-8" indent="yes"
 />

<xsl:template match="/vrd:document">
    <article>
        <xsl:attribute name="xml:id">
            <xsl:value-of select="@xml:id" />
        </xsl:attribute>
        <xsl:attribute name="xml:lang">
            <xsl:value-of select="@xml:lang" />
        </xsl:attribute>
        <xsl:attribute name="version">5.0</xsl:attribute>
        <db:info>
            <db:title>
                <xsl:value-of select="vrd:info/vrd:title" />
            </db:title>
        </db:info>
        <xsl:apply-templates select="vrd:body/vrd:preface" />
        <xsl:apply-templates select="vrd:body/vrd:section" />
    </article>
</xsl:template>

<xsl:template match="vrd:preface">
    <db:preface>
        <xsl:call-template name="preface_or_section" />
    </db:preface>
</xsl:template>

<xsl:template name="preface_or_section">
    <xsl:copy-of select="@xml:id" />
    <xsl:if test="@xml:lang">
        <xsl:copy-of select="@xml:lang" />
    </xsl:if>
    <db:info>
        <db:title>
            <xsl:choose>
                <xsl:when test="vrd:info/vrd:title">
                    <xsl:value-of select="vrd:info/vrd:title" />
                </xsl:when>
                <xsl:otherwise>
                    <xsl:value-of select="@xml:id" />
                </xsl:otherwise>
            </xsl:choose>
        </db:title>
    </db:info>
    <xsl:apply-templates select="vrd:section|vrd:blockquote|vrd:p|vrd:ol|vrd:ul|vrd:programlisting|vrd:item" />
</xsl:template>

<xsl:template match="vrd:section">
    <section>
        <xsl:call-template name="preface_or_section" />
    </section>
</xsl:template>

<xsl:template match="vrd:item">
    <section role="item">
        <xsl:call-template name="common_attributes" />
        <!-- TODO : extract this db:info thing into a common named
        xsl:template. -->
        <db:info>
            <db:title>
                <xsl:choose>
                    <xsl:when test="vrd:info/vrd:title">
                        <xsl:value-of select="vrd:info/vrd:title" />
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="@xml:id" />
                    </xsl:otherwise>
                </xsl:choose>
            </db:title>
        </db:info>
        <xsl:apply-templates select="vrd:blockquote|vrd:p|vrd:ol|vrd:ul|vrd:programlisting|vrd:item|vrd:code_blk" />
    </section>
</xsl:template>

<xsl:template match="vrd:bad_code">
    <programlisting xml:space="preserve" role="bad_code">
        <xsl:attribute name="language">
            <xsl:value-of select="@syntax" />
        </xsl:attribute>
        <xsl:text># Bad code

</xsl:text>
        <xsl:apply-templates/>
    </programlisting>
</xsl:template>

<xsl:template match="vrd:code_blk">
    <programlisting xml:space="preserve">
        <xsl:attribute name="language">
            <xsl:value-of select="@syntax" />
        </xsl:attribute>
        <xsl:apply-templates/>
    </programlisting>
</xsl:template>

<xsl:template match="vrd:p">
    <db:para>
        <xsl:apply-templates />
    </db:para>
</xsl:template>

<xsl:template match="vrd:b|vrd:strong">
    <db:emphasis role="bold">
        <xsl:apply-templates/>
    </db:emphasis>
</xsl:template>

<xsl:template name="common_attributes">
    <xsl:if test="@xlink:href">
        <xsl:copy-of select="@xlink:href" />
    </xsl:if>
    <xsl:if test="@xml:lang">
        <xsl:copy-of select="@xml:lang" />
    </xsl:if>
    <xsl:if test="@xml:id">
        <xsl:copy-of select="@xml:id" />
    </xsl:if>
</xsl:template>

<xsl:template match="vrd:blockquote">
    <db:blockquote>
        <xsl:call-template name="common_attributes" />
        <xsl:apply-templates/>
    </db:blockquote>
</xsl:template>

<xsl:template match="vrd:i|vrd:em">
    <db:emphasis>
        <xsl:apply-templates/>
    </db:emphasis>
</xsl:template>

<xsl:template match="vrd:ol">
    <db:orderedlist>
        <xsl:apply-templates/>
    </db:orderedlist>
</xsl:template>

<xsl:template match="vrd:ul">
    <db:itemizedlist>
        <xsl:apply-templates/>
    </db:itemizedlist>
</xsl:template>

<xsl:template match="vrd:programlisting">
    <db:programlisting>
        <xsl:apply-templates/>
    </db:programlisting>
</xsl:template>

<xsl:template match="vrd:li">
    <db:listitem>
        <xsl:apply-templates/>
    </db:listitem>
</xsl:template>

<xsl:template match="vrd:a">
    <xsl:element name="db:link">
        <xsl:call-template name="common_attributes" />
        <xsl:apply-templates/>
    </xsl:element>
</xsl:template>

<xsl:template match="vrd:span">
    <xsl:variable name="tag_name">
        <xsl:choose>
            <xsl:when test="@xlink:href">
                <xsl:value-of select="'db:link'" />
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="'db:phrase'" />
            </xsl:otherwise>
        </xsl:choose>
    </xsl:variable>
    <xsl:element name="{$tag_name}">
        <xsl:call-template name="common_attributes" />
        <xsl:apply-templates/>
    </xsl:element>
</xsl:template>

</xsl:stylesheet>
