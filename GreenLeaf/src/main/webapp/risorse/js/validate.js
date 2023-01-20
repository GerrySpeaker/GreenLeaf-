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
        document.getElementById("txt-password").innerHTML="Password errata";
        return false
    }
}

function validate(obj){


    var nome = document.getElementById("nome").value;
    var cognome = document.getElementById("cognome").value;
    var email = document.getElementById("email").value;
    var password = document.getElementById("password").value;

    console.log(nome +" "+cognome+" "+email+" "+password);

    if(validation_name(nome) && validation_surname(cognome) && validation_email(email) && validation_password(password)){
        notifica();
        return true;
    }
    else {
        return false;
    }
}

var i =1;

function pronto(){
    if(i%2==0){
        document.getElementById("submit").style.display="none";
        i++;
    }
    else{
        alert("File di policy: https://www.privacypolicygenerator.info/live.php?token=qxKfYWrJeJkHOk72QjOCNdoGICfn3ggr");
        document.getElementById("submit").style.display="block";
        i++;
    }
}

function notifica(){
    document.getElementById("attivare").addEventListener("attivata");
}