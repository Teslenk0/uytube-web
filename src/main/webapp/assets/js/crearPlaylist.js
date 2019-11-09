$(document).ready(function () {
    const panel = $("#panelcentral");
    const boton = $("#crearPlaylist_btn");

    boton.on("click",function (e) {
        panel.empty();
        panel.load("crearPlaylist.jsp");
    });

    const registrar = $("#formCrearPlaylist");
    registrar.submit(function (e) {
        e.preventDefault();
        e.returnValue = false;

        const nomPlaylist = $('#nombrePlaylist').val().trim();

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
                    div.append('<p id="alertaRoja" style="color: red">Esta playlist ya existe</p>');
                }
            },
            error: function (data) {
                console.log("ERROR: Fallo la peticion hacia el servlet");
            }
        });
    });
});