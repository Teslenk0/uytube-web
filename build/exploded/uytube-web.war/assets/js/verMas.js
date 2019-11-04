$(document).ready(function(){

    $('#alternar-respuesta-ej1').toggle(

        // Primer click
        function(e){
            $('#respuesta-ej1').slideDown();
            $(this).text('Ocultar');
            e.preventDefault();
        }, // Separamos las dos funciones con una coma

        // Segundo click
        function(e){
            $('#respuesta-ej1').slideUp();
            $(this).text('Ver lista de me gustas');
            e.preventDefault();
        }

    );

    $('#alternar-respuesta-ej2').toggle(

        // Primer click
        function(e){
            $('#respuesta-ej2').slideDown();
            $(this).text('Ocultar');
            e.preventDefault();
        }, // Separamos las dos funciones con una coma

        // Segundo click
        function(e){
            $('#respuesta-ej2').slideUp();
            $(this).text('Ver lista de NO me gustas');
            e.preventDefault();
        }

    );

});