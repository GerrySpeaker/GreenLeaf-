var x = document.getElementById("all-buy");
var y = document.getElementById("y");

function showBuono() {
    console.log("ci sono")
    x.style.display = "none";
    y.style.display = "flex";
}

function hideBuono() {
    console.log("ci sono 2")
    x.style.display = "flex";
    y.style.display = "none";
}

function copy(i) {
    var copyText = document.getElementById(i);

    copyText.select();
    copyText.setSelectionRange(0, 99999); // For mobile devices
    navigator.clipboard.writeText(copyText.value);

    alert("Ho copiato il seguente codice regalo: " + copyText.value);
}