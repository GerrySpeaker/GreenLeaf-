<!DOCTYPE html>
<html>
    <head>
        <title>Random Codice Regalo Generator</title>
        <link rel="stylesheet" href="risorse/style/random.css">
        <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet'>

    </head>

    <%@ include file="header.jsp" %>


    <div class="all-generate" onload="getCode()">
        <div class="inputBox">
            <h2>Codice regalo </h2>
            <input type="text" nama= "" placeholder="" id="code" readonly="">
            <div id="btn-copy" onclick="copy();">Copia</div>
        </div>
             <script src="risorse/js/random.js"></script>
    </div>
</html>

<%@ include file="footer.jsp" %>

