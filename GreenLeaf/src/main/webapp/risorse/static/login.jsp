<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="../style/login.css"> <!-- style -->
    <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet'> <!-- font -->
</head>

<%@ include file="nav.html"%>

<body class="all-body">
    <div class="all-form">
        <div class="form-container">
            <div class="drop">
                <div class="content">
                    <h2>Login</h2>
                    <form action="" id="form"> <!-- form effettivo -->
                        <div class="inputBox">
                            <input id="email" type="text" placeholder="E-mail">
                        </div>

                        <div class="inputBox">
                            <input id="password" type="password" placeholder="Password">
                            <div id="toggle" onclick="showHide()"></div>
                        </div>

                        <div class="inputBox">
                            <input type="submit" placeholder="Accedi">
                        </div>
                    </form>
                </div>
            </div>

            <a href="#" class="btns">Password dimenticata?</a> <!-- script -->
            <a href="#" class="btns signup">Registrati</a>

        </div>
    </div>

    <%@ include file="footer.html"%>


    <script src="js/email.js"></script>
    <script src="../js/password.js"></script>
</body>
</html>