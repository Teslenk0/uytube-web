<%-- 
    Document   : playlists
    Created on : 13 oct. 2019, 14:56:58
    Author     : tesla
--%>
<%@include file="getID.jsp" %>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Playlists</title>
    </head>
    <body>
        <hr>
        <div id="carouselTipos" class="carousel slide" data-ride="carousel" data-interval="0" style="background: #343841">
            <ol class="carousel-indicators">
                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
            </ol>
            <div class="carousel-inner text-center">
                <div class="carousel-item active">
                    <br>
                    <h3 style="color: white">Listas por Defecto</h3>
                    <br>
                    <br>
                </div>
                <div class="carousel-item">
                    <br>
                    <h3 style="color: white">Listas Particulares</h3>
                    <br>
                    <br>
                </div>

            </div>
            <a class="carousel-control-prev" href="#carouselTipos" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Anterior</span>
            </a>
            <a class="carousel-control-next" href="#carouselTipos" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Siguiente</span>
            </a>
        </div>
        <hr>
        <br>
        <div id="cuerpo"></div>
        <script src="assets/js/playlists.js" type="text/javascript"></script>
    </body>
</html>
