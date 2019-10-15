$(document).ready(function () {
    var panel = $("#panelcentral");
    var boton = $("#altaVideo_btn");
    boton.on("click",function (e) {

        panel.empty();
        panel.load("altaVideo.jsp");

    });

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



