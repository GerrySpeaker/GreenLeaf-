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
