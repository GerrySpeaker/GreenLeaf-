<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Registrazione</title>
    <link rel="stylesheet" href="risorse/style/checkbox.css">
    <link rel="stylesheet" href="risorse/style/registrazione.css" />
    <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet'> <!-- font -->
    <link rel="shortcut icon" href="risorse/img/logo2_icon.png" />

  </head>

  <%@ page language="java" import="java.util.*" import="bean.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  <%
    String email = (String) request.getSession().getAttribute("email");

    if(email != null)
    {
        response.sendRedirect(request.getContextPath()+"/homepage.jsp");
    }

  %>
  <div class="all-body" id="reg">
    <div class="all-form">
        <section class="container ">
            <header>Registrazione</header>

          <%if(Boolean.parseBoolean(request.getParameter("check"))==true){%>

          <p id="error" class="error" style="text-align: center" >Credenziali errate, riprovare</p>
          <%}else{ %>
          <p id="error" class="error"></p>
          <%} %>

          <%if(Boolean.parseBoolean(request.getParameter("data"))==true){%>

          <p id="error" class="error" style="text-align: center" >Data errata, riprovare</p>
          <%}else{ %>
          <p id="error" class="error"></p>
          <%} %>


            <form action="RegistrazioneApplication" class="form" method="post" onsubmit="return validate(this)">
      
              <div class="input-box">
                <label>Nome</label> <span id="txt-nome"></span>
                <input id="nome" type="text" placeholder="Inserisci qui il tuo nome"  required name = "nome" />
              </div>
      
              <div class="input-box">
                <label>Cognome</label> <span id="txt-cognome"></span>
                <input id="cognome" type="text" placeholder="Inserisci qui il tuo cognome"  required name ="cognome"/>
              </div>

              <div class="column">
                <div class="input-box">
                  <label>E-mail</label> <span id="txt-email"></span>
                  <input id="email" type="text" placeholder="Inserisci qui la tua e-mail" required name = "email"/>
                </div>

                <div class="input-box">
                  <label style="margin-left: 15px;">Password </label><span id="txt-password"></span>
                  <input id="password" type="password" placeholder="Inserisci qui la tua password"  required name = "password"/>
                  <div id="toggle" onclick="showHide()"></div>
                </div>
              </div>
              
              <div class="input-box">
                  <label id="data">Data di nascita</label>
                  <input type="date" required name = "data" />
                </div>

              <div style="margin-left: 50px; margin-top: 20px">
                <p>Accetti di condividere i tuoi dati personali?</p><!-- controlla che accetti e metti pdf -->
                <input id="conferma" class="confermato" type="checkbox" value="piantato" onclick="pronto()">
                <label for="conferma">Si</label>
              </div>

              <div class="btn"  id="submit" style="display: none">
                <button class="submit" onclick="notifica()">Procedi</button>
              </div>
            </form>
          </section>
    </div>



  </div>


  <script src="risorse/js/validate.js"></script>
  <script src="risorse/js/password.js"></script>
</html>

