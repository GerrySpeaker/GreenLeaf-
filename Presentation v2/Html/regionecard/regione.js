function select(img){

    var input = document.getElementById("abruzzoTxt");

    if(img.src.match(img.id+"-full.png")){
        img.src = img.id+".png";
        input.value = img.id;
    }
    else{
        img.src = img.id+"-full.png";
        input.value = "";
    }

}