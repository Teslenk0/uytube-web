$(document).ready(function () {
    var panel = $("#panelcentral");
    var boton = $("#crearPlaylist_btn");

    boton.on("click",function (e) {
        panel.empty();
        panel.load("crearPlaylist.jsp");
    });

    var registrar = $("#formCrearPlaylist");
    registrar.submit(function (e) {
        e.preventDefault();
        e.returnValue = false;

        var nomPlaylist = $('#nombrePlaylist').val().trim();

        $.ajax({
            type: 'get',
            url: 'ValidarPlaylistServlet',
            dataType: 'JSON',
            data: {
                loadProds: 1,
                nombre: nomPlaylist
            },
            success: function (response) {
                if(!response.existe){
                    registrar.off('submit');
                    registrar.submit();
                }else{
                    var div = $("#divError");
                    $('#alertaRoja').remove();
                    div.append('<p id="alertaRoja" style="color: red">La Playlist ya existe</p>');
                }

            },
            error: function (data) {
                console.log("ERROR: Fallo la peticion hacia el servlet");
            }
        });

    });

});