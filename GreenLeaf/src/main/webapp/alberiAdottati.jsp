<%@ page language="java" import="java.util.*" import="javax.servlet.*" import="bean.*"
         contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="storage.AlberoDao" %>
<%

    Boolean Utente = (Boolean) session.getAttribute("utente");
    if (Utente == null || Utente == false) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
    String path = request.getContextPath();
    AlberoDao dao = new AlberoDao();
    String mail = (String) request.getSession().getAttribute("email");
    ArrayList<AlberoBean> article = (ArrayList<AlberoBean>) dao.doRetrieveBymail(mail);

    System.out.println("sono in alberi adottati");


%>


<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Lista alberi</title>
    <link rel="stylesheet" href="risorse/style/lista.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
          integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet'>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.2.1/css/fontawesome.min.css">
    <script src="risorse/js/visualizzaAlbero.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>


<%@ include file="header.jsp" %>
<div class="all-list">
    <div class="list">
        <h3>Alberi Adottati</h3>
        <div class="testa">
            <p>Id</p>
            <p>Categoria</p>
            <p>Regione</p>
        </div>
        <% Iterator<AlberoBean> albero = article.iterator();
            int i = 0;
            while (albero.hasNext()) {
                AlberoBean prod = albero.next();
                i++;

        %>
        <div class="row"><!-- ripetere questo con un for da qui -->
            <div class="rank"><span><%= i %></span></div>
            <div class="operatore">
                <h4><%= prod.getIdAlbero() %>
                </h4>
                <p><%= prod.getCategoria() %>
                </p>
                <p><%= prod.getRegione() %>
                </p>
                <a href="AlberiAdottati?idAlbero=<%= prod.getIdAlbero()%>" class="remove"><i
                        class="fa-solid fa-circle-info"></i></a>
            </div>
        </div><!-- a qui -->
        <% } %>

    </div>
</div>
<%@ include file="footer.jsp" %>
</html>