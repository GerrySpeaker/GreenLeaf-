<!DOCTYPE html>
<html lang="en">
<%@ page language="java" import="java.util.*" import="bean.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Nuovo Operatore</title>
    <link rel="stylesheet" href="../style/registrazione.css" />
    <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet'> <!-- font -->

  </head>

  <%@ include file="nav.html"%>

  <body class="all-body">
    <div class="all-form">
        <section class="container">
            <header>Nuovo Operatore</header>
            <form action="#" class="form">
      
              <div class="input-box">
                <label>Nome</label> <span id="txt-nome"></span>
                <input id="nome" type="text" placeholder="Inserisci qui il tuo nome" onkeydown="validation_name()" required />
              </div>
      
              <div class="input-box">
                <label>Cognome</label> <span id="txt-cognome"></span>
                <input id="cognome" type="text" placeholder="Inserisci qui il tuo cognome" onkeydown="validation_surname()" required />
              </div>
      
              <div class="column">
                <div class="input-box">
                  <label>E-mail</label> <span id="txt-email"></span>
                  <input id="email" type="text" placeholder="Inserisci qui la tua e-mail" onkeydown="validation_email()" required />
                </div>
                <div class="input-box">
                  <label style="margin-left: 15px;">Password </label><label class="pass">(min 8: lettere e numeri)</label> <span id="txt-password"></span>
                  <input id="password" type="password" placeholder="Inserisci qui la tua password" onkeydown="validation_password()" required />
                  <div id="toggle" onclick="showHide()"></div>
                </div>
              </div>
              
              
              
              <div class="btn">
                <button class="submit">Crea</button>
              </div>
            </form>
          </section>
    </div>

    <%@ include file="footer.html"%>

    <script src="../js/validate.js"></script>
    <script src="../js/password.js"></script>
  </body>
</html>

