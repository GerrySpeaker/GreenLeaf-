var i = 1;

function conferma() {
    var btn = document.getElementById("forzare");

    if (i % 2 == 0) {
        btn.style.display = "none";
        i++;
    } else {
        btn.style.display = "block";
        i++;
    }
}

function showiot() {
    document.getElementById("albero").style.display = "none";
    document.getElementById("form").style.display = "flex";
}

function hideiot() {
    document.getElementById("albero").style.display = "block";
    document.getElementById("form").style.display = "none";
}