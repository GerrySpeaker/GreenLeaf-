var page = document.getElementById("all-page");
var km = document.getElementById("km")
var plane = 0;
var bus = 0;
var car = 0;
var underground = 0;
var ship = 0;
var cruise = 0;
var scooter = 0;
var taxi = 0;
var tram = 0;
var train = 0;


function attiva(mezzo){
    if(mezzo.classList.contains("active")){

        console.log(mezzo.id);

        if(mezzo.id===document.getElementById("risorse\\img\\plane.png").id){
            var y =(+document.getElementById("qui").value) - plane;
            console.log("sono 1");
            document.getElementById("qui").value= y;
            mezzo.classList.remove("active");
        }
        else if(mezzo.id===document.getElementById("risorse\\img\\bus.png").id){
            console.log("sono 2");
            var y =(+document.getElementById("qui").value) - bus;
            document.getElementById("qui").value= y;
            mezzo.classList.remove("active");
        }
        else if(mezzo.id===document.getElementById("risorse\\img\\sports-car.png").id){
            var y =(+document.getElementById("qui").value) - car;
            document.getElementById("qui").value= y;
            mezzo.classList.remove("active");
            console.log("sono 3");

        }
        else if(mezzo.id===document.getElementById("risorse\\img\\underground.png").id){
            var y =(+document.getElementById("qui").value) - underground;
            document.getElementById("qui").value= y;
            console.log("sono 4");

            mezzo.classList.remove("active");
        }
        else if(mezzo.id===document.getElementById("risorse\\img\\ship.png").id){
            var y =(+document.getElementById("qui").value) - ship;
            document.getElementById("qui").value= y;
            console.log("sono 5");

            mezzo.classList.remove("active");
        }
        else if(mezzo.id===document.getElementById("risorse\\img\\cruise.png").id){
            var y =(+document.getElementById("qui").value) - cruise;
            document.getElementById("qui").value= y;
            console.log("sono 6");

            mezzo.classList.remove("active");
        }
        else if(mezzo.id===document.getElementById("risorse\\img\\scooter.png").id){
            var y =(+document.getElementById("qui").value) - scooter;
            document.getElementById("qui").value= y;
            console.log("sono 7");

            mezzo.classList.remove("active");
        }
        else if(mezzo.id===document.getElementById("risorse\\img\\taxi.png").id){
            var y =(+document.getElementById("qui").value) - taxi;
            document.getElementById("qui").value= y;
            console.log("sono 8");

            mezzo.classList.remove("active");
        }
        else if(mezzo.id===document.getElementById("risorse\\img\\tram.png").id){
            var y =(+document.getElementById("qui").value) - tram;
            document.getElementById("qui").value= y;
            mezzo.classList.remove("active");
            console.log("sono 9");

        }
        else if(mezzo.id===document.getElementById("risorse\\img\\train.png").id){
            var y =(+document.getElementById("qui").value) - train;
            document.getElementById("qui").value= y;
            mezzo.classList.remove("active");
            console.log("sono 10");

        }

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
        plane = calc;
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
        bus = calc;
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
        car = calc;
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
        underground = calc;
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
        ship = calc;
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
        cruise = calc;
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
        scooter = calc;
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
        taxi = calc;
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
        tram = calc;
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
        train = calc;
        page.style.display = "block";
        km.style.display = "none";
        document.getElementById('rangeValue').innerHTML = 0;
        document.getElementById("inputRange").value = 0;
    }
}



