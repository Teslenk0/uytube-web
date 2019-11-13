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
        const dato = $('#nomCanal').val().trim();
        $.ajax({
            type: 'get',
            url: 'ValidarModificarUserServlet',
            dataType: 'JSON',
            data:  {
                loadProds: 1,
                nombre: dato
            },
            success: function (response) {
                if(!response.canal){
                    form.off('submit');
                    form.submit();
                }else{
                    const div = $("#errorNom");
                    $('#alertaRoja').remove();
                    div.append('<p id="alertaRoja" style="color: red">Este nombre de canal ya esta en uso</p>');
                }
            },
            error: function (data) {
                console.log("ERROR: Fallo la peticion hacia el servlet");
            }
        });
    });
});