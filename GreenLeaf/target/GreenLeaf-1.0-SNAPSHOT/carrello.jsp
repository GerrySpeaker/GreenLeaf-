<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Carrello</title>
    <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet'>
    <link rel="stylesheet" href="risorse/style/carrello.css">
</head>
<div class="all-carrello">
    <div class="wrapper">
        <h1>Il tuo carrello</h1>
        <div class="project">
            <div class="shop">

                <!-- ripetere da qua-->
                <div class="box">
                    <img src="risorse/img/ciliegio.jpg" alt="">
                    <div class="content">
                        <h3>Nome</h3>
                        <h5 id="prezzo-ciliegio">50.00</h5>
                        <p class="unit"><input class="quantity" id="quantity-ciliegio" type = "number" min = "1" value = "1"></p> <!--Il value va inserito quante ne ha chiesto-->
                        <p class="btn-area">
                            <a href="" class="btn-2">Rimuovi</a>
                        </p>
                        <p class="btn-area2">
                            <a class="btn-2" onclick="aggiorna('ciliegio')">Aggiorna</a>
                        </p>
                    </div>
                </div>
                <!-- a qua -->

                <div class="box">
                    <img src="risorse/img/melo.jpg" alt="">
                    <div class="content">
                        <h3>Nome</h3>
                        <h5 id="prezzo-melo">50.00</h5>
                        <p class="unit"><input class="quantity" id="quantity-melo" type = "number" min = "1" value = "1"></p> <!--Il value va inserito quante ne ha chiesto-->
                        <p class="btn-area">
                            <a href="" class="btn-2">Rimuovi</a>
                        </p>
                        <p class="btn-area2">
                            <a class="btn-2" onclick="aggiorna('melo')">Aggiorna</a>
                        </p>
                    </div>
                </div>

            </div>



            <div class="right-bar">
                <p>Prezzo <span id="prezzo">45</span></p> <!-- Metti il prezzo qui -->
                <input type="text" placeholder="Inserisci buono regalo">
                <a href="">Paipal</a>
                <a href="">Procedi all'acquisto</a>
            </div>
        </div>
    </div>
</div>

<script src="risorse/js/carrello.js"></script>
</html>