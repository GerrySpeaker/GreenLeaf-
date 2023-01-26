<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>

<html>
<head>
    <meta charset="utf-8">
    <title>Acquisto</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet'>
    <link rel="stylesheet" href="risorse/style/acquisto.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.2.1/css/fontawesome.min.css">

</head>
<body>
<div class="all-buy" id="all-buy">
    <div class="buy">
        <p class="big">Grazie per il tuo acquisto!</p>
        <p class="big">Puoi trovare i tuoi articoli nella sezione a te dedicata</p>


        <div class="btn-buy">
            <a class="home" onclick="showBuono()">Riscatta buoni</a>
            <a class="home" href="homepage.jsp">Torna all'homepage</a>
        </div>
    </div>
</div>


<div class="all-buy buono" id="y">
    <div class="buy">
        <p class="big">Buoni appena acquistati</p>

        <div class="input-area"> <!-- ripetere da qui -->
            <input type="text" readonly value="abcdefgh" id="1"> <!-- creare una variabile i da incrementare a ogni ciclo di while da mettere come id -->
            <a class="copy" onclick="copy(1)">Copia</a><!--e passarla anche a copy -->
        </div> <!-- a qui -->

        <div class="input-area">
            <input type="text" readonly value="jhfsk">
            <a class="copy" onclick="copy()">Copia</a>
        </div>



        <div class="btn-buy">
            <a class="home" onclick="hideBuono()">Chiudi</a>
        </div>
    </div>
</div>
</body>
</html>

<%@ include file="footer.jsp" %>

<script src="risorse/js/acquisto.js"></script>
