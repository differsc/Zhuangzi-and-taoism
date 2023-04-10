<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns="http://www.w3.org/1999/xhtml"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="#all"
    version="3.0">
    <xsl:output method="xhtml" html-version="5" omit-xml-declaration="no" include-content-type="no"
        indent="yes"/>
    <xsl:template match="/">
        <html>
            <head>
                Confucian Corpus Extension
            </head>
            <body>
                <h1>Man in the World and Confucianism</h1>
                <br/>
                <h2>Confucian Doctrine</h2>
                <xsl:apply-templates select="//doctrine"/>
                <br/>
                <h2>Zhongni</h2>
                <xsl:apply-templates select="//zhongni"/>
                <br/>
                <h2>Yan Yuan</h2>
                <xsl:apply-templates select="//Yanyuan"/>
                <br/>
                <h2>Jieyu</h2>
                <xsl:apply-templates select="//Jieyu"/>
                
            </body>
        </html>
    </xsl:template>
    <xsl:template match="chapter">
        <br/>
        <p>
        <xsl:apply-templates select="line"/>
        </p>
        <h5><a href="https://ctext.org/confucianism/ens">Source of the Text</a></h5>
    </xsl:template>
</xsl:stylesheet>