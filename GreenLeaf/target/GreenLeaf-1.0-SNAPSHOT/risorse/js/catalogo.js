function showRegioniToSelect() {
    var mostra = document.getElementById("popup");
    mostra.style.display ="block";
    var cat = document.getElementById("catalogo");
    cat.style.display="none"
}

function tornaCatalogo() {
    var cat = document.getElementById("catalogo");
    cat.style.display="grid"
    var mostra = document.getElementById("popup");
    mostra.style.display ="none";
}