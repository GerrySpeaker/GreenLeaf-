<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dettaglio al prodotto UTENTE</title>
    <link rel="stylesheet" href="risorse/style/prodotto.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet'>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?libraries=places&key=AIzaSyB41DRUbKWJHPxaFjMAwdrzWzbVKartNGg"></script>
</head>
<%@ page import="javax.servlet.*" import="bean.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="storage.CategoriaDao" %>
<%@ page import="storage.IotDao" %>
<%
    System.out.println("sono in visualizza albero adottato");
    ServletContext cxt = request.getServletContext();
    AlberoBean article =(AlberoBean) cxt.getAttribute("albero");
    if(article == null){
        response.sendRedirect(request.getContextPath()+"/alberiAdottati.jsp");
    }

    System.out.println(article.toString());
    CategoriaDao cdao = new CategoriaDao();

    CategoriaBean cbean = cdao.doRetrieveByKeyAlbero(article.getCategoria());

    System.out.println(cbean.toString());

    IotDao iotDao = new IotDao();
    IotBean iot = iotDao.doRetriveByKey(article.getIot());


%>

<%@ include file="header.jsp" %>

<div class="all-datail">
    <div class = "card-wrapper">
        <div class = "card">
            <!-- card left -->
            <div class = "product-imgs">
                <div class = "img-display">
                    <div class = "img-showcase">
                        <img src = "<%= cbean.getUrl()%>"><!-- inserire url categoria albero -->
                    </div>
                </div>
            </div>
            <!-- card right -->
            <div class = "product-content">
                <h2 class = "product-title"><%= article.getIdAlbero()%></h2><!-- id albero -->
                <hr>

                <div class = "product-price">
                    <p class = "last-price">Prezzo: <span><%= cbean.getPrezzo()%></span></p><!-- Prezzo -->
                </div>

                <div class = "product-detail">
                    <h2>Descrizione: </h2>
                    <p> <%= cbean.getDescrizione()%></p>
                    <p><span>Categoria</span>: <%= cbean.getNomeCategoria()%></p>
                    <p><span>Co2</span>: <%= article.getCo2()%></p>
                    <p><span>Stato</span>: <%= article.getStato()%></p>
                </div>

                <div id="map"></div>

            </div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function(){
        var pos = {lat: <%=iot.getLatitudine()%>, lng: <%=iot.getLongitudine()%>};<!-- inserire le coordinate iot-->
        var map = new google.maps.Map(document.getElementById('map'),{
            zoom:10,
            center: pos

        });
        var marker = new google.maps.Marker({
            position: {lat: <%=iot.getLatitudine()%>, lng: <%=iot.getLongitudine()%>},<!-- inserire le coordinate iot-->
            map: map,
            title: 'Aquila'
        });
    });

</script>

<%@ include file="footer.jsp" %>
</html>