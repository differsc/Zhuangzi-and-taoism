<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="#all"
    xmlns="http://www.w3.org/2000/svg" version="3.0">
    <xsl:output method="xml" indent="yes" omit-xml-declaration="yes"/>
    <xsl:variable name="y-max"  select="600"/>
    <xsl:variable name="x-scale"  select="250"/>
    <xsl:variable name="x-max" select="($x-scale) * count(//chapter)"/>
    <xsl:template match="/">
        <svg height="{$y-max + 100}" width="{$x-max+ 250}"
            viewBox="-100 -{$y-max + 150} {$x-max + 300} {$y-max + 300}">
            <text x="{$x-max div 2}" y="-{$y-max + 50}" text-anchor="middle"
                font-size="36">Instances of Figurative Languages</text>
            <text x="{$x-max div 2}" y="100" text-anchor="middle" font-size="16">Chapter by Number</text>
            <text y="-{$y-max div 2}" x="-100" text-anchor="middle" font-size="16">Instances</text>
            <text y="-{$y-max div 6}" x="{150+$x-max}" text-anchor="middle" font-size="16">Character counts</text>
            <line x1="0" x2="{$x-max}" y1="0" y2="0" stroke="black" stroke-width="2"/>
            <line x1="0" x2="0" y1="0" y2="-{$y-max}" stroke="black" stroke-width="2"/>
            <line x1="{$x-max}" x2="{$x-max}" y1="0" y2="-{$y-max}" stroke="black" stroke-width="2"/>
            <!-- x and y axes -->
            <xsl:for-each select="1 to 6">
                <xsl:variable name="y-scale"  select="100 * ."/>
                <line x1="0" x2="{$x-max}" y1="-{$y-scale}" y2="-{$y-scale}"
                    stroke="black" stroke-width="1" stroke-dasharray="5,3" />
                <text x="-20" y="-{$y-scale}" text-anchor="end" dominant-baseline="middle"
                    font-size="12"><xsl:value-of select="$y-scale div 20"/></text>
                <text x="{40+$x-max}" y="-{$y-scale}" text-anchor="end" dominant-baseline="middle"
                    font-size="12"><xsl:value-of select="$y-scale*50"/></text>     
            </xsl:for-each>
            <!-- guidelines and corresponding labels -->
            <rect x="{100+$x-max}" y="-{$y-max}" height="450" fill="white" width="150" stroke="black" stroke-width="2"/>
            <text x="{130+$x-max}" y="-{-50+$y-max}" font-size="24">Legends</text>
            
            <!-- Legends -->
            <xsl:apply-templates select="//chapter"/>
        </svg>
    </xsl:template>
    
    <xsl:template match="chapter">
        <xsl:variable name="counts" select="count(.//figurative)"/>
        <xsl:variable name="total-counts" select="string-length(normalize-space(string-join(.//figurative, ' ')))"/>
        <xsl:variable name="count1" select="string-length(normalize-space(string-join(.//figurative[@style='simile'], ' ')))"/>
        <xsl:variable name="count2" select="string-length(normalize-space(string-join(.//figurative[@style='metaphor'], ' ')))"/>
        <xsl:variable name="count3" select="string-length(normalize-space(string-join(.//figurative[@style='irony'], ' ')))"/>
        <xsl:variable name="count4" select="string-length(normalize-space(string-join(.//figurative[@style='sybolism'], ' ')))"/>
        <xsl:variable name="count5" select="string-length(normalize-space(string-join(.//figurative[@style='personification'], ' ')))"/>
        <xsl:variable name="count6" select="string-length(normalize-space(string-join(.//figurative[@style='hyperbole'], ' ')))"/>
        <xsl:variable name="count7" select="string-length(normalize-space(string-join(.//figurative[@style='idiom'], ' ')))"/>
      
        <rect x="{-120+$x-scale*position()}" y="-{($count1+$count2+$count3+$count4+$count5+$count6+$count7)*0.2}" height="{($count1+$count2+$count3+$count4+$count5+$count6+$count7)*0.2}" fill="blue" width="75" stroke="black" stroke-width="2"/>

        <rect x="{-120+$x-scale*position()}" y="-{($count1+$count2+$count3+$count4+$count5+$count6)*0.2}" height="{($count1+$count2+$count3+$count4+$count5+$count6)*0.2}" fill="yellow" width="75" stroke="black" stroke-width="2"/>
        
        <rect x="{-120+$x-scale*position()}" y="-{($count1+$count2+$count3+$count4+$count5)*0.2}" height="{($count1+$count2+$count3+$count4+$count5)*0.2}" fill="red" width="75" stroke="black" stroke-width="2"/>
        
        <rect x="{-120+$x-scale*position()}" y="-{($count1+$count2+$count3+$count4)*0.2}" height="{($count1+$count2+$count3+$count4)*0.2}" fill="green" width="75" stroke="black" stroke-width="2"/>
    
        <rect x="{-120+$x-scale*position()}" y="-{($count1+$count2+$count3)*0.2}" height="{($count1+$count2+$count3)*0.2}" fill="purple" width="75" stroke="black" stroke-width="2"/>
        
        <rect x="{-120+$x-scale*position()}" y="-{($count1+$count2)*0.2}" height="{($count1+$count2)*0.2}" fill="black" width="75" stroke="black" stroke-width="2"/>     
        
        <rect x="{-120+$x-scale*position()}" y="-{$count1*0.2}" height="{$count1*0.2}" fill="gray" width="75" stroke="black" stroke-width="2"/>
        
       
        <!-- piled bars -->
        <text x="{-100+$x-scale*position()}" y="20" text-anchor="middle" font-size="13"><xsl:value-of select="@name"/></text>
    </xsl:template>
</xsl:stylesheet>