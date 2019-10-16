<%--
  Created by IntelliJ IDEA.
  User: caste
  Date: 15/10/19
  Time: 15:01
  To change this template use File | Settings | File Templates.
--%>
<%@include file="getPrimerVideoListaParticular.jsp"%>
<%@page import="DataTypes.DtVideo"%>
<%@page import="DataTypes.DtListaporDefecto"%>
<%@page import="DataTypes.DtListaDefectoVideos"%>
<%@page import="java.util.List"%>

<%@page import="interfaces.IControladorCanal"%>
<%@page import="fabrica.Fabrica"%>
<%@page import="DataTypes.DtUsuario"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Listas Particulares</title>
</head>
<body>
<div class="card-group">
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
                        Boolean isPlaylistPrivate =  lista.getPrivado();
                        session.setAttribute("lista", lista);
    %>
    <div class="card" id="playlist_div">
        <img src="https://img.youtube.com/vi/<%=datos[0].toString()%>/0.jpg" class="card-img-top" alt="Miniatura de lista">
        <div class="card-body">
            <h5 class="card-title"><strong><%=lista.getNombreLista()%></strong></h5>
            <p class="card-text">Categoria: <%=lista.getCategoria().getnombreCategoria()%></p>
        </div>
        <div class="card-footer">
            <form class="form-horizontal" method="post" action="ModificoPlaylistServlet" id="formModificarPlaylist">
                <div class="form-group">
                    <label class="cols-sm-2 control-label">Estado de Playlist</label>
                    <span id="is-playlist-private" data-value="<%=isPlaylistPrivate%>" hidden></span>
                    <div class="custom-control custom-radio">
                        <input name="group1" value="privado" type="radio" class="custom-control-input" id="privado" name="defaultExampleRadios">
                        <label class="custom-control-label" for="privado">Privado</label>
                    </div>
                    <div class="custom-control custom-radio">
                        <input name="group1" value="publico" type="radio" class="custom-control-input" id="publico" name="defaultExampleRadios">
                        <label class="custom-control-label" for="publico">Publico</label>
                    </div>
                </div>
                <div class="form-group">
                    <button style="margin-top: 10px" type="submit" class="btn btn-success btn-block login-button" id="submitForm">Modificar</button>
                </div>
            </form>
        </div>
    </div>
    <%} else {%>
    <div class="card">
        <img src="assets/images/logo.png" class="card-img-top" alt="Miniatura de lista">

        <div class="card-body">
            <h5 class="card-title"><strong><%=lista.getNombreLista()%></strong></h5>
        </div>
        <div class="card-footer">
            <small class="text-muted">Cantidad de videos: 0</small>
        </div>
    </div>
    <%}
    }
    }
    }
    %>
</div>
<script src="assets/js/modificarPlaylist.js"></script>
</body>
</html>