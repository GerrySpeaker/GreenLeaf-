<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dettaglio al prodotto</title>
    <link rel="stylesheet" href="risorse/style/prodotto.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet'>
</head>

<%@ include file="header.jsp" %>
<div class = "card-wrapper">
    <div class = "card">
      <!-- card left -->
      <div class = "product-imgs">
        <div class = "img-display">
          <div class = "img-showcase">
            <img src = "risorse/style/melo.jpg"><!-- inserire url categoria albero -->
          </div>
        </div>
      </div>
      <!-- card right -->
      <div class = "product-content">
        <h2 class = "product-title">#</h2><!-- id albero -->
        <hr>
  
        <div class = "product-price">
          <p class = "last-price">Prezzo: <span>$257.00</span></p><!-- Prezzo -->
        </div>

          <div class = "product-detail">
              <h2>Descrizione: </h2>
              <p> <span>Co2</span>   descrizione dal db</p>
              <p><span>Categoria</span>: inserire</p>
              <p><span>Co2</span>: inserire</p>
              <p><span>Stato</span>: inserire</p>
          </div>
  
        
      </div>
    </div>
  </div>

  <script src="prodotto.js"></script>
<%@ include file="footer.jsp" %>
</html>