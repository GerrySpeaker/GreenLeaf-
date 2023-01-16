function showRegioniToSelect() {
    var mostra = document.getElementById("popup");
    mostra.style.display ="block";
    var filtro = document.getElementById("all");
    filtro.style.display ="none";
}

function tornaCatalogo() {
    var cat = document.getElementById("catalogo");
    cat.style.display="grid";
    var filtro = document.getElementById("all");
    filtro.style.display ="block";
}

function tornaCatalogo1() {
    var cat = document.getElementById("popup");
    cat.style.display ="none";
    var filtro = document.getElementById("all");
    filtro.style.display ="flex";
}