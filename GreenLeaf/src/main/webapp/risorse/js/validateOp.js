function validation_name(input){

    var pattern =  /^[A-Za-z]+$/;

    if(input.match(pattern)){
        document.getElementById("txt-nome").innerHTML="";
        return true;
    }
    else{
        document.getElementById("txt-nome").innerHTML="Nome errato";
        return false;
    }
}

function validation_surname(input){

    var pattern =  /^[A-Za-z ,.']+$/i;

    if(input.match(pattern)){
        document.getElementById("txt-cognome").innerHTML="";
        return true;
    }
    else{
        document.getElementById("txt-cognome").innerHTML="Cognome errato";
        return false;
    }
}

function validation_email(input){

    var pattern =  /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;

    if(input.match(pattern)){
        document.getElementById("txt-email").innerHTML="";
        return true;
    }
    else{
        document.getElementById("txt-email").innerHTML="Email errata";
        return false;
    }
}

function validation_password(input){

    var pattern = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;

    if(input.match(pattern)){
        document.getElementById("txt-password").innerHTML="";
        return true;
    }
    else{
        document.getElementById("txt-password").innerHTML="Minimo 8 (lettere/numeri)";
        return false
    }
}

function validation_regione(input){

    console.log(input.value);
    reg=input.value;

    if(reg.match("Regione")){
        document.getElementById("txt-regione").innerHTML="ATTENZIONE: inserire la regione";
        return false;
    }
    else{
        document.getElementById("txt-password").innerHTML="";
        return true;
    }
}


function validate(obj){

    var nome = document.getElementById("nome").value;
    var cognome = document.getElementById("cognome").value;
    var email = document.getElementById("email").value;
    var password = document.getElementById("password").value;
    var regione = document.getElementById("reg")

    console.log(nome +" "+cognome+" "+email+" "+password);

    if(validation_name(nome) && validation_surname(cognome) && validation_email(email) && validation_password(password) && validation_regione(regione)){
        return true;
    }
    else {
        return false;
    }
}