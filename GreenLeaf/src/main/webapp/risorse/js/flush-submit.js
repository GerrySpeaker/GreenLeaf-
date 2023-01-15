var i = 1;
var page = document.getElementById("page");
var iot = document.getElementById("iot");

function conferma(){
    var btn = document.getElementById("forzare");

    if(i%2 == 0){
        btn.style.display = "none";
        i++;
    }
    else{
        btn.style.display = "block";
        i++;
    }
}

function showiot(){
    page.style.display ="none";
    iot.style.display ="flex";
}

function hideiot(){
    page.style.display ="block";
    iot.style.display ="none";
}