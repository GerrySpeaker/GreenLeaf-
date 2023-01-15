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
        document.getElementById("add").src = "png/" + mezzo.id +".png";
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
