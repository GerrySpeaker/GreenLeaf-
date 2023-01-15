<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Calcolo CO2</title>
    <link rel="stylesheet" href="risorse/style/calcoloCO2.css">
    <link rel="stylesheet" href="risorse/style/range.css">
    <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<%@ include file="header.jsp" %>


<div id="all-page">
    <div class="all-conf">
        <div class="box-calc">
            <div class="title">
                <h2>Scopri quanta CO2 hai emesso</h2>
            </div>
            
            <button>Tutti</button>
            <button>Terra</button>
            <button>Aria</button>
            <button>Mare</button>
            
            <div class="mezzi"> <!-- 5 mezzi max -->
    
                <div class="mezzo" id="plane" onclick="attiva(this)"> <!--qui inserire il nome del mezzo-->
                    <img src="png/plane.png" alt="">
                </div>
    
                <div class="mezzo" id="ship" onclick="attiva(this)"> <!--qui inserire il nome del mezzo-->
                    <img src="png/ship.png" alt="">
                </div>
    
                <div class="mezzo" id="" onclick="attiva(this)"> <!--qui inserire il nome del mezzo-->
                    <img src="png/plane.png" alt="">
                </div>
    
                <div class="mezzo" id="" onclick="attiva(this)"> <!--qui inserire il nome del mezzo-->
                    <img src="png/plane.png" alt="">
                </div>
    
                <div class="mezzo" id="" onclick="attiva(this)"> <!--qui inserire il nome del mezzo-->
                    <img src="png/plane.png" alt="">
                </div>
    
            </div>
    
            <div class="mezzi"> <!-- 5 mezzi max -->
    
                <div class="mezzo" id="" onclick="attiva(this)"> <!--qui inserire il nome del mezzo-->
                    <img src="png/plane.png" alt="" onclick="showKm(this)">
                </div>
    
                <div class="mezzo" id="" onclick="attiva(this)"> <!--qui inserire il nome del mezzo-->
                    <img src="png/plane.png" alt="">
                </div>
    
                <div class="mezzo" id="" onclick="attiva(this)"> <!--qui inserire il nome del mezzo-->
                    <img src="png/plane.png" alt="">
                </div>
    
                <div class="mezzo" id="" onclick="attiva(this)"> <!--qui inserire il nome del mezzo-->
                    <img src="png/plane.png" alt="">
                </div>
    
                <div class="mezzo" id="" onclick="attiva(this)"> <!--qui inserire il nome del mezzo-->
                    <img src="png/plane.png" alt="">
                </div>
    
            </div>
    
        </div>
    
    </div>
    
    <div class="domanda">
        <h2>Hai gia' scoperto quanta CO2 hai causato?</h2>
    </div>
    
    <div class="all-calc">
          <div class="calcolo">
            <div class="somma">
                <p>Numero KG</p>
            </div>
            <div class="avvia">
                <h2>procedi al calcolo</h2>
            </div>
          </div>  
    </div>
</div>


<div class="all-range"id="km">
    <div class="big-box">
        <h2>Quanti km hai percorso?</h2>
        <div class="box">
            <input id="inputRange" type="range" class="range" value="0" min="0" max="1000"
            onmousemove="rangeSlider(this.value)">
            <span id="rangeValue">0</span>
        </div>
        <a href="" class="go">Vai al risultato</a>
        <div class="verde">
            <div class="scelto"> 
                <img id="add">
            </div>
            <button class="close"><i class="fa-solid fa-xmark" onclick="hide()"></i></button>
        </div>
    </div>
</div>

<%@ include file="footer.jsp" %>


<script src="risorse/js/calcoloCO2.js"></script>
</html>