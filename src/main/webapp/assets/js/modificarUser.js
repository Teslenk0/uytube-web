$(document).ready(function () {
    $(".custom-file-input").on("change", function() {
        const fileName = $(this).val().split("\\").pop();
        $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
    });

    const isChannelPrivate = $("#is-channel-private").attr("data-value");

    if (isChannelPrivate === "true") {
        $("#privado").attr("checked", true);
    } else {
        $("#publico").attr("checked", true);
    }

    const form = $("#formModificar");
    form.submit(function (e) {
        e.preventDefault();
        e.returnValue = false;
        const datos = {
            nickname: $('#nickname').val().trim(),
            nombre: $('#nombre').val().trim(),
            password: $('#password').val().trim(),
            apellido: $('#apellido').val().trim(),
            email: $('#email').val().trim(),
            nomCanal: $('#nomCanal').val().trim(),
            fechaNac : $('#fechaNac').val().trim(),
            descripcion: $('#descripcion').val().trim(),
            privado: $("input[name=group1]:checked").val()
        };
        $.ajax({
            type: 'get',
            url: 'ValidarModificarUserServlet',
            dataType: 'JSON',
            data: {
                loadProds: 1,
                datos: JSON.stringify(datos)
            },
            success: function (response) {
                if(!response.canal && !response.cambios){
                    form.off('submit');
                    form.submit();
                }else{
                    $('#alertaRoja').remove();
                    if(response.canal) {
                        const div = $("#errorNom");
                        div.append('<p id="alertaRoja" style="color: red">Este nombre de canal ya esta en uso</p>');
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