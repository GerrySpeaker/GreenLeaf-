<%--
  Created by IntelliJ IDEA.
  User: Michela
  Date: 26/01/2023
  Time: 15:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet'>
  <link rel="stylesheet" href="risorse/style/regione.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <title>Regione</title>
</head>

<div class="nontavere" id="popup">
  <form action="AggiungiCarrello" method="post">
    <input id="categoria" name="categoria" style="display:none" >
    <div class="scelta">
      <div class="all-regione">
        <!-- ripetere le regioni da qui -->


        <div class="regione" id="">
          <div class="reg-card">
            <div class="radio-group">
              <img src=""><!-- inserire  la regione -->
              <label class="radio">
                <input type="radio" id="regione" value ="" name="scelta">
                <span class="checkmark"></span>
              </label>
            </div>
          </div>
        </div>
        <!-- a qui-->
      </div>

    </div>
    <button class="close" type="reset"><i class="fa-solid fa-xmark" ></i></button>
    <button class="btn-regione" type="submit" >Aggiungi al carrello</button>
  </form>
</div>
