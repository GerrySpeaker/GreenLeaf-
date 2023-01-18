function aggiungi(){
    $.ajax({ //GET categorie
        type: 'GET', //tipo POST, GET
        url: 'AggiungiCarrello', //metto la servlet
        data: { regione: document.getElementById("regione") }, //metto i campi che devo mandare tramite la richiesta
        complete: function (response) {
            window.location.reload();
        }
    });
}