<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="#all"
    xmlns="http://www.w3.org/2000/svg" version="3.0">
    <xsl:output method="xml" indent="yes"/>
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
            <rect x="{160+$x-max}" y="-{-80+$y-max}" height="50" fill="black" width="25" stroke="white" stroke-width="2"/>
            <text x="{110+$x-max}" y="-{-160+$y-max}" text-align="middle" >Character Counts</text>
            <rect x="{160+$x-max}" y="-{-200+$y-max}" height="50" fill="white" width="25" stroke="black" stroke-width="2"/>
            <text x="{140+$x-max}" y="-{-280+$y-max}" text-align="middle" >Instances</text>
            <rect x="{160+$x-max}" y="-{-320+$y-max}" height="50" fill="gray" width="25" stroke="black" stroke-width="2"/>
            <text x="{140+$x-max}" y="-{-400+$y-max}" text-align="middle">Total Counts</text> 
            <!-- Legends -->
            <xsl:apply-templates select="//chapter"/>
        </svg>
    </xsl:template>
    
    <xsl:template match="chapter">
        <xsl:variable name="counts" select="count(.//figurative)"/>
        <xsl:variable name="weighted-counts" select="string-length(normalize-space(string-join(.//figurative, ' ')))"/>
        <xsl:variable name="total-counts" select="string-length(normalize-space(string-join(.//p, ' ')))"/>
        <xsl:variable name="portion" select="format-number($weighted-counts div $total-counts*100, '0.00')"/>
        <rect x="{-120+$x-scale*position()}" y="-{$total-counts*0.02}" height="{$total-counts*0.02}" fill="gray" width="75" stroke="black" stroke-width="2"/>
        <text x="{-80+$x-scale*position()}" y="-{$total-counts*0.02+10}" text-anchor="middle"><xsl:value-of select="$total-counts"/></text>
        <!-- bar -->
        <rect x="{-200+$x-scale*position()}" y="-{$counts*20}" height="{$counts*20}" fill="white" width="75" stroke="black" stroke-width="2"/>
        <text x="{-160+$x-scale*position()}" y="-{$counts*20+10}" text-anchor="middle"><xsl:value-of select="$counts"/></text>
        <!-- bar by instances -->
        <rect x="{-120+$x-scale*position()}" y="-{$weighted-counts*0.02}" height="{$weighted-counts*0.02}" fill="black" width="75" stroke="black" stroke-width="2"/>
        <text x="{-20+$x-scale*position()}" y="-{$weighted-counts*0.02+10}" text-anchor="middle"><xsl:value-of select="$weighted-counts"/></text>
        <!-- bar by actual character counts -->
        <text x="{-100+$x-scale*position()}" y="20" text-anchor="middle" font-size="13"><xsl:value-of select="@name"/></text>
        <text x="{-20+$x-scale*position()}" y="-{$weighted-counts*0.02-10}" text-anchor="middle"><xsl:value-of select="$portion"/>%</text>
    </xsl:template>
</xsl:stylesheet>