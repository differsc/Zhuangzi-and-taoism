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
                <title><xsl:value-of select="//chapter/@name"/></title> 
            </head>
            <body>
                <h1><xsl:value-of select="//chapter/@name"/></h1>
                <xsl:apply-templates select="//section"/>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="section">
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
        <span>
            <xsl:attribute name="class">
                <xsl:text>ref</xsl:text>
            </xsl:attribute>
            <xsl:attribute name="id">
                <xsl:value-of select="@kind"/>
            </xsl:attribute>
            <xsl:apply-templates/>
        </span>
    </xsl:template>
 
</xsl:stylesheet>