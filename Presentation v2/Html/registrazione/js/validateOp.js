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
    
    var pattern =  /^[^ ]+@[^ ]+\.[a-z]{2,3}$/;

    if(input.match(pattern)){
        return true;
    }
    else{
        return false;
    }
}

function validation_password(input){
    
    var pattern =  /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;

    if(input.match(pattern)){
        return true;
    }
    else{
        return false
    }
}

function validation_regione(input){

    if(input.match("Abruzzo")|| input.match("Basilicata")||input.match("Calabria")||input.match("Campania")||
        input.match("Emilia Romagna")||input.match("Lazio")||input.match("Liguria")||input.match("Lombardia")||input.match("Marche")||
        input.match("Molise")||input.match("Piemonte")||input.match("Puglia")||input.match("Sardegna")||input.match("Sicilia")||input.match("Toscana")||input.match("Trentino Alto Adige")||
        input.match("Umbria")||input.match("Valle d Aosta")||input.match("Veneto")){
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

    var regione = document.getElementById("regione").value;
    var txt_reg = document.getElementById("txt-regione");

    if(validation_regione(regione)){
        txt_reg.innerHTML ="Regione inserita correttamente";
        txt_reg.style.color = "#004700";
    }
    else{
        txt_reg.innerHTML ="ATTENZIONE: questa non è una regione";
        txt_reg.style.color = "#c80e00";
        valid = false;
    }

    if(valid)
        obj.submit();
}