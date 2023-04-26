<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" 
    exclude-result-prefixes="#all"
    version="3.0">
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="no" 
        include-content-type="no" indent="yes"/>
    <xsl:template match="/">
        <html>
            <head>
                <title>corpus</title> 
                <link rel="stylesheet" type="text/css" href="home.css" />
            </head>
            <body>
                <h1><a class="title" id="contents">Contents</a></h1>
                <ul>
                    <xsl:apply-templates select="//chapter" mode="toc"/>
                </ul>
                <hr/>
                <xsl:apply-templates select="//chapter"/>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="chapter" mode="toc">
        <li>
            <q>
                <a class="title" href="#chapter{@n}">
                    <xsl:value-of select="@name"/>
                    <xsl:text> (</xsl:text>
                    <xsl:value-of select="@n"/>
                    <xsl:text>)</xsl:text>
                </a></q>
        </li>
    </xsl:template>
    
    <xsl:template match="chapter">
        <h1><a class="title" href="#contents"><xsl:attribute name="id">
            <xsl:text>chapter</xsl:text>
            <xsl:value-of select="@n"/>
        </xsl:attribute>
        <xsl:text>Chapter </xsl:text>
            <xsl:value-of select="@n"/>
            <xsl:text>:</xsl:text>
            <xsl:value-of select="@name"/>
        </a></h1>
        <section>
            <xsl:apply-templates/>
        </section>
    </xsl:template>
    
    <xsl:template match="p">
        <p>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
    
    <xsl:template match="figurative">
        <span>
        <xsl:attribute name="class">
            <xsl:text>figurative</xsl:text>
        </xsl:attribute>
            <xsl:attribute name="style">
                <xsl:value-of select="@style"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="paradox">
        <span>
            <xsl:attribute name="class">
                <xsl:text>paradox</xsl:text>
            </xsl:attribute>
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="comparison">
        <span>
            <xsl:attribute name="class">
                <xsl:text>comparison</xsl:text>
            </xsl:attribute>
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="positive">
        <span>
            <xsl:attribute name="class">
                <xsl:text>positive</xsl:text>
            </xsl:attribute>
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="negative">
        <span>
            <xsl:attribute name="class">
                <xsl:text>negative</xsl:text>
            </xsl:attribute>
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="rhetorical">
        <span>
            <xsl:attribute name="class">
                <xsl:text>rhetorical</xsl:text>
            </xsl:attribute>
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="speech">
        <span>
            <xsl:attribute name="class">
                <xsl:text>speech</xsl:text>
            </xsl:attribute>
            <xsl:attribute name="title">
                <xsl:value-of select="@speaker"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </span>
    </xsl:template>
    
    <xsl:template match="ref">
        <em>
            <xsl:attribute name="class">
                <xsl:value-of select="@kind"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </em>
    </xsl:template>
 
</xsl:stylesheet>