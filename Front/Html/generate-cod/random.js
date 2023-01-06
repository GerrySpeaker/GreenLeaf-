
function getCode(){

    var chars ="0123456789abcdefghijklmnopqrstuvwxtzABCDEFGHIJKLMNOPQRSTUVWTZ";
    var codeLenght = 16;
    var code = "";

    for (var i=0;i<codeLenght; i++){
        var randomNumber = Math.floor(Math.random() * chars.length);
        code += chars.substring(randomNumber,randomNumber+1);
    }
    document.getElementById("code").value = code
}
