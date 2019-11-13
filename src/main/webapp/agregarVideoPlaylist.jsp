<%@include file="getPrimerVideoListaParticular.jsp"%>
<%--
  Created by IntelliJ IDEA.
  User: caste
  Date: 18/10/19
  Time: 14:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Agregar Vídeos</title>
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
<script src="assets/js/playlist2.js" type="text/javascript"></script>
</body>
</html>
