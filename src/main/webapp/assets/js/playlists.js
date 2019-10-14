$(document).ready(function () {

    var carousel = $('#carouselTipos');
    var body = $("#cuerpo");

    body.load("listasDefecto.jsp");
    var defecto = true;

    carousel.bind('slide.bs.carousel', function (e) {
        if(defecto){
            body.load("listasParticular.jsp").hide().fadeIn('slow');
            defecto = false;
        }else{
            body.load("listasDefecto.jsp").hide().fadeIn('slow');
            defecto = true;
        }
    });
});