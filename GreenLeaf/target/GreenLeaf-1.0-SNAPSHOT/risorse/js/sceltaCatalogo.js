function showRegioniToSelect(obj) {
    document.getElementById("popup").style.display = "block";
    document.getElementById("cat").style.display="none";

    document.getElementById("categoria").value = obj.id;
    console.log( document.getElementById("categoria").value);
}


function tornaCatalogo() {
    var cat = document.getElementById("cat");
    cat.style.display="grid";
    var mostra = document.getElementById("popup");
    mostra.style.display ="none";

}

function showRegioniToSelectDettaglio(obj) {
    var mostra = document.getElementById("popup");
    mostra.style.display ="block";
    var filtro = document.getElementById("all");
    filtro.style.display ="none";

    console.log("sono qui dettaglio")

    if (obj.id.match("melo")){
        melo();
    }
    else if (obj.id.match("pero")){
        pero();
    }
    else if (obj.id.match("ciliegio")){
        ciliegio()
    }
    else if (obj.id.match("pino")){
        pero();
    }
    document.getElementById("categoria").value = obj.id;
    console.log( document.getElementById("categoria").value);
}


function tornaDettaglio() {
    var cat = document.getElementById("popup");
    cat.style.display ="none";
    var filtro = document.getElementById("all");
    filtro.style.display ="flex";
}