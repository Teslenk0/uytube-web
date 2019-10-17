$(document).ready(function () {

    var filtroVideos = $('#filtroVideos');
    var filtroCanales = $('#filtroCanales');
    var filtroListas = $('#filtroListas');

    var filtradoCanal = false;
    var filtradoLista = false;
    var filtradoVideo = false;

    filtroVideos.on('click', function (e) {
        $(".video-resultado").show();
        if(!filtradoVideo){
            $(".listas-resultado").hide();
            $(".canales-resultado").hide();
            console.log("filtrado activado")
            filtroVideos.html("<a class=\"dropdown-item\" id=\"filtroVideos\" href=\"#\"><strong>Videos<strong></a>");
            filtroListas.html("<a class=\"dropdown-item\" id=\"filtroListas\" href=\"#\">Playlists</a>");
            filtroCanales.html("<a class=\"dropdown-item\" id=\"filtroCanales\" href=\"#\">Canales</a>");
            filtradoVideo = true;
        }else{
            $(".listas-resultado").show();
            $(".canales-resultado").show();
            console.log("filtrado desactivado")
            filtroVideos.html("<a class=\"dropdown-item\" id=\"filtroVideos\" href=\"#\">Videos</a>");
            filtroListas.html("<a class=\"dropdown-item\" id=\"filtroListas\" href=\"#\">Playlists</a>");
            filtroCanales.html("<a class=\"dropdown-item\" id=\"filtroCanales\" href=\"#\">Canales</a>");
            filtradoVideo = false;
        }

    });

    filtroCanales.on('click', function (e) {
        $(".canales-resultado").show();
        if(!filtradoCanal){
            $(".listas-resultado").hide();
            $(".video-resultado").hide();
            console.log("filtrado activado")
            filtroVideos.html("<a class=\"dropdown-item\" id=\"filtroVideos\" href=\"#\">Videos</a>");
            filtroListas.html("<a class=\"dropdown-item\" id=\"filtroListas\" href=\"#\">Playlists</a>");
            filtroCanales.html("<a class=\"dropdown-item\" id=\"filtroCanales\" href=\"#\"><strong>Canales<strong></a>");
            filtradoCanal = true;
        }else{
            $(".listas-resultado").show();
            $(".video-resultado").show();
            console.log("filtrado desactivado")
            filtroVideos.html("<a class=\"dropdown-item\" id=\"filtroVideos\" href=\"#\">Videos</a>");
            filtroListas.html("<a class=\"dropdown-item\" id=\"filtroListas\" href=\"#\">Playlists</a>");
            filtroCanales.html("<a class=\"dropdown-item\" id=\"filtroCanales\" href=\"#\">Canales</a>");
            filtradoCanal = false;
        }
    });

    filtroListas.on('click', function (e) {
        $(".listas-resultado").show();
        if(!filtradoLista){
            $(".canales-resultado").hide();
            $(".video-resultado").hide();
            console.log("filtrado activado")
            filtroVideos.html("<a class=\"dropdown-item\" id=\"filtroVideos\" href=\"#\">Videos</a>");
            filtroListas.html("<a class=\"dropdown-item\" id=\"filtroListas\" href=\"#\"><strong>Playlists<strong></a>");
            filtroCanales.html("<a class=\"dropdown-item\" id=\"filtroCanales\" href=\"#\">Canales</a>");
            filtradoLista = true;
        }else{
            $(".canales-resultado").show();
            $(".video-resultado").show();
            console.log("filtrado desactivado")
            filtroVideos.html("<a class=\"dropdown-item\" id=\"filtroVideos\" href=\"#\">Videos</a>");
            filtroListas.html("<a class=\"dropdown-item\" id=\"filtroListas\" href=\"#\">Playlists</a>");
            filtroCanales.html("<a class=\"dropdown-item\" id=\"filtroCanales\" href=\"#\">Canales</a>");
            filtradoLista = false;
        }
    });
});