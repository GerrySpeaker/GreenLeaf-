function validation_email(){
    var form = document.getElementById("form");
    var email = document.getElementById("email").value;
    var text_em = document.getElementById("text-email");
    var pattern =  /^[^ ]+@[^ ]+\.[a-z]{2,3}$/;

    if(email.match(pattern)){
        text_em.innerHTML ="Email valida";
        text_em.style.color = "#004700";
    }
    else{
        text_em.innerHTML ="Email non valida";
        text_em.style.color = "#c80e00";
    }
}
