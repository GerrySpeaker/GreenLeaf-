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
        document.querySelectorAll("mezzo").display = "block";
    else if(obj.value.match("Terra")){
        document.getElementById("Aereo")
    }

}

