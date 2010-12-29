<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
		xmlns:xlink="http://www.w3.org/1999/xlink"
		xmlns="http://www.w3.org/2000/svg"   >
  <xsl:output method="xml"/>
  <xsl:strip-space  elements="*"/>
  <xsl:template match="/">
    <svg xmlns="http://www.w3.org/2000/svg" 
	 xmlns:xlink="http://www.w3.org/1999/xlink" 
	 width="4in" height="905" version="1.2">
      <defs>
        <linearGradient y2="30%" y1="100%" x2="60%" x1="100%" id="folder-shade">
	  <stop stop-color="#CCCC66" offset="0%"/>
	  <stop stop-color="yellow" offset="80%"/>
        </linearGradient>
        <linearGradient x2="90%" y2="100%" x1="0" y1="0" id="stroke-gradient">
	  <stop stop-color="orange" offset="0%"/>
	  <stop stop-color="#CCCC66" offset="80%"/>
        </linearGradient>
        <rect stroke-width="0.25" fill="url(#folder-shade)" 
	      color="yellow" stroke-linejoin="round" id="front" 
	      stroke="url(#stroke-gradient)" height="15" width="20"/>
        <path stroke-width=".5" fill="#888888" id="back" 
	      d="M1,0 H4 C7,0 5,2 8,3 H20 V18 H0 V3 C0,3 0,0 2,0 z"/>
        <g transform="scale(0.7)" id="folder">
	  <use transform="skewX(5)" xlink:href="#back"/>
	  <use transform="translate(3,4) scale(1,.95) skewX(-5)" xlink:href="#front"/>
        </g>
        <line stroke-width=".5" stroke="gray" x2="13" x1="3" id="full-line"/>
        <line stroke-width=".5" stroke="gray" x2="7" x1="3" id="half-line"/>
        <g transform="scale(.7,.7)" id="file-generic">
	  <rect stroke-linejoin="bevel" stroke-width=".8" stroke="gray" 
		fill="#EEEEEE" height="20" width="16"/>
	  <use transform="translate(0,3)" xlink:href="#full-line"/>
	  <use transform="translate(0,6)" xlink:href="#full-line"/>
	  <use transform="translate(0,9)" xlink:href="#half-line"/>
	  <use transform="translate(0,12)" xlink:href="#full-line"/>
	  <use transform="translate(0,15)" xlink:href="#half-line"/>
        </g>
      </defs>
      <g transform="scale(0.7)">
	<xsl:apply-templates select="/directory" />
      </g>
    </svg>
  </xsl:template>

  <xsl:template match="directory">
    <xsl:variable name="vertical" 
		  select="count(preceding-sibling::*/descendant-or-self::*)" />
    <!-- here some math is to be done -->
    <xsl:element name="g" >
      <xsl:attribute name="transform">translate(25,<xsl:value-of select="($vertical+1)*25"/>)
      </xsl:attribute>
      <use xlink:href="#folder"/>
      <line stroke="black" y2="6" y1="6" x2="0" x1="-15"/>
      <text font-weight="bold" font-size="10pt" y="12" x="20">
	<xsl:value-of  select="@name" />
      </text>
      <xsl:apply-templates select="file|directory" />
      <xsl:element name="line">
	<xsl:attribute name="x1" >-15</xsl:attribute>
	<xsl:attribute name="x2" >-15</xsl:attribute>
	<xsl:attribute name="y1" >6</xsl:attribute>
	<xsl:attribute name="y2" >
	  <xsl:value-of select="-10 - ($vertical ) * 25 " />
	</xsl:attribute>
	<xsl:attribute name="stroke" >black</xsl:attribute>
      </xsl:element>      
    </xsl:element>
  </xsl:template>

  <xsl:template match="file"> 
    <xsl:variable name="vertical" 
		  select="count(preceding-sibling::*/descendant-or-self::*)" />
    <xsl:element name="g" >
      <xsl:attribute name="transform">
	translate(25,
	<xsl:value-of select="($vertical+1)*25"/>
      )</xsl:attribute>
      <use xlink:href="#file-generic"/>
      <line stroke="black" y2="6" y1="6" x2="0" x1="-15"/>
      <text font-weight="bold" font-size="10pt" y="12" x="20">
	<xsl:value-of  select="." />
      </text>
      <xsl:element name="line">
	<xsl:attribute name="x1" >-15</xsl:attribute>
	<xsl:attribute name="x2" >-15</xsl:attribute>
	<xsl:attribute name="y1" >6</xsl:attribute>
	<xsl:attribute name="y2" >
	  <xsl:value-of select="-10 - ($vertical) * 25 " />
	</xsl:attribute>
	<xsl:attribute name="stroke" >black</xsl:attribute>
      </xsl:element>     
    </xsl:element>
  </xsl:template>

</xsl:stylesheet>

