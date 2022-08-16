<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="text" version="1.0" encoding="UTF-8" indent="yes"/>
   <xsl:template match=" /">
	<xsl:value-of select="moviesReport/description/name"/><xsl:text>&#xA;</xsl:text>
        <xsl:for-each select="moviesReport/description/authors/author">
        <xsl:value-of select="substring(concat(@author,'                                                             '),1,60)"/>
        </xsl:for-each>
        <xsl:text>&#xA;-------------------------------------------------------------------------------&#xA;&#xA;</xsl:text>
		<xsl:for-each select="moviesReport/moviesList/movie">
			<xsl:value-of select="substring(concat(.,'                                                             '),1,60)"/>
			<xsl:value-of select="substring(concat(@genre,'                                                             '),1,45)"/>
			<xsl:value-of select="substring(concat(@scenarist,'                                                             '),1,45)"/>
			<xsl:value-of select="substring(concat(@budget,'                                                             '),1,45)"/>
			<xsl:value-of select="substring(concat(@boxOffice,'                                                             '),1,45)"/>
			<xsl:value-of select="substring(concat(@premiere,'                                                             '),1,45)"/>
			<xsl:value-of select="substring(concat(@rate,'                                                             '),1,45)"/>
                        <xsl:value-of select="substring(concat(@countryOfProduction,'                                               '),1,45)"/>
			<xsl:text>&#xA;</xsl:text>
		</xsl:for-each>
		<xsl:text>&#xA;-------------------------------------------------------------------------------&#xA;&#xA;</xsl:text>
		<xsl:apply-templates select="moviesReport/summary"/>
	</xsl:template>
	<xsl:template match="moviesReport/summary">
		<xsl:text>Podsumowanie:&#xA;&#xA;</xsl:text>
		<xsl:value-of select="concat('Liczba gatunków: ',genresCount)"/><xsl:text>&#xA;</xsl:text>
		<xsl:value-of select="concat('Liczba filmów fantasy: ',genres/fantasyCount)"/><xsl:text>&#xA;</xsl:text>
		<xsl:value-of select="concat('Liczba filmow sciFi ',genres/sciFiCount)"/><xsl:text>&#xA;</xsl:text>
		<xsl:value-of select="concat('Liczba dramatów: ',genres/dramaCount)"/><xsl:text>&#xA;</xsl:text>
		<xsl:value-of select="concat('Liczba thrillerów: ',genres/thillerCount)"/><xsl:text>&#xA;&#xA;</xsl:text>
                <xsl:value-of select="concat('Liczba filmów historycznych ',genres/historicalCount)"/><xsl:text>&#xA;</xsl:text>
		<xsl:value-of select="concat('Liczba filmów komediowych: ',genres/comedyCount)"/><xsl:text>&#xA;</xsl:text>
		<xsl:value-of select="concat('Liczba filmów wojennych: ',genres/warCount)"/><xsl:text>&#xA;&#xA;</xsl:text>
                <xsl:value-of select="concat('Liczba filmów katastroficznych: ',genres/catastrophicCount)"/><xsl:text>&#xA;&#xA;</xsl:text>
		
		<xsl:value-of select="substring(concat('Średnia ocena wszystkich gatunków: ',averageRating),-1, 41)"/><xsl:text>&#xA;</xsl:text>
		<xsl:value-of select="substring(concat('Średnia ocena filmów fantasy: ',avgRatingByGenres/fantasyRating),-2, 41)"/><xsl:text>&#xA;</xsl:text>
		<xsl:value-of select="substring(concat('Średnia ocena filmow sciFi: ',avgRatingByGenres/sciFiRating),-2, 48)"/><xsl:text>&#xA;</xsl:text>
		<xsl:value-of select="substring(concat('Średnia ocena  dramatów: ',avgRatingByGenres/dramaRating),-2, 43)"/><xsl:text>&#xA;</xsl:text>
		<xsl:value-of select="substring(concat('Średnia ocena thrillerów: ',avgRatingByGenres/thillerRating),-2, 43)"/><xsl:text>&#xA;&#xA;</xsl:text>
                <xsl:value-of select="substring(concat('Średnia ocena filmów historycznych: ',avgRatingByGenres/historicalRating),-2, 43)"/><xsl:text>&#xA;</xsl:text>
		<xsl:value-of select="substring(concat('Średnia ocena filmów komediowych: ',avgRatingByGenres/comedyRating),-2, 43)"/><xsl:text>&#xA;&#xA;</xsl:text>
                <xsl:value-of select="substring(concat('Średnia ocena filmów wojennych: ',avgRatingByGenres/warRating),-2, 43)"/><xsl:text>&#xA;</xsl:text>
		<xsl:value-of select="substring(concat('Średnia ocena filmów katastroficznych: ',avgRatingByGenres/catastrophicRating),-2, 47)"/><xsl:text>&#xA;</xsl:text>
                
                <xsl:value-of select="substring(concat('Średni budżet wszystkich gatunków: ',averageBudget),-1, 60)"/><xsl:text>&#xA;&#xA;</xsl:text>
		<xsl:value-of select="substring(concat('Średni budżet filmów fantasy: ',avgBudgetByGenres/fantasyBudget),-2, 60)"/><xsl:text>&#xA;&#xA;</xsl:text>
		<xsl:value-of select="substring(concat('Średni budżet filmow sciFi: ',avgBudgetByGenres/sciFiBudget),-2, 60)"/><xsl:text>&#xA;&#xA;</xsl:text>
		<xsl:value-of select="substring(concat('Średni budżet  dramatów: ',avgBudgetByGenres/dramaBudget),-2, 60)"/><xsl:text>&#xA;&#xA;</xsl:text>
		<xsl:value-of select="substring(concat('Średni budżet thrillerów: ',avgBudgetByGenres/thillerBudget),-2, 60)"/><xsl:text>&#xA;&#xA;</xsl:text>
                <xsl:value-of select="substring(concat('Średni budżet filmów historycznych: ',avgBudgetByGenres/historicalBudget),-2, 60)"/><xsl:text>&#xA;&#xA;</xsl:text>
		<xsl:value-of select="substring(concat('Średni budżet filmów komediowych: ',avgBudgetByGenres/comedyBudget),-2, 60)"/><xsl:text>&#xA;&#xA;</xsl:text>
                <xsl:value-of select="substring(concat('Średni budżet filmów wojennych: ',avgBudgetByGenres/warBudget),-2, 60)"/><xsl:text>&#xA;&#xA;</xsl:text>
		<xsl:value-of select="substring(concat('Średni budżet filmów katastroficznych: ',avgBudgetByGenres/catastrophicBudget),-2, 60)"/><xsl:text>&#xA;&#xA;</xsl:text>
                
                <xsl:value-of select="substring(concat('Średni zysk wszystkich gatunków: ',averageGain),-1, 60)"/><xsl:text>&#xA;&#xA;</xsl:text>
		<xsl:value-of select="substring(concat('Średni zysk filmów fantasy: ',avgGainByGenres/fantasyGain),-2, 60)"/><xsl:text>&#xA;&#xA;</xsl:text>
		<xsl:value-of select="substring(concat('Średni zysk filmow sciFi: ',avgGainByGenres/sciFiGain),-2, 60)"/><xsl:text>&#xA;&#xA;</xsl:text>
		<xsl:value-of select="substring(concat('Średni zysk  dramatów: ',avgGainByGenres/dramaGain),-2, 60)"/><xsl:text>&#xA;&#xA;</xsl:text>
		<xsl:value-of select="substring(concat('Średni zysk thrillerów: ',avgGainByGenres/thillerGain),-2, 60)"/><xsl:text>&#xA;&#xA;</xsl:text>
                <xsl:value-of select="substring(concat('Średni zysk filmów historycznych: ',avgGainByGenres/historicalGain),-2, 60)"/><xsl:text>&#xA;&#xA;</xsl:text>
		<xsl:value-of select="substring(concat('Średni zysk filmów komediowych: ',avgGainByGenres/comedyGain),-2, 60)"/><xsl:text>&#xA;&#xA;</xsl:text>
                <xsl:value-of select="substring(concat('Średni zysk filmów wojennych: ',avgGainByGenres/warGain),-2, 60)"/><xsl:text>&#xA;&#xA;</xsl:text>
		<xsl:value-of select="substring(concat('Średni zysk filmów katastroficznych: ',avgGainByGenres/catastrophicGain),-2, 60)"/><xsl:text>&#xA;&#xA;</xsl:text>
                
	</xsl:template>
</xsl:stylesheet>
