$(document).ready(function () {

    let carousel = $('#carouselTipos');
    let body = $("#cuerpo");

    body.load("playlistDefecto.jsp");
    let defecto = true;

    carousel.bind('slide.bs.carousel', function (e) {
        if(defecto){
            body.load("playlistDefecto2.jsp").hide().fadeIn('slow');
            defecto = false;
        }else{
            body.load("playlistParticular2.jsp").hide().fadeIn('slow');
            defecto = true;
        }
    });
});