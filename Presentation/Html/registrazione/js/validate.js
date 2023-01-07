function validation_name(){
    var nome = document.getElementById("nome").value;
    var txt_nome = document.getElementById("txt-nome");
    var pattern =  /^[A-Za-z]+$/;

    if(nome.match(pattern)){
        txt_nome.innerHTML ="Nome inserito correttamente";
        txt_nome.style.color = "#004700";
    }
    else{
        txt_nome.innerHTML ="ATTENZIONE: nome non valido";
        txt_nome.style.color = "#c80e00";
    }
}

function validation_surname(){
    var cognome = document.getElementById("cognome").value;
    var txt_cognome = document.getElementById("txt-cognome");
    var pattern =  /^[a-z ,.'-]+$/i;

    if(cognome.match(pattern)){
        txt_cognome.innerHTML ="Cognome inserito correttamente";
        txt_cognome.style.color = "#004700";
    }
    else{
        txt_cognome.innerHTML ="ATTENZIONE: cognome non valido";
        txt_cognome.style.color = "#c80e00";
    }
}

function validation_email(){
    var email = document.getElementById("email").value;
    var txt_em = document.getElementById("txt-email");
    var pattern =  /^[^ ]+@[^ ]+\.[a-z]{2,3}$/;

    if(email.match(pattern)){
        txt_em.innerHTML ="Email valida";
        txt_em.style.color = "#004700";
    }
    else{
        txt_em.innerHTML ="Email non valida";
        txt_em.style.color = "#c80e00";
    }
}

function validation_password(){
    var password = document.getElementById("password").value;
    const toggle = document.getElementById("toggle");
    var txt_p = document.getElementById("txt-password");
    var pattern =  /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;

    if(password.match(pattern)){
        txt_p.innerHTML ="Password inserire correttamente";
        txt_p.style.color = "#004700";
        toggle.style.top ="62%"
    }
    else{
        txt_p.innerHTML ="Password errata";
        txt_p.style.color = "#c80e00";
        toggle.style.top ="62%"
    }
}