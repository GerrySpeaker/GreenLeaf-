<%@ page language="java" import="java.util.*" import="bean.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="storage.AlberoDao" %>
<%@ page import="storage.OperatoreDao" %>
<%

    OperatoreDao dao=new OperatoreDao();
    String email = (String) request.getSession().getAttribute("email");

    ArrayList<OperatoreBean> article =(ArrayList<OperatoreBean>) dao.allOperatori(email);

%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Lista</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <link rel="stylesheet" href="risorse/style/lista.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet'>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.2.1/css/fontawesome.min.css">
        <script src="risorse/js/elimina.js"></script>

    </head>

    <%@ include file="header.jsp" %>
    <div class="all-list">
        <div class="list">
            <h3>Operatori da te creati</h3>
            <% Iterator<OperatoreBean> prodotto = article.iterator();
                int i = 0;
                while(prodotto.hasNext()){
                    OperatoreBean prod = prodotto.next();
                    i++;

            %>
            <div class="row"><!-- ripetere questo con un for da qui -->
                <div class="rank"><span><%= i %></span></div>
                <div class="operatore">
                    <h4><%= prod.getNomeOperatore()%></h4>
                    <p><%= prod.getRegione()%></p>
                    <a onclick="eliminaAccount('<%= prod.getEmail()%>')" class="remove"><i class="fa-solid fa-user-minus"></i></a>
                </div>

            </div><!-- a qui -->
            <% } %>

            
        </div>
    </div>

    <%@ include file="footer.jsp" %>
</html>