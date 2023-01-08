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

function validate(obj){

    valid = false;

    
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

    if(valid == true)
        obj.submit();
}