$(document).ready(function () {

        const agrego = $('#formComentario');
        agrego.submit(function (e) {
        e.preventDefault();
        e.returnValue = false;

        let com = $('#comentario').val().trim();

        if (com !== "") {
            agrego.off('submit');
            agrego.submit();

        } else {
            var div = $("#error");
            $('#alertaRoja').remove();
            div.append('<p id="alertaRoja" style="color: red">El comentario esta vacio</p>');
        }
    });
});