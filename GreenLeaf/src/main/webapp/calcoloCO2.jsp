<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Calcolo CO2</title>
    <link rel="stylesheet" href="risorse/style/calcoloCO2.css">
    <link rel="stylesheet" href="risorse/style/range.css">
    <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<%@ page import="javax.servlet.*" import="bean.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="storage.TrasportiDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%
    System.out.println("Sono qui");
    TrasportiDao dao = new TrasportiDao();
    ArrayList <TrasportiBean> article = (ArrayList<TrasportiBean>) dao.doRetrieveAll();
    if(article == null){
        response.sendRedirect(request.getContextPath()+"/calcoloCO2.jsp");
    }

    System.out.println(article.toString());
%>
<%@ include file="header.jsp" %>


<div id="all-page">
    <div class="all-conf">
        <div class="box-calc">
            <div class="title">
                <h2>Scopri quanta CO2 hai emesso</h2>
            </div>
            
            <button onclick="filtro('Tutti')">Tutti</button>
            <button onclick="filtro('Terra')">Terra</button>
            <button onclick="filtro('Aria')">Aria</button>
            <button onclick="filtro('Mare')">Mare</button>
            
            <div class="mezzi"> <!--  -->
                <% Iterator<TrasportiBean> prodotto = article.iterator();
                    int i = 0;

                    while(prodotto.hasNext()){
                        TrasportiBean prod = prodotto.next();
                        i++;
                %>

                <div class="mezzo" id="<%=prod.getUrl()%>" onclick="attiva(this)"> <!--qui inserire il nome del mezzo-->
                    <img src="<%= prod.getUrl() %>" alt="">
                </div>
                <% } %>
    
            </div>
    
        </div>
    
    </div>
    
    <div class="domanda">
        <h2>Hai gi&agrave; scoperto quanta CO2 hai causato?</h2>
    </div>
    
    <div class="all-calc">
          <div class="calcolo">
            <div class="somma">
                <input type="button" id="qui" value="0" readonly>
                <p> kg</p>
            </div>

          </div>  
    </div>
</div>


<div class="all-range"id="km">
    <div class="big-box">
        <h2>Quanti km hai percorso?</h2>
        <div class="box">
            <input id="inputRange" type="range" class="range" value="0" min="0" max="1000"
            onmousemove="rangeSlider(this.value)">
            <span id="rangeValue">0</span>
        </div>

        <a class="go" onclick="calcola()">Vai al risultato</a> <!-- non vede calcola -->
        <div class="verde">
            <div class="scelto"> 
                <img id="add">
            </div>
            <button class="close"><i class="fa-solid fa-xmark" onclick="hide()"></i></button>
        </div>
    </div>
</div>

<%@ include file="footer.jsp" %>


<script src="risorse/js/calcoloCO2.js"></script>
</html>