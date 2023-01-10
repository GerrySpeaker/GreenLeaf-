<!DOCTYPE html>
<html>
    <head>
        <title>404 Page Error</title>
        <link rel="stylesheet" href="risorse/style/error.css">
    </head>
    <body>
        <div id="container">
            <div class="content">
                <h2>404</h2>
                <h4>Page not found</h4>
                <p>La pagina che stai cercando non esiste.</p>
                <a href="#">Back To Home</a>
            </div>
        </div>
        <script type="text/javascript">
            var container = document.getElementById('container');
            window.onmousemove=function(e){
                var x = e.clientX;
                var y = e.clientX;
                container.error.backgroundPositionX = x + 'px';
                container.error.backgroundPositionY = x + 'px';
            }
        </script>
    </body>
</html>