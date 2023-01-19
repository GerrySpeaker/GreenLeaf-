<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Monitoraggio</title>
    <link rel="stylesheet" href="risorse/style/monitoraggio.css">
    <link rel="stylesheet" href="risorse/style/filtri.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?libraries=places&key=AIzaSyB41DRUbKWJHPxaFjMAwdrzWzbVKartNGg"></script>
    
</head>

<%@ include file="header.jsp" %>


<div class="all-mon">
    <div class="border">
        <form action="#" class="all-filter">
            <div class="dropdown">
                <input type="text" class="filterBox" placeholder="Anno" readonly>
                <div class="option">
                    <div onclick="show('2023')">2023</div>
                    <div onclick="show('2024')">2024</div>
                    <div onclick="show('2025')">2025</div>
                    <div onclick="show('2026')">2026</div>
                </div>
            </div>
    
            <div class="dropdown-reg">
                <input type="text" class="filterBox-reg" placeholder="Regioni" readonly id="regione">
                <div class="option">
                    <div onclick="showReg('Abruzzo')">Abruzzo</div>
                    <div onclick="showReg('Basilicata')">Basilicata</div>
                    <div onclick="showReg('Calabria')">Calabria</div>
                    <div onclick="showReg('Campania')">Campania</div>
                    <div onclick="showReg('Emilia Romagna')">Emilia Romagna</div>
                    <div onclick="showReg('Friuli Venezia Giulia')">Friuli Venezia Giulia</div>
                    <div onclick="showReg('Lazio')">Lazio</div>
                    <div onclick="showReg('Liguria')">Liguria</div>
                    <div onclick="showReg('Lombardia')">Lombardia</div>
                    <div onclick="showReg('Marche')">Marche</div>
                    <div onclick="showReg('Molise')">Molise</div>
                    <div onclick="showReg('Piemonte')">Piemonte</div>
                    <div onclick="showReg('Puglia')">Puglia</div>
                    <div onclick="showReg('Sardegna')">Sardegna</div>
                    <div onclick="showReg('Sicilia')">Sicilia</div>
                    <div onclick="showReg('Toscana')">Toscana</div>
                    <div onclick="showReg('Trentino Alto Adige')">Trentino Alto Adige</div>
                    <div onclick="showReg('Umbria')">Umbria</div>
                    <div onclick="showReg('Valle dAosta')">Valle d'Aosta</div>
                    <div onclick="showReg('Veneto')">Veneto</div>
                    <div onclick="showReg('Nazionale')">Nazionale</div>
                </div>
            </div>
        
            <button class="submit" onclick="seleziona()">Cerca</button>
        </form>   
    </div>

    <div id="map"></div>
    <div class="monitor" id="monitor">
        <h3 id="selezionato"></h3>
        <div class="dati">
            <p>Percentuale inquinamento: </p> <span id="percentuale"></span>
            <p id="co2-p">CO2:</p><span id="co2"></span>
            <p id="polvere-p">Polveri sottili:</p><span id="polvere"></span>
        </div>
    </div>
    
    <script src="risorse/js/monitoraggio.js"></script>
    <script src="risorse/js/filtri.js"></script>
</div>
</html>
<%@ include file="footer.jsp" %>
