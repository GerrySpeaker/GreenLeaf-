function showRegioniToSelect(obj) {
    document.getElementById("popup").style.display = "block";
    document.getElementById("cat").style.display="none";

    console.log("sono qui")

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
        pino();
    }

    document.getElementById("categoria").value = obj.id;
    console.log( document.getElementById("categoria").value);
}

function ciliegio(){
    document.getElementById("Abruzzo").style.display="none";
    document.getElementById("Basilicata").style.display="none";
    document.getElementById("Calabria").style.display="none";
    document.getElementById("Campania").style.display="block";
    document.getElementById("Emilia Romagna").style.display="none";
    document.getElementById("Friuli Venezia Giulia").style.display="none";
    document.getElementById("Lazio").style.display="none";
    document.getElementById("Liguria").style.display="none";
    document.getElementById("Lombardia").style.display="none";
    document.getElementById("Marche").style.display="none";
    document.getElementById("Molise").style.display="none";
    document.getElementById("Piemonte").style.display="none";
    document.getElementById("Puglia").style.display="block";
    document.getElementById("Sardegna").style.display="none";
    document.getElementById("Sicilia").style.display="none";
    document.getElementById("Toscana").style.display="none";
    document.getElementById("Trentino Alto Adige").style.display="none";
    document.getElementById("Umbria").style.display="none";
    document.getElementById("Valle dAosta").style.display="none";
    document.getElementById("Veneto").style.display="block";
}

function melo(){
    document.getElementById("Abruzzo").style.display="none";
    document.getElementById("Basilicata").style.display="none";
    document.getElementById("Calabria").style.display="none";
    document.getElementById("Campania").style.display="none";
    document.getElementById("Emilia Romagna").style.display="block";
    document.getElementById("Friuli Venezia Giulia").style.display="none";
    document.getElementById("Lazio").style.display="none";
    document.getElementById("Liguria").style.display="none";
    document.getElementById("Lombardia").style.display="none";
    document.getElementById("Marche").style.display="none";
    document.getElementById("Molise").style.display="none";
    document.getElementById("Piemonte").style.display="block";
    document.getElementById("Puglia").style.display="none";
    document.getElementById("Sardegna").style.display="none";
    document.getElementById("Sicilia").style.display="none";
    document.getElementById("Toscana").style.display="none";
    document.getElementById("Trentino Alto Adige").style.display="block";
    document.getElementById("Umbria").style.display="none";
    document.getElementById("Valle dAosta").style.display="none";
    document.getElementById("Veneto").style.display="block";
}

function pero(){

    document.getElementById("Abruzzo").style.display="none";
    document.getElementById("Basilicata").style.display="none";
    document.getElementById("Calabria").style.display="none";
    document.getElementById("Campania").style.display="none";
    document.getElementById("Emilia Romagna").style.display="block";
    document.getElementById("Friuli Venezia Giulia").style.display="none";
    document.getElementById("Lazio").style.display="none";
    document.getElementById("Liguria").style.display="none";
    document.getElementById("Lombardia").style.display="block";
    document.getElementById("Marche").style.display="none";
    document.getElementById("Molise").style.display="none";
    document.getElementById("Piemonte").style.display="none";
    document.getElementById("Puglia").style.display="none";
    document.getElementById("Sardegna").style.display="none";
    document.getElementById("Sicilia").style.display="none";
    document.getElementById("Toscana").style.display="block";
    document.getElementById("Trentino Alto Adige").style.display="none";
    document.getElementById("Umbria").style.display="none";
    document.getElementById("Valle dAosta").style.display="none";
    document.getElementById("Veneto").style.display="block";
}

function pino(){
    document.getElementById("Abruzzo").style.display="none";
    document.getElementById("Basilicata").style.display="none";
    document.getElementById("Calabria").style.display="none";
    document.getElementById("Campania").style.display="block";
    document.getElementById("Emilia Romagna").style.display="none";
    document.getElementById("Friuli Venezia Giulia").style.display="none";
    document.getElementById("Lazio").style.display="block";
    document.getElementById("Liguria").style.display="none";
    document.getElementById("Lombardia").style.display="none";
    document.getElementById("Marche").style.display="none";
    document.getElementById("Molise").style.display="none";
    document.getElementById("Piemonte").style.display="none";
    document.getElementById("Puglia").style.display="none";
    document.getElementById("Sardegna").style.display="none";
    document.getElementById("Sicilia").style.display="none";
    document.getElementById("Toscana").style.display="none";
    document.getElementById("Trentino Alto Adige").style.display="block";
    document.getElementById("Umbria").style.display="none";
    document.getElementById("Valle dAosta").style.display="none";
    document.getElementById("Veneto").style.display="none";
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
}


function tornaDettaglio() {
    var cat = document.getElementById("popup");
    cat.style.display ="none";
    var filtro = document.getElementById("all");
    filtro.style.display ="flex";
}