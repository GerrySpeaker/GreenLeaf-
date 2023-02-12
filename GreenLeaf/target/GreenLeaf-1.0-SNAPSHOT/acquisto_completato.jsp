<%@ include file="header.jsp" %>
<%@ page language="java" import="java.util.*" import="bean.*" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="storage.OperatoreDao" %>
<%@ page import="storage.AdminDao" %>
<%@ page import="storage.BuonoRegaloDao" %>
<%
    String email = (String) request.getSession().getAttribute("email");
    OperatoreDao operatoreDao = new OperatoreDao();
    AdminDao adminDao = new AdminDao();

    if (email == null) {
        response.sendRedirect(request.getContextPath() + "/homepage.jsp");
        return;
    }

    if (operatoreDao.doRetrieveByEmail(email).getEmail() != null) {
        response.sendRedirect(request.getContextPath() + "/homepage.jsp");
        return;
    }
    if (adminDao.doRetrieveByEmail(email).getEmail() != null) {
        response.sendRedirect(request.getContextPath() + "/homepage.jsp");
        return;
    }

    BuonoRegaloDao dao = new BuonoRegaloDao();

    Boolean check = (Boolean) request.getSession().getAttribute("checkBuono");

    ArrayList<BuonoregaloBean> buoni = new ArrayList<>();

    if (check != false) {
        buoni = dao.buoniUtenteAcquistati(email);
    }


%>

<html>
<head>
    <meta charset="utf-8">
    <title>Acquisto</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
          integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet'>
    <link rel="stylesheet" href="risorse/style/acquisto.css">
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.2.1/css/fontawesome.min.css">

</head>
<body>
<div class="all-buy" id="all-buy">
    <div class="buy">
        <p class="big">Grazie per il tuo acquisto!</p>
        <p class="big">Puoi trovare i tuoi articoli nella sezione a te dedicata</p>

        <%if (buoni == null || buoni.size() == 0) {%>

        <%
        } else {
            int i = 0;
            while (i < buoni.size()) {
              int y=i;
        %>

        <div class="input-area"> <!-- ripetere da qui -->
            <input type="text" readonly value="<%=buoni.get(i).getIdBuonoregalo()%>" id="<%=y+1%>">
            <!-- creare una variabile i da incrementare a ogni ciclo di while da mettere come id -->
            <a class="copy" onclick="copy(<%=y+1%>)">Copia</a><!--e passarla anche a copy -->
        </div>
        <%
                    System.out.println(buoni.get(i));
                    i++;
                }
                for(int j=0; j<= buoni.size(); j++){
                    buoni.remove(j);
                }

            } %>

    </div>
</div>


</body>
</html>

<%@ include file="footer.jsp" %>

<script src="risorse/js/acquisto.js"></script>
