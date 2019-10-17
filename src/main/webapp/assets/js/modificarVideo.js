$(document).ready(function () {
    let form = $("#formMVideo");
    form.submit(function (e) {
        e.preventDefault();
        e.returnValue = false;
        console.log("Entra")
        let nomVideo = $('#nomV').val().trim();
        $.ajax({
            type: 'get',
            url: 'ValidarModificarVideoServlet',
            dataType: 'JSON',
            data: {
                loadProds: 1,
                nombre: nomVideo
            },
            success: function (response) {
                if(!response.existe){
                    let url = $('#url').val();
                    if(matchYoutubeUrl(url)){
                        form.off('submit');
                        form.submit();
                    }else{
                        let div = $("#urlError");
                        $('#alertaRoja').remove();
                        div.append('<p id="alertaRoja" style="color: red">URL Invalida</p>');
                    }
                }else{
                    let div = $("#errorNom");
                    $('#alertaRoja').remove();
                    div.append('<p id="alertaRoja" style="color: red">Este nombre de video ya existe en su canal</p>');
                }
            },
            error: function (data) {
                console.log("ERROR: Fallo la peticion hacia el servlet");
            }
        });
    });
});

function matchYoutubeUrl(url) {
    let p = /^(?:https?:\/\/)?(?:m\.|www\.)?(?:youtu\.be\/|youtube\.com\/(?:embed\/|v\/|watch\?v=|watch\?.+&v=))((\w|-){11})(?:\S+)?$/;
    if(url.match(p)){
        return url.match(p)[1];
    }
    return false;
}