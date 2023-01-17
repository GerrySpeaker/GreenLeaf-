

function aggiorna(x){
    var calcolo = 50;
    var valore =document.getElementById("quantity-"+x).value;
    calcolo = calcolo*valore;
    console.log(document.getElementById("prezzo-"+x).innerHTML);
    document.getElementById("prezzo-"+x).innerHTML = calcolo;
}

