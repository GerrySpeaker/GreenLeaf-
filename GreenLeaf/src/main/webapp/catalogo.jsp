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
<%
    System.out.println("Sono qui");
    CategoriaDao dao = new CategoriaDao();
    ArrayList <CategoriaBean> article = (ArrayList<CategoriaBean>) dao.doRetrieveAll();
    if(article == null){
        response.sendRedirect(request.getContextPath()+"/home.jsp");
    }

    System.out.println(article.toString());
%>
<%@ include file="header.jsp" %>

<div class="all">

    <div class="nontavere" id="popup">
        <div class="scelta">
            <div class="all-regione">
                <form action="">
                    <!-- ripetere le regioni da qui -->

                    <% Iterator<CategoriaBean> prodotto = article.iterator();
                        int i = 0;
                        while(prodotto.hasNext()){
                            CategoriaBean prod = prodotto.next();
                            i++;
                    %>
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
                    <% } %>
                    <!-- a qui-->
                    <div class="btn-select">
                        <button class="close"><i class="fa-solid fa-xmark" onclick="tornaCatalogo()"></i></button>
                        <button class="btn-regione">Aggiungi al carrello</button>
                    </div>
                </form>
            </div>
        </div>
    </div>


    <div class="container-card" id="catalogo">
        <% Iterator<CategoriaBean> prodotto = article.iterator();
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
                    <a id="<%= prod.getNomeCategoria()%>" class="btn_secondary" onclick="showRegioniToSelect(this)">Adotta un albero</a>
                </div>
            </div>
        </div>      <!-- a qui -->
        <% } %>



    </div>

    <br>

</div>



<script src="risorse/js/filtri.js"></script>
<script src = "risorse/js/sceltaCatalogo.js"></script>

<%@ include file="footer.jsp" %>

</html>