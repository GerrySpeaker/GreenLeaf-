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
            <a class="home" onclick="showBuono()">Visualizza buoni</a>
            <a class="home" href="homepage.jsp">Torna all'homepage</a>
        </div>
    </div>
</div>


<div class="all-buy buono" id="y">
    <div class="buy">
        <p class="big">Buoni appena acquistati</p>
        <input type="text" readonly value="abcdefgh"> <!-- ripeti questo input quanti buoni ha-->


        <div class="btn-buy">
            <a class="home" onclick="hideBuono()">Chiudi</a>
        </div>
    </div>
</div>
</body>
</html>

<%@ include file="footer.jsp" %>

<script>
    var x = document.getElementById("all-buy");
    var y = document.getElementById("y");

    function showBuono(){
        console.log("ci sono")
        x.style.display="none";
        y.style.display="flex";
    }

    function hideBuono(){
        console.log("ci sono 2")
        x.style.display="flex";
        y.style.display="none";
    }
</script>
