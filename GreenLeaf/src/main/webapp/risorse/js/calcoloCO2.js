var page = document.getElementById("all-page");
var km = document.getElementById("km")


function attiva(mezzo){
    if(mezzo.classList.contains("active")){
        mezzo.classList.remove("active");
    }
    else{
        mezzo.classList.add("active");
        page.style.display = "none";
        km.style.display = "flex";
        document.getElementById("add").src =  mezzo.id ;
    }
}

function hide(){
    page.style.display = "block";
    km.style.display = "none";
    document.getElementById('rangeValue').innerHTML = 0;
    document.getElementById("inputRange").value = 0;
}

function rangeSlider(value){
    document.getElementById('rangeValue').innerHTML = value
}

function filtro(obj){
    if (obj.value.match("Tutti"))
        window.location.reload();
    else if(obj.value.match("Terra")){
        window.location.reload();
        document.getElementById("Aereo").style.display = "none";
        document.getElementById("Nave").style.display = "none";
        document.getElementById("Nave da crocera").style.display = "none";
    }
    else if(obj.value.match("Aria")){
        window.location.reload();
        document.getElementById("Aereo").style.display = "none";
        document.getElementById("Nave").style.display = "none";
        document.getElementById("Nave da crocera").style.display = "none";
        document.getElementById("Aereo").style.display = "none";
        document.getElementById("Nave").style.display = "none";
        document.getElementById("Nave da crocera").style.display = "none";
    }

}

