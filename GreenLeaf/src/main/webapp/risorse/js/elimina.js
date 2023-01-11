function eliminaAccount(mail){
    $.ajax({ //GET categorie
        type: 'POST', //tipo POST, GET
        url: '/SnackMania/update', //metto la servlet
        data: {email : mail }, //metto i campi che devo mandare tramite la richiesta
        complete: function (response) {
            $.get('UtenteDao.eliminaAccount(mail)'),
                window.location.reload();
        }
    });
}