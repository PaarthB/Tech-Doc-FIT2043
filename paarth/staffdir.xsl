<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output indent="no" method="html"/>
	<xsl:template match="/">
        <html>
            <head>
                <title>Staff Directory for <xsl:value-of select="/staffdir/@org"/></title>
            </head>
            <body>
				<h1 style="font-family:Tahoma, Geneva, sans-serif;color:#1030C0"><xsl:value-of select="staffdir/@org"/> Staff</h1>
                <xsl:apply-templates select="/staffdir"/>
            </body>
        </html>
    </xsl:template>
	
	<xsl:template match="staffdir">
		<xsl:for-each select="person">
			<xsl:sort select="familyname"/>
			<div style="width:100%;overflow:auto">
				<div style="width:200px;float:left">
					<img width="150" src="{./image}" alt="{concat(./personalname, ' ', ./familyname)}"/>
				</div>
				<div style="margin-left:250px">
					<h2 style="font-family:Tahoma, Geneva, sans-serif; color:#1030C0"><xsl:value-of select="personalname"/>&#160;<xsl:value-of select="familyname"/>&#160;</h2>
					<p><em>Office phone: <xsl:value-of select="extension"/></em></p>
					<h3>Units</h3>
					<xsl:choose>
						<xsl:when test="count(unit)=0">
							<p>None</p>
						</xsl:when>
						<xsl:otherwise>
							<ul>
								<xsl:for-each select="./unit">
									<xsl:sort select="."/>
									<li><xsl:value-of select="."/></li>
								</xsl:for-each>
							</ul>	
						</xsl:otherwise>
					</xsl:choose>	
				</div>
			</div>
			<hr>
			</hr>
		</xsl:for-each>
	</xsl:template>
</xsl:stylesheet>