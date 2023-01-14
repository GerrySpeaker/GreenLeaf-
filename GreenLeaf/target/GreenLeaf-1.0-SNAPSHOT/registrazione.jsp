<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Registrazione</title>
    <link rel="stylesheet" href="risorse/style/registrazione.css" />
    <link rel="stylesheet" href="risorse/style/confermaIscrizione.css"/>
    <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet'> <!-- font -->

  </head>

  <%@ page language="java" import="java.util.*" import="bean.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  <%
    String email = (String) request.getSession().getAttribute("email");

    if(email != null)
    {
        response.sendRedirect(request.getContextPath()+"/home.jsp");
    }

  %>
  <div class="all-body" id="reg">
    <div class="all-form">
        <section class="container ">
            <header>Registrazione</header>
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
                  <%if(Boolean.parseBoolean(request.getParameter("error"))==true){%>
                  <p id="error" class="error">Email errata,riprova</p>
                  <%}else{ %>
                  <p id="error" class="error"></p>
                  <%} %>
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
              
              <div class="btn">
                <button class="submit">Procedi</button>
              </div>
            </form>
          </section>
    </div>



  </div>


  <div class="all-conf" id="privacy">
    <div class="conferma">
      <p>Acconsenti l'accesso a queste informazioni sensibili
        nel rispetto delle leggi sulla privacy, specificate dal d.l. 196/2003
        in materia di protezione dei dati personali.
      </p>

      <div class="btn-conf">
        <a onclick="hideConferma()" class="approva" onclick="">SI</a>
        <a href="homepage.jsp" class="approva">NO</a>
      </div>
    </div>
  </div>

  <script>
    var form = document.getElementById("reg");
    var conf = document.getElementById("privacy");

    function hideConferma(){
      form.style.display="flex";
      conf.style.display="none";
    }

  </script>
  <script src="risorse/js/validate.js"></script>
  <script src="risorse/js/password.js"></script>
</html>

