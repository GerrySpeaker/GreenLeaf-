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
    console.log(obj)
    if (obj.match("Tutti"))
        window.location.reload();
    else if(obj.match("Terra")){
        document.getElementById("risorse\\img\\plane.png").style.display = "none";
        document.getElementById("risorse\\img\\bus.png").style.display = "block";
        document.getElementById("risorse\\img\\sports-car.png").style.display = "block";
        document.getElementById("risorse\\img\\underground.png").style.display = "block";
        document.getElementById("risorse\\img\\ship.png").style.display = "none";
        document.getElementById("risorse\\img\\cruise.png").style.display = "none";
        document.getElementById("risorse\\img\\scooter.png").style.display = "block";
        document.getElementById("risorse\\img\\taxi.png").style.display = "block";
        document.getElementById("risorse\\img\\tram.png").style.display = "block";
        document.getElementById("risorse\\img\\train.png").style.display = "block";
    }
    else if(obj.match("Aria")){
        document.getElementById("risorse\\img\\plane.png").style.display = "block";
        document.getElementById("risorse\\img\\bus.png").style.display = "none";
        document.getElementById("risorse\\img\\sports-car.png").style.display = "none";
        document.getElementById("risorse\\img\\underground.png").style.display = "none";
        document.getElementById("risorse\\img\\ship.png").style.display = "none";
        document.getElementById("risorse\\img\\cruise.png").style.display = "none";
        document.getElementById("risorse\\img\\scooter.png").style.display = "none";
        document.getElementById("risorse\\img\\taxi.png").style.display = "none";
        document.getElementById("risorse\\img\\tram.png").style.display = "none";
        document.getElementById("risorse\\img\\train.png").style.display = "none";
    }

    else if(obj.match("Mare"))
    {
        document.getElementById("risorse\\img\\plane.png").style.display = "none";
        document.getElementById("risorse\\img\\bus.png").style.display = "none";
        document.getElementById("risorse\\img\\sports-car.png").style.display = "none";
        document.getElementById("risorse\\img\\underground.png").style.display = "none";
        document.getElementById("risorse\\img\\ship.png").style.display = "block";
        document.getElementById("risorse\\img\\cruise.png").style.display = "block";
        document.getElementById("risorse\\img\\scooter.png").style.display = "none";
        document.getElementById("risorse\\img\\taxi.png").style.display = "none";
        document.getElementById("risorse\\img\\tram.png").style.display = "none";
        document.getElementById("risorse\\img\\train.png").style.display = "none";
    }


}

function calcola(lista, co2){
    alert(lista)
    for (var i=0; i<lista.length; i++)
        if (lista[i].match(document.getElementById("add").src)){
            document.getElementById("qui").innerHTML =document.getElementById("qui")+ co2[i] * document.getElementById("inputRange").value;
            document.getElementById('rangeValue').innerHTML = 0;
            document.getElementById("inputRange").value = 0;
        }
}

