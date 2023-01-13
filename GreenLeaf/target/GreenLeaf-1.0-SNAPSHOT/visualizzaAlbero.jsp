<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dettaglio al prodotto</title>
    <link rel="stylesheet" href="risorse/style/prodotto.css">
    <link rel="stylesheet" href="risorse/style/regione.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet'>
</head>

<%@ include file="header.jsp" %>

<div class="all-datail" id="all">
  <div class = "card-wrapper">
    <div class = "card">
      <!-- card left -->
      <div class = "product-imgs">
        <div class = "img-display">
          <div class = "img-showcase">
            <img src = "risorse/style/melo.jpg">
          </div>
        </div>
      </div>
      <!-- card right -->
      <div class = "product-content">
        <h2 class = "product-title"># Codice</h2>
        <hr>
  
        <div class = "product-price">
          <p class = "last-price">Prezzo: <span>$257.00</span></p>
        </div>
  
        <div class = "product-detail">
          <h2>Descrizione: </h2>
          <p> <span>Co2</span>   descrizione dal db</p>
          <p><span>Categoria</span>: inserire</p>
          <p><span>Co2</span>: inserire</p>
          <p><span>Stato</span>: inserire</p>
        </div>
  
        <div class = "purchase-info">
          <input type = "number" min = "0" value = "1">
          <a class = "btn" onclick="showRegioniToSelect()">
            Aggiungi al carrello <i class = "fas fa-shopping-cart"></i>
          </a>
        </div>
  
        
      </div>
    </div>
  </div>
</div>

<div class="nontavere" id="popup">
  <div class="scelta">
      <div class="all-regione">
          <form action="">
              <div class="regione">
                  <div class="reg-card">
                      <div class="radio-group">
                          <img id="abruzzo" src="emilia.png">
                          <label class="radio">
                              <input type="radio" value ="basilicata" name="abruzzo">
                              <span class="checkmark"></span>
                          </label>
                      </div>
                  </div>
              </div>
              <div class="btn-select">
                  <button class="close"><i class="fa-solid fa-xmark" onclick="tornaCatalogo()"></i></button>
                  <button class="btn-regione">Aggiungi al carrello</button>
              </div>
          </form>
      </div>
  </div>
</div>


<script src = "risorse/js/sceltaDettaglio.js"></script>
<script src="risorse/js/prodotto.js"></script>


<%@ include file="footer.jsp" %>

</html>