<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="shortcut icon" href="risorse/img/logo2_icon.png" />
    <title>Document</title>
    <link rel="stylesheet" href="risorse/style/piant.css">
</head>
<body>

<%@ include file="header.jsp" %>


<div class="container-plant">
    <div class="card">
        <div class="card__image-container">
            <img class="card__image" src="risorse/img/info1.jpg" alt="">
        </div>

        <svg class="card__svg" viewBox="0 0 800 500">

            <path d="M 0 100 Q 50 200 100 250 Q 250 400 350 300 C 400 250 550 150 650 300 Q 750 450 800 400 L 800 500 L 0 500" stroke="transparent" fill="#fff"/>
            <path class="card__line" d="M 0 100 Q 50 200 100 250 Q 250 400 350 300 C 400 250 550 150 650 300 Q 750 450 800 400" stroke="pink" stroke-width="3" fill="transparent"/>
        </svg>

        <div class="card__content">
            <h1 class="card__title">Preparare la buca</h1>
            <p>Il buco deve essere grande a sufficienza per ospitare le radici della pianta.
                In linea di massima, si consiglia un buco di 50 cm x 50 cm x 50 cm di profondita'.
                Sul fondo della buca si sparge una manciata di concime organico, che fornira'
                i nutrimenti utili alla pianta nelle prime delicate fasi di attecchimento.</p>
        </div>
    </div>

    <div class="card">
        <div class="card__image-container">
            <img class="card__image" src="risorse/img/info2.jpg" alt="">
        </div>

        <svg class="card__svg" viewBox="0 0 800 500">

            <path d="M 0 100 Q 50 200 100 250 Q 250 400 350 300 C 400 250 550 150 650 300 Q 750 450 800 400 L 800 500 L 0 500" stroke="transparent" fill="#fff"/>
            <path class="card__line" d="M 0 100 Q 50 200 100 250 Q 250 400 350 300 C 400 250 550 150 650 300 Q 750 450 800 400" stroke="pink" stroke-width="3" fill="transparent"/>
        </svg>

        <div class="card__content">
            <h1 class="card__title">Piantumazione</h1>
            <p>Posizionare quindi la pianta sul letto di terriccio creato e controllare che il colletto della pianta sia a livello del terreno.
                E' importante considerare che se il colletto e' superiore al livello del terreno la pianta rischia di morire per esposizione
                delle radici. Nel caso in cui il colletto e' inferiore al livello del terreno, la pianta presenta maggiori rischi di contrarre
                patologie poiché il colletto viene lesionato.</p>
        </div>
    </div>

    <div class="card">
        <div class="card__image-container">
            <img class="card__image" src="risorse/img/info3.jpg" alt="">
        </div>

        <svg class="card__svg" viewBox="0 0 800 500">

            <path d="M 0 100 Q 50 200 100 250 Q 250 400 350 300 C 400 250 550 150 650 300 Q 750 450 800 400 L 800 500 L 0 500" stroke="transparent" fill="#fff"/>
            <path class="card__line" d="M 0 100 Q 50 200 100 250 Q 250 400 350 300 C 400 250 550 150 650 300 Q 750 450 800 400" stroke="pink" stroke-width="3" fill="transparent"/>
        </svg>

        <div class="card__content">
            <h1 class="card__title">Conclusione</h1>
            <p>Dopo aver eseguito le operazioni prima indicate sara' necessario annaffiare bene l'area d'impianto.
                Un'irrigazione abbondantemente consente al concime precedentemente aggiunto alla buca
                di sciogliersi e apportare i nutrimenti necessari allo sviluppo della pianta.</p>
        </div>
    </div>
</div>



<%@ include file="footer.jsp" %>

</body>
</html>