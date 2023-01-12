var i = 1;

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