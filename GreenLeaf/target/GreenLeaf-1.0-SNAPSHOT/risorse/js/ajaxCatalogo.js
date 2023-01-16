function getCatalogo(filtro1,filtro2,filtro3){
    var xhttp = new XMLHttpRequest();
    console.log("f1 " + filtro1);
    console.log("f2 " + filtro2);
    console.log("f3 " + filtro3);
    xhttp.onreadystatechange = function() {

        if (this.readyState == 4 && this.status == 200) {
            if(xhttp.responseText!="empity"){
                var obj= JSON.parse(xhttp.responseText);
                var listaLibri=obj.newBook[0];
                console.log(listaLibri);



            }else{
                console.log("Lista vuota");
            }
        }
    };
    if(filtro1 === '' && filtro2 === '' && filtro3 === '')
    {
        xhttp.open("GET", "FiltriCatalogo", true);
    }
    //Scrivere i vari if con all'interno la openù
    if(!(filtro1 === '') && filtro2 === '' && filtro3 === '')
    {
        xhttp.open("GET", "FiltriCatalogo?ordine=" + filtro1, true);
    }
    xhttp.send();
}

function createElement(container,book){
    var img=document.createElement("img");
    img.src="data:image/jpg;base64,"+book.immagineBase64;
    img.alt=book.titolo;
    img.width="150";
    img.height="220";
    img.style.margin="15px 0px 15px 14%"
    var titolo=document.createElement("h1");
    if(book.titolo.length<=28)
        titolo.innerHTML=book.titolo;
    else
        titolo.innerHTML=book.titolo.substring(0, 25)+"...";
    titolo.style.color="white";
    titolo.style.fontSize="20px";
    titolo.style.width="150px"
    titolo.style.height="45px"
    titolo.style.margin="0px auto 30px auto";
    titolo.style.textAlign="center";
    titolo.style.overflow=" hidden";
    container.appendChild(img)
    container.appendChild(titolo);
}