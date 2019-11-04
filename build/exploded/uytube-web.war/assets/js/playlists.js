$(document).ready(function () {

    let carousel = $('#carouselTipos');
    let body = $("#cuerpo");

    body.load("listasDefecto.jsp");
    let defecto = true;

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