<%@ page import="DataTypes.DtUsuario" %>
<%@ page import="fabrica.Fabrica" %>
<%@ page import="interfaces.IControladorCanal" %>
<%@ page import="java.util.List" %>
<%@ page import="DataTypes.DtListaParticulares" %>
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
    <title>Agregar Video Playlist</title>
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
<script src="assets/js/playlist2.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>

<!--<div class="card-group">
    <%
        DtUsuario user = null;
        if (session.getAttribute("usuario") != null) {
            user = (DtUsuario) session.getAttribute("usuario");
            Fabrica fabrica = Fabrica.getInstance();
            IControladorCanal controladorCanal = fabrica.getControladorCanal();
            List listasParticulares = controladorCanal.getListasReproduccion(user.getNickname());

            if (listasParticulares != null) {
                DtListaParticulares lista;
                String[] datos;
                for (int i = 0; i < listasParticulares.size(); i++) {
                    lista = (DtListaParticulares) listasParticulares.get(i);
                    datos = getPrimerVideoListaParticular(lista, user.getNickname());
                    if (datos != null) {
    %>
    <div class="card" id="playlist_div">
        <img src="https://img.youtube.com/vi/<%=datos[0].toString()%>/0.jpg" class="card-img-top" alt="Miniatura de lista">
        <div class="card-body">
            <h5 class="card-title"><strong><%=lista.getNombreLista()%></strong></h5>
            <p class="card-text">Categoria: <%=lista.getCategoria().getnombreCategoria()%></p>
        </div>
        <div class="card-footer">
            <a href="agregarVideoPlaylist2.jsp?nomLista=<%=lista.getNombreLista()%>">AGREGAR</a>
        </div>
    </div>
    <%} else {%>
    <div class="card">
        <img src="assets/images/logo.png" class="card-img-top" alt="Miniatura de lista">

        <div class="card-body">
            <h5 class="card-title"><strong><%=lista.getNombreLista()%></strong></h5>
            <p class="card-text">Categoria: <%=lista.getCategoria().getnombreCategoria()%></p>
        </div>
        <div class="card-footer">
          <a href="agregarVideoPlaylist2.jsp?nomLista=<%=lista.getNombreLista()%>">AGREGAR</a>
        </div>
    </div>
    <%}
    }
    }
    }
    %>
</div>-->
<script src="assets/js/clearPaneles.js"></script>
</body>
</html>
