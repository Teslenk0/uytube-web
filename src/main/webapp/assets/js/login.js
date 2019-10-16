$(document).ready(function () {
    //capturo el evento
    var form = $("#loginForm");
    form.submit(function (e) {
        //pongo boton en cargando
        $('#submitForm').attr("class","button is-success is-loading");
        //evito que se haga un reload de la pagina
        e.preventDefault();
        e.returnValue = false;

        //creo un  JSON
        var datos = {
            nickname: $('#inputUser').val().trim(),
            password: $('#inputPassword').val().trim(),
        };

        //creo la peticion
        $.ajax({
            type: 'get',
            url: 'ValidarUsuarioServlet',
            dataType: 'JSON',
            data: {
                loadProds: 1,
                datos: JSON.stringify(datos) // look here!
            },
            success: function (response) {
                /**
                 * EN FUNCION DE LA RESPUESTA QUE TENGO
                 * VEO SI LLAMO EL LOGIN SERVLET CON OTRA 
                 * PETICION PARA QUE LOGEE 
                 * O SI MUESTRO ERROR EN EL LOGIN
                 */
               
                if(response.existe && response.passOk){
                    form.off('submit');
                    form.submit();
                }else if(response.existe && !response.passOk){
                    //busco el div que tiene el boton
                    var div = $("#boxUsuario");
                    //saco cualquier mensaje de error que haya
                    $('#alertaRoja').remove();
                    //agrego el error
                    div.append('<p class="help is-danger" id="alertaRoja">La contraseña es incorrecta</p>');
                    $('#submitForm').attr("class","button is-success");
                }else{
                    var div = $("#boxUsuario");
                    $('#alertaRoja').remove();
                    div.append('<p class="help is-danger" id="alertaRoja">El usuario no existe</p>');
                    $('#submitForm').attr("class","button is-success");
                }
                
            },
            error: function (data) {
                console.log("ERROR: Fallo la peticion hacia el servlet");
                
            }
        });
    });
});