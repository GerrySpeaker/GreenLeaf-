function eliminaAccount(mail){
    $.ajax({ //GET categorie
        type: 'GET', //tipo POST, GET
        url: '/Delete', //metto la servlet
        data: {email : mail }, //metto i campi che devo mandare tramite la richiesta
        complete: function (response) {
                alert("tutto ok");
                window.location.reload();
        }
    });
}