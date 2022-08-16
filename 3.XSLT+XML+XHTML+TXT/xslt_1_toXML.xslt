<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" />
    <xsl:template match="/">
        <xsl:element name="moviesReport">
            <xsl:element name="description">
                <xsl:element name="name">
                    <xsl:value-of select="root/name"/>
                </xsl:element>
                <xsl:element name="authors">
                    <xsl:apply-templates select="root/autorzy"/>
                </xsl:element>
            </xsl:element>
            <xsl:element name="moviesList">
                <xsl:apply-templates select="root/kolekcja_filmów"/>
            </xsl:element>
            <xsl:element name="summary">
                <xsl:element name="genresCount">
                    <xsl:value-of select="count(//root/gatunki/gatunek)"/>
                </xsl:element>
                <xsl:element name="genres">
                    <xsl:element name="fantasyCount">
                        <xsl:value-of select="count(//root/kolekcja_filmów/film[@gatunekID='Fantasy'])"/>
                    </xsl:element>
                    <xsl:element name="sciFiCount">
                        <xsl:value-of select="count(//root/kolekcja_filmów/film[@gatunekID='Sci-Fi'])"/>
                    </xsl:element>
                    <xsl:element name="dramaCount">
                        <xsl:value-of select="count(//root/kolekcja_filmów/film[@gatunekID='Dramat'])"/>
                    </xsl:element>
                    <xsl:element name="thillerCount">
                        <xsl:value-of select="count(//root/kolekcja_filmów/film[@gatunekID='Thriller'])"/>
                    </xsl:element>
                    <xsl:element name="historicalCount">
                        <xsl:value-of select="count(//root/kolekcja_filmów/film[@gatunekID='Historyczny'])"/>
                    </xsl:element>
                    <xsl:element name="comedyCount">
                        <xsl:value-of select="count(//root/kolekcja_filmów/film[@gatunekID='Komedia'])"/>
                    </xsl:element>
                    <xsl:element name="warCount">
                        <xsl:value-of select="count(//root/kolekcja_filmów/film[@gatunekID='Wojenny'])"/>
                    </xsl:element>
                    <xsl:element name="catastrophicCount">
                        <xsl:value-of select="count(//root/kolekcja_filmów/film[@gatunekID='Katastroficzny'])"/>
                    </xsl:element>
                </xsl:element>
                <xsl:element name="averageRating">
                    <xsl:value-of select="format-number(sum(//root/kolekcja_filmów/film/ocena_filmweb) div count(//root/kolekcja_filmów/film),'0.00')"/>
                </xsl:element>
                <xsl:element name="avgRatingByGenres">
                    <xsl:element name="fantasyRating">
                        <xsl:value-of select="format-number(sum(//root/kolekcja_filmów/film[@gatunekID='Fantasy']/ocena_filmweb) div count(//root/kolekcja_filmów/film[@gatunekID='Fantasy']),'0.00')"/>
                    </xsl:element>
                    <xsl:element name="sciFiRating">
                        <xsl:value-of select="format-number(sum(//root/kolekcja_filmów/film[@gatunekID='Sci-Fi']/ocena_filmweb) div count(//root/kolekcja_filmów/film[@gatunekID='Sci-Fi']),'0.00')"/>
                    </xsl:element>
                    <xsl:element name="dramaRating">
                        <xsl:value-of select="format-number(sum(//root/kolekcja_filmów/film[@gatunekID='Dramat']/ocena_filmweb) div count(//root/kolekcja_filmów/film[@gatunekID='Dramat']),'0.00')"/>
                    </xsl:element>
                    <xsl:element name="thillerRating">
                        <xsl:value-of select="format-number(sum(//root/kolekcja_filmów/film[@gatunekID='Thriller']/ocena_filmweb) div count(//root/kolekcja_filmów/film[@gatunekID='Thriller']),'0.00')"/>
                    </xsl:element>
                    <xsl:element name="historicalRating">
                        <xsl:value-of select="format-number(sum(//root/kolekcja_filmów/film[@gatunekID='Historyczny']/ocena_filmweb) div count(//root/kolekcja_filmów/film[@gatunekID='Historyczny']),'0.00')"/>
                    </xsl:element>
                    <xsl:element name="comedyRating">
                        <xsl:value-of select="format-number(sum(//root/kolekcja_filmów/film[@gatunekID='Komedia']/ocena_filmweb) div count(//root/kolekcja_filmów/film[@gatunekID='Komedia']),'0.00')"/>
                    </xsl:element>
                    <xsl:element name="warRating">
                        <xsl:value-of select="format-number(sum(//root/kolekcja_filmów/film[@gatunekID='Wojenny']/ocena_filmweb) div count(//root/kolekcja_filmów/film[@gatunekID='Wojenny']),'0.00')"/>
                    </xsl:element>
                    <xsl:element name="catastrophicRating">
                        <xsl:value-of select="format-number(sum(//root/kolekcja_filmów/film[@gatunekID='Katastroficzny']/ocena_filmweb) div count(//root/kolekcja_filmów/film[@gatunekID='Katastroficzny']),'0.00')"/>
                    </xsl:element>
                </xsl:element>
                <xsl:element name="averageBudget">
                    <xsl:value-of select="format-number(sum(//root/kolekcja_filmów/film/budzet) div count(//root/kolekcja_filmów/film),'###,###,###')"/>
                </xsl:element>
                <xsl:element name="avgBudgetByGenres">
                    <xsl:element name="fantasyBudget">
                        <xsl:value-of select="format-number(sum(//root/kolekcja_filmów/film[@gatunekID='Fantasy']/budzet) div count(//root/kolekcja_filmów/film[@gatunekID='Fantasy']),'###,###,###')"/>
                    </xsl:element>
                    <xsl:element name="sciFiBudget">
                        <xsl:value-of select="format-number(sum(//root/kolekcja_filmów/film[@gatunekID='Sci-Fi']/budzet) div count(//root/kolekcja_filmów/film[@gatunekID='Sci-Fi']),'###,###,###')"/>
                    </xsl:element>
                    <xsl:element name="dramaBudget">
                        <xsl:value-of select="format-number(sum(//root/kolekcja_filmów/film[@gatunekID='Dramat']/budzet) div count(//root/kolekcja_filmów/film[@gatunekID='Dramat']),'###,###,###')"/>
                    </xsl:element>
                    <xsl:element name="thillerBudget">
                        <xsl:value-of select="format-number(sum(//root/kolekcja_filmów/film[@gatunekID='Thriller']/budzet) div count(//root/kolekcja_filmów/film[@gatunekID='Thriller']),'###,###,###')"/>
                    </xsl:element>
                    <xsl:element name="historicalBudget">
                        <xsl:value-of select="format-number(sum(//root/kolekcja_filmów/film[@gatunekID='Historyczny']/budzet) div count(//root/kolekcja_filmów/film[@gatunekID='Historyczny']),'###,###,###')"/>
                    </xsl:element>
                    <xsl:element name="comedyBudget">
                        <xsl:value-of select="format-number(sum(//root/kolekcja_filmów/film[@gatunekID='Komedia']/budzet) div count(//root/kolekcja_filmów/film[@gatunekID='Komedia']),'###,###,###')"/>
                    </xsl:element>
                    <xsl:element name="warBudget">
                        <xsl:value-of select="format-number(sum(//root/kolekcja_filmów/film[@gatunekID='Wojenny']/budzet) div count(//root/kolekcja_filmów/film[@gatunekID='Wojenny']),'###,###,###')"/>
                    </xsl:element>
                    <xsl:element name="catastrophicBudget">
                        <xsl:value-of select="format-number(sum(//root/kolekcja_filmów/film[@gatunekID='Katastroficzny']/budzet) div count(//root/kolekcja_filmów/film[@gatunekID='Katastroficzny']),'###,###,###')"/>
                    </xsl:element>
                </xsl:element>
                <xsl:element name="averageGain">
                    <xsl:value-of select="format-number((sum(//root/kolekcja_filmów/film/box_office) - sum(//root/kolekcja_filmów/film/budzet)) div count(//root/kolekcja_filmów/film),'###,###,###')"/>
                </xsl:element>
                <xsl:element name="avgGainByGenres">
                    <xsl:element name="fantasyGain">
                        <xsl:value-of select="format-number(sum(//root/kolekcja_filmów/film[@gatunekID='Fantasy']/box_office) - sum(//root/kolekcja_filmów/film[@gatunekID='Fantasy']/budzet) div count(//root/kolekcja_filmów/film[@gatunekID='Fantasy']),'###,###,###,###')"/>
                    </xsl:element>
                    <xsl:element name="sciFiGain">
                        <xsl:value-of select="format-number(sum(//root/kolekcja_filmów/film[@gatunekID='Sci-Fi']/box_office) - sum(//root/kolekcja_filmów/film[@gatunekID='Sci-Fi']/budzet) div count(//root/kolekcja_filmów/film[@gatunekID='Sci-Fi']),'###,###,###')"/>
                    </xsl:element>
                    <xsl:element name="dramaGain">
                        <xsl:value-of select="format-number(sum(//root/kolekcja_filmów/film[@gatunekID='Dramat']/box_office) - sum(//root/kolekcja_filmów/film[@gatunekID='Dramat']/budzet) div count(//root/kolekcja_filmów/film[@gatunekID='Dramat']),'###,###,###')"/>
                    </xsl:element>
                    <xsl:element name="thillerGain">
                        <xsl:value-of select="format-number(sum(//root/kolekcja_filmów/film[@gatunekID='Thriller']/box_office) - sum(//root/kolekcja_filmów/film[@gatunekID='Thriller']/budzet) div count(//root/kolekcja_filmów/film[@gatunekID='Thriller']),'###,###,###')"/>
                    </xsl:element>
                    <xsl:element name="historicalGain">
                        <xsl:value-of select="format-number(sum(//root/kolekcja_filmów/film[@gatunekID='Historyczny']/box_office) - sum(//root/kolekcja_filmów/film[@gatunekID='Historyczny']/budzet) div count(//root/kolekcja_filmów/film[@gatunekID='Historyczny']),'###,###,###')"/>
                    </xsl:element>
                    <xsl:element name="comedyGain">
                        <xsl:value-of select="format-number(sum(//root/kolekcja_filmów/film[@gatunekID='Komedia']/box_office) - sum(//root/kolekcja_filmów/film[@gatunekID='Komedia']/budzet) div count(//root/kolekcja_filmów/film[@gatunekID='Komedia']),'###,###,###')"/>
                    </xsl:element>
                    <xsl:element name="warGain">
                        <xsl:value-of select="format-number(sum(//root/kolekcja_filmów/film[@gatunekID='Wojenny']/box_office) - sum(//root/kolekcja_filmów/film[@gatunekID='Wojenny']/budzet) div count(//root/kolekcja_filmów/film[@gatunekID='Wojenny']),'###,###,###')"/>
                    </xsl:element>
                    <xsl:element name="catastrophicGain">
                        <xsl:value-of select="format-number(sum(//root/kolekcja_filmów/film[@gatunekID='Katastroficzny']/box_office) - sum(//root/kolekcja_filmów/film[@gatunekID='Katastroficzny']/budzet) div count(//root/kolekcja_filmów/film[@gatunekID='Katastroficzny']),'###,###,###')"/>
                    </xsl:element>
                </xsl:element>
            </xsl:element>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="root/autorzy">
        <xsl:for-each select="student">
            <xsl:element name="author">
                <xsl:attribute name="author">
                    <xsl:value-of select="." />
                </xsl:attribute>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="root/kolekcja_filmów">
        <xsl:for-each select="film">
            <xsl:sort select="@gatunekID" order="ascending"/>
            <xsl:sort select="tytul" order="ascending"/>
            <xsl:element name="movie">
                <xsl:attribute name="genre">
                    <xsl:value-of select="@gatunekID"/>
                </xsl:attribute>
                <xsl:attribute name="director">
                    <xsl:value-of select="rezyser"/>
                </xsl:attribute>
                <xsl:attribute name="scenarist">
                    <xsl:value-of select="scenariusz"/>
                </xsl:attribute>
                <xsl:attribute name="budget">
                    <xsl:value-of select="budzet"/>
                </xsl:attribute>
                <xsl:attribute name="boxOffice">
                    <xsl:value-of select="box_office"/>
                </xsl:attribute>
                <xsl:attribute name="premiere">
                    <xsl:value-of select="data_premiery"/>
                </xsl:attribute>
                <xsl:attribute name="rate">
                    <xsl:value-of select="ocena_filmweb"/>
                </xsl:attribute>
                <xsl:attribute name="countryOfProduction">
                    <xsl:choose>
                        <xsl:when test="string(@kraj_id) = 'gb'">
                            <xsl:value-of select="//country/kraj_produkcji[1]"/>
                        </xsl:when>
                        <xsl:when test="string(@kraj_id) = 'us'">
                            <xsl:value-of select="//country/kraj_produkcji[2]"/>
                        </xsl:when>
                        <xsl:when test="string(@kraj_id) = 'nz'">
                            <xsl:value-of select="//country/kraj_produkcji[3]"/>
                        </xsl:when>
                        <xsl:when test="string(@kraj_id) = 'kd'">
                            <xsl:value-of select="//country/kraj_produkcji[4]"/>
                        </xsl:when>
                        <xsl:when test="string(@kraj_id) = 'au'">
                            <xsl:value-of select="//country/kraj_produkcji[5]"/>
                        </xsl:when>
                        <xsl:when test="string(@kraj_id) = 'fr'">
                            <xsl:value-of select="//country/kraj_produkcji[6]"/>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:value-of select="string('nierozpoznany kraj')"/>
                        </xsl:otherwise>
                    </xsl:choose>
                </xsl:attribute>
                <xsl:value-of select="tytul"/>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>
</xsl:stylesheet>