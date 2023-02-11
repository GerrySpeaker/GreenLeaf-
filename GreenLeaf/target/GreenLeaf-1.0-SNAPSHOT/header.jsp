<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Homepage</title>
    <link rel="stylesheet" href="risorse/style/header.css"> <!-- style -->
    <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet'> <!-- font -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@6.2.1/css/fontawesome.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <link rel="shortcut icon" href="risorse/img/logo2_icon.png" />

</head>
<body class>
    <header class="all-headerbody">
        <a href="homepage.jsp"><img src="risorse/img/logo2.png" alt="" class="logo"></a>   <!-- riscaricati il logo che è diverso -->
            <ul class="nav-menu">
                <li><a  href="homepage.jsp">Home</a></li>
                <li><a href="catalogo.jsp">Adotta</a></li>
                <li><a href="monitoraggio.jsp">Monitoraggio</a></li>
                <li><a href="calcoloCO2.jsp">Calcolo CO2</a></li>
            </ul>
            <div class="hamburger">
                <span class="bar"></span>
                <span class="bar"></span>
                <span class="bar"></span>
            </div>

            <div class="user">
                <a  href="login.jsp"><i class="fa-solid fa-user"></i></a> <!-- se non è loggato va al login -->
                <a  href="carrello.jsp"><i class="fa-solid fa-cart-shopping"></i></a>
            </div>
    </header>
    <script src="risorse/js/header.js"></script>
</body>
</html>