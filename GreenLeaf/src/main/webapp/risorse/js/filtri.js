function show(anything) {
    document.querySelector(".filterBox").value =anything;
}

let dropdown = document.querySelector(".dropdown");
dropdown.onclick = function () {
    dropdown.classList.toggle('active');
}

function showReg(anything) {
    document.querySelector(".filterBox-reg").value =anything;
}

let dropdown2 = document.querySelector(".dropdown-reg");
dropdown2.onclick = function () {
    dropdown2.classList.toggle('active');
}

function showArt(anything) {
    document.querySelector(".filterBox-art").value =anything;
}

let dropdown3 = document.querySelector(".dropdown-art");
dropdown3.onclick = function () {
    dropdown3.classList.toggle('active');
}