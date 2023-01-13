<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="risorse/style/catalogo.css">
    <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet'>
    <link rel="stylesheet" href="risorse/style/filtri.css">
    <link rel="stylesheet" href="risorse/style/regione.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />

    <title>Catalogo</title>
</head>

<%@ include file="header.jsp" %>

<div class="all">

    <div class="border" id="filtro">
        <form action="#" class="all-filter">
            <div class="dropdown">
                <input type="text" class="filterBox" placeholder="Ordina" readonly>
                <div class="option">
                    <div onclick="show('Crescente')">A-Z</div>
                    <div onclick="show('Decrescente')">Z-A</div>
                </div>
            </div>

            <div class="dropdown-reg">
                <input type="text" class="filterBox-reg" placeholder="Regioni" readonly>
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
                    <div onclick="showReg('Valle d Aosta')">Valle d'Aosta</div>
                    <div onclick="showReg('Veneto')">Veneto</div>
                </div>
            </div>

            <button class="submit">Cerca</button>
        </form>
    </div>

    <div class="nontavere" id="popup">
        <div class="scelta">
            <div class="all-regione">
                <form action="">
                    <div class="regione">
                        <div class="reg-card">
                            <div class="radio-group">
                                <img id="abruzzo" src="emilia.png">
                                <label class="radio">
                                    <input type="radio" value ="basilicata" name="abruzzo">
                                    <span class="checkmark"></span>
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="btn-select">
                        <button class="close"><i class="fa-solid fa-xmark" onclick="tornaCatalogo()"></i></button>
                        <button class="btn-regione">Aggiungi al carrello</button>
                    </div>
                </form>
            </div>
        </div>
    </div>


    <div class="container-card" id="catalogo">

        <div class="card">
            <div class="card-header">
                <img src="risorse/style/melo.jpg" alt="melo" />
            </div>
            <div class="card-body">
                <h3>Melo</h3>
                <p> Tra gli alberi da frutto coltivati è uno dei più diffusi.</p>
                <div class="card-status">
                    <p class="imp">CO2 causata: <span>Inserire</span></p>
                    <p class="imp">Prezzo: <span>Inserire</span></p>
                </div>
                <div class="btn_area">
                    <a href="http://" class="btn_primary">Visualizza prodotto</a><br><br>
                    <a  class="btn_secondary" onclick="showRegioniToSelect()">Adotta un albero</a>
                </div>
            </div>
        </div>


        <div class="card">
            <div class="card-header">
                <img src="risorse/style/melo.jpg" alt="melo" />
            </div>
            <div class="card-body">
                <h3>Melo</h3>
                <p> Tra gli alberi da frutto coltivati è uno dei più diffusi.</p>
                <div class="card-status">
                    <p class="imp">CO2 causata: <span>Inserire</span></p>
                    <p class="imp">Prezzo: <span>Inserire</span></p>
                </div>
                <div class="btn_area">
                    <a href="http://" class="btn_primary">Visualizza prodotto</a><br><br>
                    <a  class="btn_secondary" onclick="showRegioniToSelect()">Adotta un albero</a>
                </div>
            </div>
        </div>

        <div class="card">
            <div class="card-header">
                <img src="risorse/style/melo.jpg" alt="melo" />
            </div>
            <div class="card-body">
                <h3>Melo</h3>
                <p> Tra gli alberi da frutto coltivati è uno dei più diffusi.</p>
                <div class="card-status">
                    <p class="imp">CO2 causata: <span>Inserire</span></p>
                    <p class="imp">Prezzo: <span>Inserire</span></p>
                </div>
                <div class="btn_area">
                    <a href="http://" class="btn_primary">Visualizza prodotto</a><br><br>
                    <a  class="btn_secondary" onclick="showRegioniToSelect()">Adotta un albero</a>
                </div>
            </div>
        </div>

        <div class="card">
            <div class="card-header">
                <img src="risorse/style/melo.jpg" alt="melo" />
            </div>
            <div class="card-body">
                <h3>Melo</h3>
                <p> Tra gli alberi da frutto coltivati è uno dei più diffusi.</p>
                <div class="card-status">
                    <p class="imp">CO2 causata: <span>Inserire</span></p>
                    <p class="imp">Prezzo: <span>Inserire</span></p>
                </div>
                <div class="btn_area">
                    <a href="http://" class="btn_primary">Visualizza prodotto</a><br><br>
                    <a  class="btn_secondary" onclick="showRegioniToSelect()">Adotta un albero</a>
                </div>
            </div>
        </div>

        <div class="card">
            <div class="card-header">
                <img src="risorse/style/melo.jpg" alt="melo" />
            </div>
            <div class="card-body">
                <h3>Melo</h3>
                <p> Tra gli alberi da frutto coltivati è uno dei più diffusi.</p>
                <div class="card-status">
                    <p class="imp">CO2 causata: <span>Inserire</span></p>
                    <p class="imp">Prezzo: <span>Inserire</span></p>
                </div>
                <div class="btn_area">
                    <a href="http://" class="btn_primary">Visualizza prodotto</a><br><br>
                    <a  class="btn_secondary" onclick="showRegioniToSelect()">Adotta un albero</a>
                </div>
            </div>
        </div>

    </div>


</div>



<script src="risorse/js/filtri.js"></script>
<script>
    function showRegioniToSelect() {
        var mostra = document.getElementById("popup");
        mostra.style.display ="block";
        var filtro = document.getElementById("filtro");
        filtro.style.display ="none";
        var cat = document.getElementById("catalogo");
        cat.style.display="none"
    }

    function tornaCatalogo() {
        var cat = document.getElementById("catalogo");
        cat.style.display="grid";
        var filtro = document.getElementById("filtro");
        filtro.style.display ="grid";
        var mostra = document.getElementById("popup");
        mostra.style.display ="none";
    }
</script>

<%@ include file="footer.jsp" %>

</html>