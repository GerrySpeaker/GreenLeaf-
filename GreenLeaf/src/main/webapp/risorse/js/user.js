let list = document.querySelectorAll('li');
for(let i = 0; i<list.length; i++){
    list[i].onmouseover = function () {
        let j = 0;

        while(j< list.length){
            list[j++].className = 'list';
        }
        list[i].className = 'list active';
    }
}

function eliminaAccount(mail){
    $.ajax({ //GET categorie
        type: 'POST', //tipo POST, GET
        url: '/SnackMania/update', //metto la servlet
        data: {}, //metto i campi che devo mandare tramite la richiesta
        complete: function (response) {
            $.get("/SnackMania/profile"),
                window.location.reload();
        }
    });
}