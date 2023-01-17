

function aggiorna(){
    var calcolo = +document.getElementById("prezzo").innerHTML;
    var valore =document.getElementById("quantity").value;
    for (var i =0; i<valore; i++){
        calcolo =calcolo+50;
    }
    console.log(document.getElementById("prezzo").innerHTML);
    document.getElementById("prezzo").innerHTML = calcolo;
}