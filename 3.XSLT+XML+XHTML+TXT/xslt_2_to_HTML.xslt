<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                version="2.0"
                >
    <xsl:output method="xml" 
                    encoding="utf-8" 
                    doctype-public="-//W3C//DTD XHTML 1.0 Strict//EN" 
                    doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd" 
                    indent="yes"/>
    
    <xsl:template match="/">
        <html xmlns="http://www.w3.org/1999/xhtml" xml:lang="pl" lang="pl">
            <head>
                <title>Raport z kolekcji filmów</title>
                <style type="text/css">
                    body {
			background-color: #cccccc;
                    }
                    table{
                        font-family: 'Century Gothic';
			border-collapse: collapse;
			text-align: center;
			padding: 10px;                       
			background-color: rgba(232, 240, 255, 0.5);
                        margin-left:auto;
                        margin-right:auto;
                        text-align:center;
                    }
                    table, th, td {
			border: 1px solid #003293;
			text-align: center;
			padding: 10px;
                        margin-bottom: 10px;
                    }
                    h1{
			font-family: Helvetica;
			color: #003293; 
			font-size: 40px;
			text-align: center;
                    }
                    h2{
                        color: #002670;
                        font-family: Helvetica;
                        font-size: 12pt;
                        text-align: center;
                    }
                    tr.naglowek{
                        background-color: #d1e1ff;
                    } 
                    tr.podsumowanie{
                        background-color: #91e1ff;
                        font-weight: bold;
                    } 
                </style>
            </head>
            <body>
                <h1><xsl:value-of select="moviesReport/description/name"/></h1>
                <h2>Autorzy dokumentu:</h2>
                <xsl:for-each select="moviesReport/description/authors/author">
                <h2><xsl:value-of select="@author"/></h2>
                </xsl:for-each>
                <table>
                    <tr class="naglowek">
                        <th>Gatunek</th>
                        <th>Tytuł</th>
                        <th>Reżyser</th>
                        <th>Scenarzysta</th>
                        <th>Budżet</th>
                        <th>Premiera</th>
                        <th>Ocena na <br/> filmweb</th>
                        <th>Kraj produkcji</th>
                    </tr>
                    <xsl:for-each select="moviesReport/moviesList/movie">
                        <xsl:sort select="@genre" order="ascending"/>
                        <xsl:sort select="@budget" order="descending"/>
                        <tr>
                            <td><xsl:value-of select="@genre"/></td>
                            <td><xsl:value-of select="."/></td>
                            <td><xsl:value-of select="@director"/></td>
                            <td><xsl:value-of select="@scenarist"/></td>
                            <td><xsl:value-of select="@budget"/></td>
                            <td><xsl:value-of select="@premiere"/></td>
                            <td><xsl:value-of select="@rate"/></td>
                            <td><xsl:value-of select="@countryOfProduction"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
                <h2>Raport podsumowujący</h2>
                <table>
                    <tr class="naglowek">
                        <th>Gatunek</th>
                        <th>Ilość</th>
                        <th>Ocena</th>
                        <th>Budżet</th>
                        <th>Zysk</th>
                    </tr>
                    <tr>
                        <td>Fantasy</td>
                        <td><xsl:value-of select="moviesReport/summary/genres/fantasyCount"/></td>
                        <td><xsl:value-of select="moviesReport/summary/avgRatingByGenres/fantasyRating"/></td>
                        <td><xsl:value-of select="moviesReport/summary/avgBudgetByGenres/fantasyBudget"/></td>
                        <td><xsl:value-of select="moviesReport/summary/avgGainByGenres/fantasyGain"/></td>
                    </tr>
                    <tr>
                        <td>Sci-Fi</td>
                        <td><xsl:value-of select="moviesReport/summary/genres/sciFiCount"/></td>
                        <td><xsl:value-of select="moviesReport/summary/avgRatingByGenres/sciFiRating"/></td>
                        <td><xsl:value-of select="moviesReport/summary/avgBudgetByGenres/sciFiBudget"/></td>
                        <td><xsl:value-of select="moviesReport/summary/avgGainByGenres/sciFiGain"/></td>
                    </tr>
                    <tr>
                        <td>Dramat</td>
                        <td><xsl:value-of select="moviesReport/summary/genres/dramaCount"/></td>
                        <td><xsl:value-of select="moviesReport/summary/avgRatingByGenres/dramaRating"/></td>
                        <td><xsl:value-of select="moviesReport/summary/avgBudgetByGenres/dramaBudget"/></td>
                        <td><xsl:value-of select="moviesReport/summary/avgGainByGenres/dramaGain"/></td>
                    </tr>
                    <tr>
                        <td>Thiller</td>
                        <td><xsl:value-of select="moviesReport/summary/genres/thillerCount"/></td>
                        <td><xsl:value-of select="moviesReport/summary/avgRatingByGenres/thillerRating"/></td>
                        <td><xsl:value-of select="moviesReport/summary/avgBudgetByGenres/thillerBudget"/></td>
                        <td><xsl:value-of select="moviesReport/summary/avgGainByGenres/thillerGain"/></td>
                    </tr>
                    <tr>
                        <td>Historyczne</td>
                        <td><xsl:value-of select="moviesReport/summary/genres/historicalCount"/></td>
                        <td><xsl:value-of select="moviesReport/summary/avgRatingByGenres/historicalRating"/></td>
                        <td><xsl:value-of select="moviesReport/summary/avgBudgetByGenres/historicalBudget"/></td>
                        <td><xsl:value-of select="moviesReport/summary/avgGainByGenres/historicalGain"/></td>
                    </tr>
                    <tr>
                        <td>Komedie</td>
                        <td><xsl:value-of select="moviesReport/summary/genres/comedyCount"/></td>
                        <td><xsl:value-of select="moviesReport/summary/avgRatingByGenres/comedyRating"/></td>
                        <td><xsl:value-of select="moviesReport/summary/avgBudgetByGenres/comedyBudget"/></td>
                        <td><xsl:value-of select="moviesReport/summary/avgGainByGenres/comedyGain"/></td>
                    </tr>
                    <tr>
                        <td>Wojenne</td>
                        <td><xsl:value-of select="moviesReport/summary/genres/warCount"/></td>
                        <td><xsl:value-of select="moviesReport/summary/avgRatingByGenres/warRating"/></td>
                        <td><xsl:value-of select="moviesReport/summary/avgBudgetByGenres/warBudget"/></td>
                        <td><xsl:value-of select="moviesReport/summary/avgGainByGenres/warGain"/></td>
                    </tr>
                    <tr>
                        <td>Katastroficzny</td>
                        <td><xsl:value-of select="moviesReport/summary/genres/catastrophicCount"/></td>
                        <td><xsl:value-of select="moviesReport/summary/avgRatingByGenres/catastrophicRating"/></td>
                        <td><xsl:value-of select="moviesReport/summary/avgBudgetByGenres/catastrophicBudget"/></td>
                        <td><xsl:value-of select="moviesReport/summary/avgGainByGenres/catastrophicGain"/></td>
                    </tr>
                </table>
                <table>
                    <tr class="naglowek">
                        <th></th>
                        <th>Ilość<br/>gatunków</th>
                        <th>Średnia<br/>ocena</th>
                        <th>Średni<br/>budżet</th>
                        <th>Średni<br/>zysk</th>
                    </tr>
                    <tr class="podsumowanie">
                        <td>Podsumowanie</td>
                        <td><xsl:value-of select="moviesReport/summary/genresCount"/></td>
                        <td><xsl:value-of select="moviesReport/summary/averageRating"/></td>
                        <td><xsl:value-of select="moviesReport/summary/averageBudget"/></td>
                        <td><xsl:value-of select="moviesReport/summary/averageGain"/></td>
                    </tr>
                </table>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>