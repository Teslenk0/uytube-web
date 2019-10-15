$(document).ready(function () {

    $/*('#lupa_buscar').on('click', function (e) {
        //e.target; // newly activated tab
        //e.relatedTarget; // previous active tab
        var texto = $("#input_search").val().trim();

        if(texto != ""){
            $.ajax({
                type: 'get',
                url: 'BuscarServlet',
                dataType: 'JSON',
                data: {
                    loadProds: 1,
                    datos: texto
                },
                success: function (response) {
                    console.log("REALIZADA CORRECTAMENTE");
                    $("#panelcentral").load("results.jsp");
                },
                error: function (data) {
                    $("#panelcentral").load("results.jsp");
                    console.log("ERROR: Fallo la peticion hacia el servlet");

                }
            });
        }
    });*/

});