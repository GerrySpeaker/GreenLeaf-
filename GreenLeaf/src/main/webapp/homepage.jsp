<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Homepage</title>
    <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet'>
    <link rel="stylesheet" href="risorse/style/homepage.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<%@ include file="header.jsp" %>


<div class="all-parallax">
    <section class="parallax">
        <h2 id="text-home" >Benvenuto su <br> Green Leaf</h2>
        <img src="risorse/img/monutain_01.png" id="m1">
        <img src="risorse/img/trees_02.png" id="t2">
        <img src="risorse/img/monutain_02.png" id="m2">
        <img src="risorse/img/trees_01.png" id="t1">
        <img src="risorse/img/man.png" id="man">
        <img src="risorse/img/plants.png" id="plants">
    </section>
    <section class="home-text1">
        <h2>Il nostro obiettivo</h2>
        <p>
            Green Leaf viene creato allo scopo di diminuire l'inquinamento attuale i cui livelli, al giorno d'oggi, sono molto elevati.
            L'obbiettivo principale è quello di sensibilizzare andando ad evidenziare come potrebbe cambiare la situazione attuale attraverso un piccolo contributo, ovvero adottando un albero.
            Green Leaf si rivolge a tutti gli utenti, operatori e admin che interagiscono con il sistema.
        </p>
    </section>
</div>
<div class="all-text2">
    <div class="cont">
        <div class="card">
            <div class="icon">
                <ion-icon name="cloud-outline"></ion-icon>
            </div>
            <div class="content">
                <h1>CO2</h1>
                <p>Scopri quanta CO2 causano i tuoi spostamenti!</p>
                <a href="calcoloCO2.jsp"> Calcola</a>
            </div>
        </div>
        <div class="card">
            <div class="icon">
                <ion-icon name="leaf-outline"></ion-icon>
            </div>
            <div class="content">
                <h1>Adotta</h1>
                <p>Albero dopo albero, rendi il mondo pi&ugrave verde con un click!</p>
                <a href="catalogo.jsp"> Inizia ora</a>
            </div>
        </div>
        <div class="card">
            <div class="icon">
                <ion-icon name="stats-chart-outline"></ion-icon>
            </div>
            <div class="content">
                <h1>Monitorraggio</h1>
                <p>Vuoi sapere quanto &egrave; inquinata la tua regione? Si? Sei nel posto giusto! </p>
                <a href="monitoraggio.jsp">Monitora</a>
            </div>
        </div>
    </div>
</div>








<script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
<script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.11.4/gsap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.11.4/ScrollTrigger.min.js"></script>
<script>
    gsap.from("#m1", {
        scrollTrigger : {
            scrub: true
        },
        y: 100,
    })
    gsap.from("#m2", {
        scrollTrigger : {
            scrub: true
        },
        y: 50,
    })
    gsap.from("#t2", {
        scrollTrigger : {
            scrub: true
        },
        x: -50,
    })
    gsap.from("#t1", {
        scrollTrigger : {
            scrub: true
        },
        x: 50,
    })
    gsap.from("#man", {
        scrollTrigger : {
            scrub: true
        },
        x: -250,
    })
    gsap.from("#plants", {
        scrollTrigger : {
            scrub: true
        },
        x: -50,
    })
    gsap.from("#text-home", {
        scrollTrigger : {
            scrub: true
        },
        x: 400,
    })
</script>

</html>

<%@ include file="footer.jsp" %>
