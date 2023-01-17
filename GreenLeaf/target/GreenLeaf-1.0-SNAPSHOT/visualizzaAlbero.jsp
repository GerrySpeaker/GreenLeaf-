<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dettaglio al prodotto</title>
    <link rel="stylesheet" href="risorse/style/prodotto.css">
    <link rel="stylesheet" href="risorse/style/regione.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet'>
</head>
<%@ page import="storage.CategoriaDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="bean.CategoriaBean" %>
<%@ page import="storage.RegioneDao" %>
<%@ page import="bean.RegioneBean" %>

<%
    System.out.println("Sono in visualizza albero");
    CategoriaDao dao = new CategoriaDao();
    String id =request.getParameter("nome");
    CategoriaBean article = dao.doRetrieveByKeyAlbero(id);
    if(article == null){
        response.sendRedirect(request.getContextPath()+"/home.jsp");
    }

    RegioneDao daoreg = new RegioneDao();
    ArrayList<RegioneBean> regione = (ArrayList<RegioneBean>) daoreg.doRetrieveAll();

    System.out.println(id);
    System.out.println(article.toString());
%>


<%@ include file="header.jsp" %>

<div class="nontavere" id="popup">
    <div class="scelta">
        <div class="all-regione">
            <!-- ripetere le regioni da qui -->

            <% Iterator<RegioneBean> reg = regione.iterator();
                while(reg.hasNext()){
                    RegioneBean prod = reg.next();

            %>
            <div class="regione" id="<%=prod.getNomeRegione()%>">
                <div class="reg-card">
                    <div class="radio-group">
                        <img src="<%= prod.getUrl() %>"><!-- inserire  la regione -->
                        <label class="radio">
                            <input type="radio" value ="<%= prod.getNomeRegione() %>">
                            <span class="checkmark"></span>
                        </label>
                    </div>
                </div>
            </div>
            <% } %>
            <!-- a qui-->
        </div>

    </div>
    <button class="close"><i class="fa-solid fa-xmark" onclick="tornaDettaglio()"></i></button>
    <button class="btn-regione">Aggiungi al carrello</button>
</div>

<div class="all-datail" id="all">
  <div class = "card-wrapper">
    <div class = "card">
      <!-- card left -->
      <div class = "product-imgs">
        <div class = "img-display">
          <div class = "img-showcase">
            <img src = "risorse/img/melo.jpg">
          </div>
        </div>
      </div>
      <!-- card right -->
      <div class = "product-content">
        <h2 class = "product-title"><%= article.getNomeCategoria()%></h2>
        <hr>
  
        <div class = "product-price">
          <p class = "last-price">Prezzo: <span><%= article.getPrezzo()%></span></p>
        </div>
  
        <div class = "product-detail">
          <h2>Descrizione: </h2>
            <p><%=article.getDescrizione()%></p>
          <p><span>Categoria</span>: <%= article.getNomeCategoria()%></p>
          <p><span>Co2</span>: <%= article.getCo2Max()%></p>
        </div>
  
        <div class = "purchase-info">
          <input type = "number" min = "0" value = "1">
          <a id ="<%= article.getNomeCategoria()%>" class = "btn" onclick="showRegioniToSelectDettaglio(this)">
            Aggiungi al carrello <i class = "fas fa-shopping-cart"></i>
          </a>
        </div>


      </div>
    </div>
  </div>
</div>




<script src = "risorse/js/sceltaCatalogo.js"></script>
<script src="risorse/js/prodotto.js"></script>


<%@ include file="footer.jsp" %>

</html>