<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Registrazione</title>
    <link rel="stylesheet" href="risorse/style/registrazione.css" />
    <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet'> <!-- font -->

  </head>
  <body class="all-body">
    <div class="all-form">
        <section class="container">
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

    <script src="risorse/js/validate.js"></script>
    <script src="risorse/js/password.js"></script>
  </body>
</html>

