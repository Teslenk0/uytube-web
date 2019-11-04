$(document).ready(function () {

    const resp = $('#fromRespuesta');
    resp.submit(function (e) {
        e.preventDefault();
        e.returnValue = false;

        let com = $('#respuesta').val().trim();

        if (com !== "") {
            resp.off('submit');
            resp.submit();

        } else {
            var div = $("#error1");
            $('#alertaRoja').remove();
            div.append('<p id="alertaRoja" style="color: red">El comentario esta vacio</p>');
        }
    });
});