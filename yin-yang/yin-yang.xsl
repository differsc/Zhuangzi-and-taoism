<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:djb="http://www.obdurodon.org"
  xmlns:math="http://www.w3.org/2005/xpath-functions/math" exclude-result-prefixes="xs math"
  version="3.0">
  <!-- ================================================================== -->
  <!-- https://www.youtube.com/watch?v=voH-YIi4Bps                        -->
  <!-- https://www.w3.org/TR/SVG/paths.html#PathDataEllipticalArcCommands -->
  <!-- ================================================================== -->
  <xsl:output method="xml" indent="yes"/>
  <!-- ================================================================== -->
  <!-- Stylesheet variables                                               -->
  <!-- radius as xs:integer: radius of large circle                       -->
  <!-- ================================================================== -->
  <xsl:variable name="radius" as="xs:integer" select="80"/>
  <!-- ================================================================== -->
  <!-- Functions                                                          -->
  <!-- ================================================================== -->
  <xsl:function name="djb:circle-intersection" as="map(*)">
    <!-- ================================================================ -->
    <!-- Find points of intersection of two circles                       -->
    <!--                                                                  -->
    <!-- Not used or needed. The YouTube video above uses this to find    -->
    <!--   centers for small circles, but because we center on the origin -->
    <!--   the X value is zero and the Y values are $radius and -$radius  -->
    <!-- We keep this only in case it might be useful elsewhere           -->
    <!--                                                                  -->
    <!-- Parameters:                                                      -->
    <!--   x1, y1 : both xs:double, center of main circle                 -->
    <!--   x2, y2 : both xs:double, center of offset circle               -->
    <!--   r1 : xs:double, radius of main circle                          -->
    <!--   r2 : xs:double, radius of offset circle                        -->
    <!--                                                                  -->
    <!-- Result:                                                          -->
    <!--   map with four string keys:                                     -->
    <!--     x3, y3, x4, y4 : all xs:double, two points of intersection   -->
    <!--                                                                  -->
    <!-- Assumption:                                                      -->
    <!--   Circles intersect in two points                                -->
    <!--                                                                  -->
    <!-- https://lucidar.me/en/mathematics/how-to-calculate-the-intersection-points-of-two-circles/ -->
    <!-- center of circle C1 is P1 = (x1, y1)                             -->
    <!-- center of circle C2 is P2 = (x2, y2)                             -->
    <!-- radius of circle C1 is r1                                        -->
    <!-- radius of circle C2 is r2                                        -->
    <!-- ================================================================ -->
    <xsl:param name="x1" as="xs:double"/>
    <xsl:param name="y1" as="xs:double"/>
    <xsl:param name="x2" as="xs:double"/>
    <xsl:param name="y2" as="xs:double"/>
    <xsl:param name="r1" as="xs:double"/>
    <xsl:param name="r2" as="xs:double"/>
    <!-- d = distance between circle centers                              -->
    <xsl:variable name="d" as="xs:double"
      select="(math:pow($x2 - $x1, 2) + math:pow($y2 - $y1, 2)) => math:sqrt()"/>
    <!-- a = distance between P1 and P5 (to be computed)                  -->
    <xsl:variable name="a" as="xs:double"
      select="(math:pow($r1, 2) - math:pow($r2, 2) + math:pow($d, 2)) div (2 * $d)"/>
    <!-- b = distance between P2 and P5                                   -->
    <xsl:variable name="a" as="xs:double"
      select="(math:pow($r2, 2) - math:pow($r1, 2) + math:pow($d, 2)) div (2 * $d)"/>
    <!-- h = distance between P5 and P3                                   -->
    <xsl:variable name="h" as="xs:double"
      select="(math:pow($r1, 2) - math:pow($a, 2)) => math:sqrt()"/>
    <!-- x5, y5 = coordinates of P5                                       -->
    <xsl:variable name="x5" as="xs:double" select="$x1 + ($a div $d) * ($x2 - $x1)"/>
    <xsl:variable name="y5" as="xs:double" select="$y1 + ($a div $d) * ($y2 - $y1)"/>
    <!-- x3, y3, x4, y4 = coordinates of points of intersection           -->
    <xsl:variable name="x3" as="xs:double" select="$x5 + ($h * ($y2 - $y1)) div $d"/>
    <xsl:variable name="x4" as="xs:double" select="$x5 - ($h * ($y2 - $y1)) div $d"/>
    <xsl:variable name="y3" as="xs:double" select="$y5 + ($h * ($x2 - $x1)) div $d"/>
    <xsl:variable name="y4" as="xs:double" select="$y5 - ($h * ($x2 - $x1)) div $d"/>
    <xsl:map>
      <xsl:map-entry key="'x3'" select="$x3"/>
      <xsl:map-entry key="'y3'" select="$y3"/>
      <xsl:map-entry key="'x4'" select="$x4"/>
      <xsl:map-entry key="'y4'" select="$y4"/>
    </xsl:map>
  </xsl:function>
  <!-- ================================================================== -->

  <!-- ================================================================== -->
  <!-- Templates                                                          -->
  <!-- ================================================================== -->
  <xsl:template name="xsl:initial-template">
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="-{$radius}, -{$radius} {2 * $radius} {2 * $radius}">
      <!-- Large outer circle -->
      <circle cx="0" cy="0" r="{$radius}" stroke="black" fill-opacity="0" fill="white"/>
      <!-- Black side -->
      <!-- Arc formula: A rx ry x-axis-rotation large-arc-flag sweep-flag xf yf 
          For semicircle rx = ry
          Axis rotation: Doesn't matter for circular arc; keeps start and end points
          Large-arc-flag: Doesn't matter for semicircle;  0 or 1 to choose smaller
          Sweep-flag: 0 for counterclockwise, 1 for clockwise
          xf, xy: ending points of arc
      -->
      <path d="
        M 0, 0
        A {$radius div 2} {$radius div 2} 0 0 1 0 {$radius}
        A {$radius} {$radius} 0 0 0 0 -{$radius}
        A {$radius div 2} {$radius div 2} 0 0 0 0 0"
        fill="black"/>
      <!-- Upper and lower small inner circles -->
      <circle cx="0" cy="-{$radius div 2}" r="{$radius div 8}" fill="white"/>
      <circle cx="0" cy="{$radius div 2}" r="{$radius div 8}" fill="black"/>
    </svg>
  </xsl:template>
</xsl:stylesheet>
