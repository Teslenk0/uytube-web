$(document).ready(function () {
    const isChannelPrivate = $("#is-channel-private").attr("data-value");

    if (isChannelPrivate === "true") {
        $("#privado").attr("checked", true);
    } else {
        $("#publico").attr("checked", true);
    }

    const form = $("#formMVideo");
    form.submit(function (e) {
        e.preventDefault();
        e.returnValue = false;
        const datos = {
            nomV: $('#nomV').val().trim(),
            fechaPu: $('#fechaPu').val().trim(),
            url: $('#url').val().trim(),
            desc: $('#desc').val().trim(),
            categoria: $('#categorias').val().trim(),
            privado: $("input[name=estado]:checked").val()
        };
        $.ajax({
            type: 'get',
            url: 'ValidarModificarVideoServlet',
            dataType: 'JSON',
            data: {
                loadProds: 1,
                datos: JSON.stringify(datos)
            },
            success: function (response) {
                if(!response.existe && !response.cambios){
                    const url = $('#url').val().trim();
                    $('#alertaRoja').remove();
                    if(matchYoutubeUrl(url)){
                        form.off('submit');
                        form.submit();
                    }else{
                        const div = $("#urlError");
                        div.append('<p id="alertaRoja" style="color: red">URL Invalida</p>');
                    }
                }else{
                    if(response.existe) {
                        const div = $("#errorNom");
                        div.append('<p id="alertaRoja" style="color: red">Este nombre de video ya existe en su canal</p>');
                    }
                    if(response.cambios){
                        Swal.fire({
                            icon: 'error',
                            title: 'Oops...',
                            text: 'No se registraron cambios!',
                        })
                    }
                }
            },
            error: function (data) {
                console.log("ERROR: Fallo la peticion hacia el servlet");
            }
        });
    });
});

function matchYoutubeUrl(url) {
    const p = /^(?:https?:\/\/)?(?:m\.|www\.)?(?:youtu\.be\/|youtube\.com\/(?:embed\/|v\/|watch\?v=|watch\?.+&v=))((\w|-){11})(?:\S+)?$/;
    if(url.match(p)){
        return url.match(p)[1];
    }
    return false;
}