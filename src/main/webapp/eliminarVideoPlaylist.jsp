<%@include file="getPrimerVideoListaParticular.jsp"%>
<%--
  Created by IntelliJ IDEA.
  User: caste
  Date: 18/10/19
  Time: 14:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Eliminar Video Playlist</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
</head>
<body>

<hr>
<div id="carouselTipos" class="carousel slide" data-ride="carousel" data-interval="0" style="background: darkslategray">
    <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    </ol>
    <div class="carousel-inner text-center">
        <div class="carousel-item active">
            <h3 style="color: white">Listas por Defecto</h3>
            <br>
            <br>
        </div>
        <div class="carousel-item">
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
<script src="assets/js/playlist3.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>


<script src="assets/js/clearPaneles.js"></script>
</body>
</html>