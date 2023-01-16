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

function calcola(){
    console.log("ciao");
    var x = document.getElementById("add").src
    console.log(x);
    if (x.match("http://localhost:8080/GreenLeaf_war_exploded/risorse/img/plane.png")){
        var calc = 26 * document.getElementById("inputRange").value;
        var y =(+document.getElementById("qui").value) + calc;
        document.getElementById("qui").value= y;
        console.log(calc);
        page.style.display = "block";
        km.style.display = "none";
        document.getElementById('rangeValue').innerHTML = 0;
        document.getElementById("inputRange").value = 0;
    }

    else if(x.match("http://localhost:8080/GreenLeaf_war_exploded/risorse/img/bus.png")){
        var calc = 5200 * document.getElementById("inputRange").value;
        var y =(+document.getElementById("qui").value) + calc;
        document.getElementById("qui").value= y;
        console.log(calc);
        page.style.display = "block";
        km.style.display = "none";
        document.getElementById('rangeValue').innerHTML = 0;
        document.getElementById("inputRange").value = 0;
    }

    else if(x.match("http://localhost:8080/GreenLeaf_war_exploded/risorse/img/sports-car.png")){
        var calc = 2300 * document.getElementById("inputRange").value;
        var y =(+document.getElementById("qui").value) + calc;
        document.getElementById("qui").value= y;
        console.log(calc);
        page.style.display = "block";
        km.style.display = "none";
        document.getElementById('rangeValue').innerHTML = 0;
        document.getElementById("inputRange").value = 0;
    }

    else if(x.match("http://localhost:8080/GreenLeaf_war_exploded/risorse/img/underground.png")){
        var calc = 2 * document.getElementById("inputRange").value;
        var y =(+document.getElementById("qui").value) + calc;
        document.getElementById("qui").value= y;
        console.log(calc);
        page.style.display = "block";
        km.style.display = "none";
        document.getElementById('rangeValue').innerHTML = 0;
        document.getElementById("inputRange").value = 0;
    }

    else if(x.match("http://localhost:8080/GreenLeaf_war_exploded/risorse/img/ship.png")){
        var calc = 1000 * document.getElementById("inputRange").value;
        var y =(+document.getElementById("qui").value) + calc;
        document.getElementById("qui").value= y;
        console.log(calc);
        page.style.display = "block";
        km.style.display = "none";
        document.getElementById('rangeValue').innerHTML = 0;
        document.getElementById("inputRange").value = 0;
    }

    else if(x.match("http://localhost:8080/GreenLeaf_war_exploded/risorse/img/cruise.png")){
        var calc = 100000000 * document.getElementById("inputRange").value;
        var y =(+document.getElementById("qui").value) + calc;
        document.getElementById("qui").value= y;
        console.log(calc);
        page.style.display = "block";
        km.style.display = "none";
        document.getElementById('rangeValue').innerHTML = 0;
        document.getElementById("inputRange").value = 0;
    }

    else if(x.match("http://localhost:8080/GreenLeaf_war_exploded/risorse/img/scooter.png")){
        var calc = 72 * document.getElementById("inputRange").value;
        var y =(+document.getElementById("qui").value) + calc;
        document.getElementById("qui").value= y;
        console.log(calc);
        page.style.display = "block";
        km.style.display = "none";
        document.getElementById('rangeValue').innerHTML = 0;
        document.getElementById("inputRange").value = 0;
    }

    else if(x.match("http://localhost:8080/GreenLeaf_war_exploded/risorse/img/taxi.png")){
        var calc = 2200 * document.getElementById("inputRange").value;
        var y =(+document.getElementById("qui").value) + calc;
        document.getElementById("qui").value= y;
        console.log(calc);
        page.style.display = "block";
        km.style.display = "none";
        document.getElementById('rangeValue').innerHTML = 0;
        document.getElementById("inputRange").value = 0;
    }

    else if(x.match("http://localhost:8080/GreenLeaf_war_exploded/risorse/img/tram.png")){
        var calc = 1 * document.getElementById("inputRange").value;
        var y =(+document.getElementById("qui").value) + calc;
        document.getElementById("qui").value= y;
        console.log(calc);
        page.style.display = "block";
        km.style.display = "none";
        document.getElementById('rangeValue').innerHTML = 0;
        document.getElementById("inputRange").value = 0;
    }

     else if(x.match("http://localhost:8080/GreenLeaf_war_exploded/risorse/img/train.png")){
        var calc = 1 * document.getElementById("inputRange").value;
        var y =(+document.getElementById("qui").value) + calc;
        document.getElementById("qui").value= y;
        console.log(calc);
        page.style.display = "block";
        km.style.display = "none";
        document.getElementById('rangeValue').innerHTML = 0;
        document.getElementById("inputRange").value = 0;
    }
}

function mostraCalcolo(){

    document.getElementById("qui").style.display="block";
    document.getElementById("qui").innerHTML =document.getElementById("qui").value + " km";
}

