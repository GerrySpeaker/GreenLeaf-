<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="risorse/style/catalogo.css">
    <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet'>
    <link rel="stylesheet" href="risorse/style/regione.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <title>Catalogo</title>
</head>
<%@ page import="javax.servlet.*" import="bean.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="storage.*" %>
<%
    String email = (String) request.getSession().getAttribute("email");
    OperatoreDao operatoreDao = new OperatoreDao();
    AdminDao adminDao = new AdminDao();

    AdminBean adminBean = adminDao.doRetrieveByEmail(email);
    OperatoreBean operatoreBean = operatoreDao.doRetrieveByEmail(email);

    CategoriaDao dao = new CategoriaDao();
    ArrayList <CategoriaBean> article = (ArrayList<CategoriaBean>) dao.doRetrieveAll();
    if(article == null){
        response.sendRedirect(request.getContextPath()+"/home.jsp");
    }

    AssociatoDao daoAsso = new AssociatoDao();

    RegioneDao daoreg = new RegioneDao();


%>
<%@ include file="header.jsp" %>

<div class="nontavere" id="popup">
    <form action="AggiungiCarrello" method="post">
    <input id="categoria" name="categoria" style="display:none">
    <div class="scelta">
        <div class="all-regione">
            <!-- ripetere le regioni da qui -->

            <%
                ArrayList<AssociatoBean> associato = daoAsso.doRetrieveAlbero();
                Iterator<AssociatoBean> ass = associato.iterator();

                while(ass.hasNext()){
                        AssociatoBean association = ass.next();
                        RegioneBean prod = daoreg.doRetrieveByNome(association.getRegioneAssociato());

            %>
            <div class="regione" id="<%=prod.getNomeRegione()%>">
                <div class="reg-card">
                    <div class="radio-group">
                        <img src="<%= prod.getUrl() %>"><!-- inserire  la regione -->
                        <label class="radio">
                            <input type="radio" id="regione" value ="<%= prod.getNomeRegione() %>" name="scelta">
                            <span class="checkmark"></span>
                        </label>
                    </div>
                </div>
            </div>
            <% } %>
            <!-- a qui-->
        </div>

    </div>
    <button class="close" type="reset"><i class="fa-solid fa-xmark" onclick="tornaCatalogo()"></i></button>
    <button class="btn-regione" type="submit" >Aggiungi al carrello</button>
    </form>
</div>

<div class="all" id="cat">
    <div class="container-card">
        <% Iterator<CategoriaBean> prodotto = article.iterator();
            int i = 0;
            while(prodotto.hasNext()){
                CategoriaBean prod = prodotto.next();
                i++;
        %>
        <div class="card">      <!-- ripetere da -->
            <div class="card-header">
                <img src="<%= prod.getUrl()%>" alt="<%= prod.getNomeCategoria()%>" />
            </div>
            <div class="card-body">
                <h3><%= prod.getNomeCategoria()%></h3>
                <p> <%= prod.getDescrizione()%></p>
                <div class="card-status">
                    <p class="imp">CO2 Massima catturabile: <span><%= prod.getCo2Max()%></span></p>
                    <p class="imp">Prezzo: <span><%= prod.getPrezzo()%></span></p>
                </div>
                <div class="btn_area">
                    <a href="visualizzaAlbero.jsp?nome=<%= prod.getNomeCategoria()%>" class="btn_primary">Visualizza prodotto</a><br><br>
                    <% if(adminBean.getEmail() != null || operatoreBean.getEmail() != null){ %>

                    <%}else{%>
                    <a id="<%= prod.getNomeCategoria()%>" class="btn_secondary" onclick="showRegioniToSelect(this)" >Adotta un albero</a>
                    <%}%>
                </div>
            </div>
        </div>      <!-- a qui -->
        <% } %>

        <div class="card">
            <div class="card-header">
                <img src="risorse/img/buono.png" alt="buono" />
            </div>
            <div class="card-body">
                <h3>Buono regalo</h3>
                <p> Perche' non acquistare un buono regalo? Rendi il mondo piu' verde con un click e sorprendi una persona a te cara!</p>
                <div class="card-status">
                    <p class="imp">Prezzo: <span>50</span></p>
                </div>
                <div class="btn_area">
                    <a class="btn_secondary" href="AggiungiCarrello" >Aggiungi al carrello</a>
                </div>
            </div>
        </div>

    </div>

    <br>

</div>




<script src = "risorse/js/sceltaCatalogo.js"></script>
<script src="risorse/js/RiscattaBuono.js"></script>

<%@ include file="footer.jsp" %>

</html>