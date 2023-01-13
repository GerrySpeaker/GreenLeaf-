function visualizzaAlbero(id){
    $.ajax({ //GET categorie
        type: 'GET', //tipo POST, GET
        url: 'AlberiAdottati', //metto la servlet
        data: {idAlbero : id }, //metto i campi che devo mandare tramite la richiesta
    });
}
