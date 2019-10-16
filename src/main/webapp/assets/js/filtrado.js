$(document).ready(function () {

    var filtroVideos = $('#filtroVideos');
    var filtroCanales = $('#filtroCanales');
    var filtroListas = $('#filtroListas');

    var filtradoCanal = false;
    var filtradoLista = false;
    var filtradoVideo = false;

    filtroVideos.on('click', function (e) {
        if(!filtradoVideo){
            $(".listas-resultado").detach();
            $(".canales-resultado").detach();
            filtroVideos.html("<a class=\"dropdown-item\" id=\"filtroVideos\" href=\"#\"><strong>Videos<strong></a>");
            filtroListas.html("<a class=\"dropdown-item\" id=\"filtroListas\" href=\"#\">Playlists</a>");
            filtroCanales.html("<a class=\"dropdown-item\" id=\"filtroCanales\" href=\"#\">Canales</a>");
            filtradoVideo = true;
        }else{
            $(".listas-resultado").appendTo("#deck-listas");
            $(".canales-resultado").appendTo("#deck-canales");
            filtroVideos.html("<a class=\"dropdown-item\" id=\"filtroVideos\" href=\"#\">Videos</a>");
            filtroListas.html("<a class=\"dropdown-item\" id=\"filtroListas\" href=\"#\">Playlists</a>");
            filtroCanales.html("<a class=\"dropdown-item\" id=\"filtroCanales\" href=\"#\">Canales</a>");
            filtradoVideo = false;
        }

    });

    filtroCanales.on('click', function (e) {
        $(".listas-resultado").detach();
        $(".video-resultado").detach();
        filtroVideos.html("<a class=\"dropdown-item\" id=\"filtroVideos\" href=\"#\">Videos</a>");
        filtroListas.html("<a class=\"dropdown-item\" id=\"filtroListas\" href=\"#\">Playlists</a>");
        filtroCanales.html("<a class=\"dropdown-item\" id=\"filtroCanales\" href=\"#\"><strong>Canales<strong></a>");
    });

    filtroListas.on('click', function (e) {
        $(".canales-resultado").detach();
        $(".video-resultado").detach();
        filtroVideos.html("<a class=\"dropdown-item\" id=\"filtroVideos\" href=\"#\">Videos</a>");
        filtroListas.html("<a class=\"dropdown-item\" id=\"filtroListas\" href=\"#\"><strong>Playlists<strong></a>");
        filtroCanales.html("<a class=\"dropdown-item\" id=\"filtroCanales\" href=\"#\">Canales</a>");
    });
});