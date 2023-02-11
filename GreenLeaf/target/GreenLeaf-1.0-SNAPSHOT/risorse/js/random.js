
window.onload = function getCode(){

    var chars ="0123456789abcdefghijklmnopqrstuvwxtzABCDEFGHIJKLMNOPQRSTUVWTZ";
    var codeLenght = 8;
    var code = "";
    var btncopy = document.getElementById("btn-copy");

    for (var i=0;i<codeLenght; i++){
        var randomNumber = Math.floor(Math.random() * chars.length);
        code += chars.substring(randomNumber,randomNumber+1);
    }
    document.getElementById("code").value = code
    
    btncopy.style.display = "block";
}

function copy() {
    // Get the text field
    var copyText = document.getElementById("code");
  
    // Select the text field
    copyText.select();
    copyText.setSelectionRange(0, 99999); // For mobile devices
  
     // Copy the text inside the text field
    navigator.clipboard.writeText(copyText.value);
  
    // Alert the copied text
    alert("Ho copiato il seguente codice regalo: " + copyText.value);
  }
