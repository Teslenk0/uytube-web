$(document).ready(function () {
    var panel = $("#panelcentral");
    var boton = $("#altaVideo_btn");
    boton.on("click",function (e) {

        panel.empty();
        panel.load("altaVideo.jsp");

    });

    $('.dropdown-menu a').click(function(){
        $('#selected').text($(this).text());
    });

    var registrar = $("#formAltaVideo");
    registrar.submit(function (e) {
        //pongo boton en cargando
        //$('#aceptar').attr("class","button is-success is-loading");
        //evito que se haga un reload de la pagina
        e.preventDefault();
        e.returnValue = false;

        var nomVideo = $('#nombreVideo').val().trim(); // val saca el texto y trim saca los espacios

        //creo la peticion
        $.ajax({
            type: 'get',
            url: 'ValidarVideoServlet',
            dataType: 'JSON',
            data: {
                loadProds: 1,
                nombre: nomVideo  // look here!
            },
            success: function (response) {
                if(!response.existe){
                    registrar.off('submit');
                    registrar.submit();
                    console.log('no existe');
                }else{
                    //busco el div que tiene el boton
                    var div = $("#divError");
                    //saco cualquier mensaje de error que haya
                    $('#alertaRoja').remove();
                    //agrego el error
                    div.append('<p id="alertaRoja" style="color: red">El video ya existe</p>');
                    //$('#submitForm').attr("class","button is-success");
                    }

            },
            error: function (data) {
                console.log("ERROR: Fallo la peticion hacia el servlet");
            }
        });

    });
});



