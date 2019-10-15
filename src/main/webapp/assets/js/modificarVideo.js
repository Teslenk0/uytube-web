$(document).ready(function () {
    const panel = $("#panelcentral");
    const boton = $("#modificoVideo_btn");
    boton.on("click",function (e) {
        panel.empty();
        panel.load("modificarVideo.jsp");
    });

    const modificar = $("#formMVideo");
    modificar.submit(function (e) {
        e.preventDefault();
        e.returnValue = false;

        const url = $('#url').val();
        if(matchYoutubeUrl(url)){
            modificar.off('submit');
            modificar.submit();
        }else{
            const div = $("#urlError");
            $('#alertaRoja').remove();
            div.append('<p id="alertaRoja" style="color: red">URL Invalida</p>');
        }
        /*$.ajax({
            type: 'get',
            url: 'ValidarModificarVideoServlet',
            dataType: 'JSON',
            data: {
                loadProds: 1,
                nombre: nomVideo
            },
            success: function (response) {
                if(matchYoutubeUrl(url)){
                    console.log("Pasa aca");
                    registrar.off('submit');
                    registrar.submit();
                }else{
                    console.log("Pasa else");
                    var div = $("#url");
                    $('#alertaRoja').remove();
                    div.append('<p id="alertaRoja" style="color: red">URL Invalida</p>');
                }
            },
            error: function (data) {
                console.log("ERROR: Fallo la peticion hacia el servlet");
            }
        });*/
    });
});

function matchYoutubeUrl(url) {
    console.log(url);
    const p = /^(?:https?:\/\/)?(?:m\.|www\.)?(?:youtu\.be\/|youtube\.com\/(?:embed\/|v\/|watch\?v=|watch\?.+&v=))((\w|-){11})(?:\S+)?$/;
    if(url.match(p)){
        return url.match(p)[1];
    }
    return false;
}