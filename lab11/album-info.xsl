<?xml version="1.0"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <!-- ROOT HTML. Output method of the output is html -->
    <xsl:output indent="yes" method="html"/>

    <xsl:template match="/">
        <html>
            <!--Style guide of the document-->
            <head>
                <title>Album Information on
                    <xsl:value-of select="album-info/title"/>
                </title>
            </head>
            <body>
                <xsl:apply-templates select="/album-info"/>
            </body>
        </html>
    </xsl:template>


    <xsl:template match="album-info">
        <h1 style="font-family:sans-serif; color:#888888; font-size:60px">
            <xsl:value-of select="title"/>
        </h1>
        <!--<xsl:param-name = "image" value="cover-art/@url"/>
        <xsl:param-name = "desc" value="cover-art/@description"/>-->
		
		<!--<xsl:variable name="image"><xsl:value-of select="cover-art/@url"/></xsl:variable>
		<xsl:variable name="image"><xsl:value-of select="cover-art/@description"/></xsl:variable>-->

        <div id="cover" style="padding:5px; margin:10px; height:800px; float:left">
            <img src= "{cover-art/@url}" alt='{/cover-art/@description}' align="top"/>
        </div>

        <div id="details" style="padding:5px; margin:10px">
            <span style="font-family:sans-serif; color:#444444; font-size:30px">Title:
                <xsl:value-of select="title"/>
            </span>
            <br/>
            <span style="font-family:sans-serif; color:#444444; font-size:30px">Artist:
                <xsl:value-of select="artist"/>
            </span>
            <br/>
            <xsl:choose>
                <xsl:when test="count(release-month) = 0">
                    <span style="font-family:sans-serif; color:#444444; font-size:30px">Released:
                        <xsl:value-of select="release-year"/>
                    </span>
                    <br/>
                </xsl:when>

                <xsl:otherwise>
                    <span style="font-family:sans-serif; color:#444444; font-size:30px">Released:
                        <xsl:value-of select="release-month"/>&#160;<xsl:value-of select="release-year"/>
                    </span>
                    <br/>
                </xsl:otherwise>
            </xsl:choose>

            <span style="font-family:sans-serif; color:#444444; font-size:30px">Tracks:</span>
            <br/>

            <xsl:apply-templates select="track-list"/>
            <br/>

            <a href="{amazon-link}">
                <span style="font-family:sans-serif; color:#DD0000; font-size:30px">Buy Me!</span>
            </a>
        </div>
    </xsl:template>

    <xsl:template match="track-list">
        <xsl:for-each select="track">
			<xsl:choose>
				<xsl:when test="count(.[@composer]) =0">
					<!--<xsl:value-of select="count(.[@composer])"/>-->
                    <span style="font-family:sans-serif; color:#BBAA00; font-size:18px">
						<xsl:value-of select="concat(position(),'. ', .)"/>
						<br/>
					</span>
                </xsl:when>

                <xsl:otherwise>
					<!--<xsl:value-of select="count(.[@composer])"/>-->
                    <span style="font-family:sans-serif; color:#BBAA00; font-size:18px">
                        <xsl:value-of select="concat(position(),'. ',.)"/>
                    </span><xsl:value-of select="concat('(', @composer, ')')"/>
                    <br/>
                </xsl:otherwise>
			
			
			</xsl:choose>
                
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>	