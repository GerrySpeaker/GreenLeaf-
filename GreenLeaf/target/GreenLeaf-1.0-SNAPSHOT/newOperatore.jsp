<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta http-equiv="X-UA-Compatible" content="ie=edge" />
  <title>Registrazione Operatore</title>
  <link rel="stylesheet" href="risorse/style/registrazioneOp.css" />
  <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet'> <!-- font -->

</head>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="storage.AdminDao" %>
<%@ page import="bean.AdminBean" %>

<%

  Boolean Admin = (Boolean) session.getAttribute("adminRoles");
  if(Admin == null || Admin == false)
  {
    response.sendRedirect(request.getContextPath()+"/error.jsp");
    return;
  }


%>


<body class="all-body">
<div class="all-form">
  <section class="container">
    <header>Operatore</header>
    <%if(Boolean.parseBoolean(request.getParameter("errore"))==true){%>
        <p id="error" class="error">Email già registrata nel database</p>
    <%}else{ %>
       <p id="error" class="error"></p>
    <%} %>
    <form action="CreaOperatoreApplication" class="form" method="post" onsubmit="return validate(this)">

      <div class="input-box">
        <label>Nome</label> <span id="txt-nome"></span>
        <input id="nome" type="text" placeholder="Inserisci qui il nome"  required name="nome"/>
      </div>

      <div class="input-box">
        <label>Cognome</label> <span id="txt-cognome"></span>
        <input id="cognome" type="text" placeholder="Inserisci qui il cognome"  required name="cognome"/>
      </div>

      <div class="column">
        <div class="input-box">
          <label>E-mail</label> <span id="txt-email"></span>
          <input id="email" type="text" placeholder="Inserisci qui la tua e-mail" required name="email"/>
        </div>
        <div class="input-box">
          <label style="margin-left: 15px;">Password </label><span id="txt-password"></span>
          <input id="password" type="password" placeholder="Inserisci qui la tua password"  required name="password"/>
          <div id="toggle" onclick="showHide()"></div>
        </div>
      </div>

      <p id="txt-regione"></p>
      <div class="dropdown">
        <input type="text" class="filterBox" placeholder="Regioni" readonly name="regione" value="Regione" id="reg">
        <div class="option">
          <div onclick="show('Abruzzo')">Abruzzo</div>
          <div onclick="show('Basilicata')">Basilicata</div>
          <div onclick="show('Calabria')">Calabria</div>
          <div onclick="show('Campania')">Campania</div>
          <div onclick="show('Emilia Romagna')">Emilia Romagna</div>
          <div onclick="show('Friuli Venezia Giulia')">Friuli Venezia Giulia</div>
          <div onclick="show('Lazio')">Lazio</div>
          <div onclick="show('Liguria')">Liguria</div>
          <div onclick="show('Lombardia')">Lombardia</div>
          <div onclick="show('Marche')">Marche</div>
          <div onclick="show('Molise')">Molise</div>
          <div onclick="show('Piemonte')">Piemonte</div>
          <div onclick="show('Puglia')">Puglia</div>
          <div onclick="show('Sardegna')">Sardegna</div>
          <div onclick="show('Sicilia')">Sicilia</div>
          <div onclick="show('Toscana')">Toscana</div>
          <div onclick="show('Trentino Alto Adige')">Trentino Alto Adige</div>
          <div onclick="show('Umbria')">Umbria</div>
          <div onclick="show('Valle d&#8216 Aosta')">Valle d'Aosta</div>
          <div onclick="show('Veneto')">Veneto</div>
        </div>
      </div>

      <div class="btn">
        <button class="submit">Procedi</button>
      </div>
    </form>
  </section>
</div>

<script src="risorse/js/validateOp.js"></script>
<script src="risorse/js/password.js"></script>
<script >
  function show(anything) {
    var input =document.querySelector(".filterBox");
    input.value =anything;
  }

  let dropdown = document.querySelector(".dropdown");
  dropdown.onclick = function () {
    dropdown.classList.toggle('active');
  }
</script>
</body>
</html>

