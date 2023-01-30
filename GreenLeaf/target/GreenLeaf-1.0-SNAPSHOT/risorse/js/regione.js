function regione(id){
    $.ajax({ //GET categorie
        type: 'GET', //tipo POST, GET
        url: 'AlberiAdottati', //metto la servlet
        data: {categoria : id }, //metto i campi che devo mandare tramite la richiesta
    });
}