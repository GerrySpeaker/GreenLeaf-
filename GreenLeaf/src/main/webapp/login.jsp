<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="risorse/style/login.css"> <!-- style -->
    <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet'> <!-- font -->
</head>
<body class="all-body">
    <div class="all-form">
        <div class="form-container">
            <div class="drop">
                <div class="content">
                    <h2>Login</h2>
                    <form action="AutenticazioneApplication" id="form" onsubmit="return validate(this)"> <!-- form effettivo -->
                        <span id="txt-email"></span>
                        <div class="inputBox">
                            <input id="email" type="text" placeholder="E-mail" required name ="email">
                        </div>

                        <span id="txt-password"></span>
                        <div class="inputBox">
                            <input id="password" type="password" placeholder="Password" required name = "password">
                            <div id="toggle" onclick="showHide()"></div>
                        </div>

                        <div class="inputBox">
                            <input type="submit" placeholder="Accedi">
                        </div>
                    </form>
                </div>
            </div>

            <a href="registrazione.jsp" class="btns">Registrati</a> <!-- script -->

        </div>
    </div>

    <script src="risorse/js/password.js"></script>
    <script src="risorse/js/validate_login.js"></script>
</body>
</html>