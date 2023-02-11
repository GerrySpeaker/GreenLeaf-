<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Homepage</title>
    <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet'>
    <link rel="stylesheet" href="risorse/style/homepage.css">
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.2.1/css/fontawesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
          integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
</head>

<%@ include file="header.jsp" %>

<section id="banner">
    <div class="banner-text">
        <h1>Green Leaf</h1>
        <p>Leaf for World, Leaf for Life</p>
        <div class="banner-btn">
            <a href="catalogo.jsp"><span></span>Inizia ora</a>
        </div>
    </div>
</section>

<section id="feature">
    <div class="title-text">
        <p>I NOSTRI SERVIZI</p>
        <h1>Perch&egrave; scegliere noi?</h1>
    </div>
    <div class="feature-box">
        <div class="inner-box">
            <div class="card">
                <div class="imgBoxF">
                    <img src="risorse/img/img1.jpg">
                </div>
                <div class="content">
                    <div>
                        <h2> Adozione </h2>
                        <p>Albero dopo albero, rendi il mondo pi&ugrave verde con un click!</p>
                    </div>
                </div>
            </div>

            <div class="card">
                <div class="imgBoxF">
                    <img src="risorse/img/img2.jpg">
                </div>
                <div class="content">
                    <div>
                        <h2> Piantumazione </h2>
                        <p>Una volta scelto il tuo albero, i nostri operatori provvederanno a piantarlo</p>
                    </div>
                </div>
            </div>

            <div class="card">
                <div class="imgBoxF">
                    <img src="risorse/img/img3.jpg">
                </div>
                <div class="content">
                    <div>
                        <h2> Calcolo CO2 </h2>
                        <p>Scopri quanta CO2 causano i tuoi spostamenti</p>
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="imgBoxF">
                    <img src="risorse/img/img4.jpg">
                </div>
                <div class="content">
                    <div>
                        <h2> Monitoraggio inquinamento </h2>
                        <p>Vuoi sapere quanto &egrave; inquinata la tua regione? Si? Sei nel posto giusto!</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


<%@ include file="footer.jsp" %>
