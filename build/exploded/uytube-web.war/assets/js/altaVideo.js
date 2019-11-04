$(document).ready(function () {
    function matchYoutubeUrl(url) {
        const p = /^(?:https?:\/\/)?(?:m\.|www\.)?(?:youtu\.be\/|youtube\.com\/(?:embed\/|v\/|watch\?v=|watch\?.+&v=))((\w|-){11})(?:\S+)?$/;
        if(url.match(p)){
            return url.match(p)[1];
        }
        return false;
    }

    const registrar = $("#formAltaVideo");
    registrar.submit(function (e) {
        e.preventDefault();
        e.returnValue = false;

        const nomVideo = $('#nombreVideo').val().trim();

        $.ajax({
            type: 'get',
            url: 'ValidarVideoServlet',
            dataType: 'JSON',
            data: {
                loadProds: 1,
                nombre: nomVideo
            },
            success: function (response) {
                if(!response.existe){
                    const url = $('#url').val().trim();
                    if(matchYoutubeUrl(url)){
                        registrar.off('submit');
                        registrar.submit();
                    }else{
                        const div = $("#urlError");
                        $('#alertaRoja').remove();
                        div.append('<p id="alertaRoja" style="color: red">URL Invalida</p>');
                    }
                }else{
                    var div = $("#divError");
                    $('#alertaRoja').remove();
                    div.append('<p id="alertaRoja" style="color: red">Este video ya existe en su canal</p>');
                    }

            },
            error: function (data) {
                console.log("ERROR: Fallo la peticion hacia el servlet");
            }
        });
    });
});



