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
<%@ page import="javax.servlet.*" import="bean.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="storage.CategoriaDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %>
<%
    CategoriaDao dao = new CategoriaDao();
    ServletContext cxt = request.getServletContext();
    ArrayList<CategoriaBean> article = (ArrayList<CategoriaBean>) dao.doRetrieveAll();


    article = (ArrayList<CategoriaBean>) cxt.getAttribute("decrescente");
    ArrayList<String> ordRegione = (ArrayList<String>) cxt.getAttribute("ordRegione");
    if(article == null && ordRegione == null){
        article = (ArrayList<CategoriaBean>) dao.doRetrieveAll();
    }
    if(article != null && ordRegione == null){
        article = (ArrayList<CategoriaBean>) cxt.getAttribute("decrescente");
    }

    if(ordRegione != null && article == null){
        ordRegione = (ArrayList<String>) cxt.getAttribute("ordRegione");
    }


%>
<%@ include file="header.jsp" %>

<div class="all">

    <div class="border" id="filtro">
        <form action="FiltriCatalogo" class="all-filter">
            <div class="dropdown"><!-- non toccare -->
                <input type="text" class="filterBox" placeholder="Ordina" readonly name="ordine">
                <div class="option">
                    <div onclick="show('Crescente')">A-Z</div>
                    <div onclick="show('Decrescente')">Z-A</div>
                </div>
            </div>

            <div class="dropdown-art"><!-- non toccare -->
                <input type="text" class="filterBox-art" placeholder="Articoli" readonly name="articoli">
                <div class="option">
                    <div onclick="showArt('Alberi')">Alberi</div>
                    <div onclick="showArt('Buoni')">Buoni</div>
                    <div onclick="showArt('Tutti')">Tutti</div>
                </div>
            </div>

            <div class="dropdown-reg"><!-- non toccare -->
                <input type="text" class="filterBox-reg" placeholder="Regioni" readonly name="regione">
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
                    <div onclick="showReg('Valle d&#8216; Aosta')">Valle d'Aosta</div>
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
                    <!-- ripetere le regioni da qui -->
                    <div class="regione">
                        <div class="reg-card">
                            <div class="radio-group">
                                <img src=""><!-- inserire  la regione -->
                                <label class="radio">
                                    <input type="radio" value ="" name=""><!-- inserire al name e a value la regione -->
                                    <span class="checkmark"></span>
                                </label>
                            </div>
                        </div>
                    </div>

                    <!-- a qui-->
                    <div class="btn-select">
                        <button class="close"><i class="fa-solid fa-xmark" onclick="tornaCatalogo()"></i></button>
                        <button class="btn-regione">Aggiungi al carrello</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <%
        if(article != null){

    %>
    <div class="container-card" id="catalogo">
        <%
            Iterator<CategoriaBean> prodotto = article.iterator();
            int i = 0;
            while(prodotto.hasNext()){
                CategoriaBean prod = prodotto.next();
                i++;
        %>
        <div class="card">      <!-- ripetere da -->
            <div class="card-header">
                <img src="<%= prod.getUrl()%>" alt="melo" />
            </div>
            <div class="card-body">
                <h3><%= prod.getNomeCategoria()%></h3>
                <p> <%= prod.getDescrizione()%></p>
                <div class="card-status">
                    <p class="imp">CO2 Massima catturabile: <span><%= prod.getCo2Max()%></span></p>
                    <p class="imp">Prezzo: <span><%= prod.getPrezzo()%></span></p>
                </div>
                <div class="btn_area">
                    <a href="visualizzaAlbero.jsp" class="btn_primary">Visualizza prodotto</a><br><br>
                    <a  class="btn_secondary" onclick="showRegioniToSelect()">Adotta un albero</a>
                </div>
            </div>
        </div>      <!-- a qui -->
        <% } //chiudo il wile%>
        <% }
            else{ //allora stampo in base alla regione

        %>
        <div class="container-card" id="catalogo">
            <%
                int i = 0;
                while(i < ordRegione.size()){
            %>
            <div class="card">      <!-- ripetere da -->
                <div class="card-header">
                    <img src="<%= ordRegione.get(i)%>" alt="melo" />
                </div>
                <div class="card-body">
                    <h3><%= ordRegione.get(i+1)%></h3>
                    <p> <%= ordRegione.get(i+1)%></p>
                    <div class="card-status">
                        <p class="imp">CO2 Massima catturabile: <span><%= ordRegione.get(i+1)%></span></p>
                        <p class="imp">Prezzo: <span><%= ordRegione.get(i+1)%></span></p>
                    </div>
                    <div class="btn_area">
                        <a href="visualizzaAlbero.jsp" class="btn_primary">Visualizza prodotto</a><br><br>
                        <a  class="btn_secondary" onclick="showRegioniToSelect()">Adotta un albero</a>
                    </div>
                </div>
            </div>      <!-- a qui -->
            <% } //chiudo il wile%>
            <% } //chiudo l'if%>


    </div>

</div>



<script src="risorse/js/filtri.js"></script>
<script src = "risorse/js/sceltaCatalogo.js"></script>

<%@ include file="footer.jsp" %>

</html>