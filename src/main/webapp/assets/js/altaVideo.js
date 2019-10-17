$(document).ready(function () {
    var registrar = $("#formAltaVideo");
    registrar.submit(function (e) {
        e.preventDefault();
        e.returnValue = false;

        var nomVideo = $('#nombreVideo').val().trim();

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
                    registrar.off('submit');
                    registrar.submit();
                }else{
                    var div = $("#divError");
                    $('#alertaRoja').remove();
                    div.append('<p id="alertaRoja" style="color: red">El video ya existe</p>');
                    }

            },
            error: function (data) {
                console.log("ERROR: Fallo la peticion hacia el servlet");
            }
        });
    });
});



