function select(img){

    var input = document.getElementById("Txt");

    if(img.src.match(img.id+"-full.png")){
        img.src = img.id+".png";
        input.value = img.id;
        return true;
    }
    else{
        img.src = img.id+"-full.png";
        input.value = "";
        return false;
    }

}