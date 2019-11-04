$(document).ready(function () {

    let carousel = $('#carouselTipos');
    let body = $("#cuerpo");

    body.load("playlistDefecto1.jsp");
    let defecto = true;

    carousel.bind('slide.bs.carousel', function (e) {
        if(defecto){
            body.load("playlistParticular1.jsp").hide().fadeIn('slow');
            defecto = false;
        }else{
            body.load("playlistDefecto1.jsp").hide().fadeIn('slow');
            defecto = true;
        }
    });
});