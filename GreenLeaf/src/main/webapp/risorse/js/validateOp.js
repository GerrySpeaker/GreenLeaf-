function validation_name(input){

    var pattern =  /^[A-Za-z]+$/;

    if(input.match(pattern)){
        return true;
    }
    else{
        return false;
    }
}

function validation_surname(input){

    var pattern =  /^[a-z ,.'-]+$/i;

    if(input.match(pattern)){
        return true;
    }
    else{
        return false;
    }
}

function validation_email(input){

    var pattern =  /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;

    if(input.match(pattern)){
        return true;
    }
    else{
        return false;
    }
}

function validation_password(input){

    var pattern = /^[A-Za-z]+$/;

    if(input.match(pattern)){
        return true;
    }
    else{
        return false
    }
}

function validate(obj){

    valid = true;

    var nome = document.getElementById("nome").value;
    var txt_nome = document.getElementById("txt-nome");

    if(validation_name(nome)){
        txt_nome.innerHTML ="Nome inserito correttamente";
        txt_nome.style.color = "#004700";
    }
    else{
        txt_nome.innerHTML ="ATTENZIONE: nome non valido";
        txt_nome.style.color = "#c80e00";
        valid = false;
    }


    var cognome = document.getElementById("cognome").value;
    var txt_cognome = document.getElementById("txt-cognome");

    if(validation_surname(cognome)){
        txt_cognome.innerHTML ="Cognome inserito correttamente";
        txt_cognome.style.color = "#004700";
    }
    else{
        txt_cognome.innerHTML ="ATTENZIONE: cognome non valido";
        txt_cognome.style.color = "#c80e00";
        valid = false;
    }


    var email = document.getElementById("email").value;
    var txt_em = document.getElementById("txt-email");

    if(validation_email(email)){
        txt_em.innerHTML ="Email valida";
        txt_em.style.color = "#004700";
    }
    else{
        txt_em.innerHTML ="Email non valida";
        txt_em.style.color = "#c80e00";
        valid = false;
    }


    var password = document.getElementById("password").value;
    var txt_p = document.getElementById("txt-password");

    if(validation_password(password)){
        txt_p.innerHTML ="Password corretta";
        txt_p.style.color = "#004700";
    }
    else{
        txt_p.innerHTML ="Password errata";
        txt_p.style.color = "#c80e00";
        valid = false;
    }

    return valid;
}