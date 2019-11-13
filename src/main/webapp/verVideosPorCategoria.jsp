<%@ page import="java.util.List" %>
<%@ page import="uytube.web.wsclients.*" %>
<%@include file="getPrimerVideoListaParticular.jsp"%>
<%--
  Created by IntelliJ IDEA.
  User: esteban
  Date: 19/10/19
  Time: 20:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Vídeos por Categoría</title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="assets/css/modificaruser.css">

    <script type="text/javascript" src="assets/js/jquery-3.4.1.min.js"></script>
</head>
<body style="background-color: #EEEEEE">
<div class="barra_superior text-center" style="background-color:#343841">
    <div class="d-inline">
        <a class="navbar-brand" href="index.jsp"> <img src="assets/images/logo2.png" width="112" height="auto" alt=""></a>
    </div>
</div>
<%
    ControladorUsuarioService us = new ControladorUsuarioService();
    uytube.web.wsclients.IControladorUsuario u = us.getControladorUsuarioPort();
    ControladorCanalService controlador = new ControladorCanalService();
    uytube.web.wsclients.IControladorCanal c = controlador.getControladorCanalPort();

    String categoria = request.getParameter("categoria");
    List listaVidCat = c.listarVideosPorCategoria(categoria);
    List listaPlaylistCat = c.obtenerListasParticularesPorCategoria(categoria);

%>
    <div id="modify-user-panel" class="container" style="margin-top: 50px; margin-bottom: 50px">
        <div class="row justify-content-center">
            <div class="col-md-10">
                <div class="card">
                    <div class="card-header text-center">Categoría: <%=categoria%></div>
                    <div class="card-body">
                            <%if(listaVidCat.isEmpty() && listaPlaylistCat.isEmpty()){%>
                                <p class="card-text text-center">No hay vídeos ni playlist para esta categoría</p>
                            <%}%>
                            <div class="card-group">
                                    <%
                                    uytube.web.wsclients.DtVideo vid;
                                    uytube.web.wsclients.DtListaParticulares playlist;
                                    String id;
                                    if(listaVidCat != null){
                                        for(int x = 0; x<listaVidCat.size(); x++){
                                            vid = (uytube.web.wsclients.DtVideo) listaVidCat.get(x);
                                            if (vid.getUrl() != null) {
                                                id = getID(vid.getUrl());
                                                if(!vid.isPrivado()){%>
                                                    <div class="col-md-6">
                                                        <div class="card my-3">
                                                            <a href="verVideos.jsp?video=<%=vid.getNombre()%>&canal=<%=vid.getCanal().getNombreCanal()%>">
                                                                <img src="https://img.youtube.com/vi/<%=id%>/0.jpg" class="card-img-top" alt="Miniatura de video">
                                                            </a>
                                                            <div class="card-body">
                                                                <h5 class="card-title"><strong><%=vid.getNombre()%></strong></h5>
                                                                <p class="card-text">Vídeo</p>
                                                            </div>
                                                            <div class="card-footer">
                                                                <small class="text-muted">Propietario: <%=vid.getCanal().getNombreCanal()%></small>
                                                            </div>
                                                        </div>
                                                    </div>
                                                <%}
                                            }
                                        }
                                    }
                                    String[] datos;
                                    if(listaPlaylistCat != null){
                                        for(int y=0; y<listaPlaylistCat.size(); y++){
                                            playlist = (uytube.web.wsclients.DtListaParticulares) listaPlaylistCat.get(y);
                                            DtUsuario usuario = u.buscarUsuarioCanal(playlist.getCanal().getNombreCanal());
                                            datos = getPrimerVideoListaParticular(playlist, usuario.getNickname());
                                            if (datos != null) {
                                                if(!playlist.isPrivado()){%>
                                                    <div class="col-md-6">
                                                        <div class="card my-3">
                                                                <a href="verPlaylist.jsp?nomLista=<%=playlist.getNombreLista()%>&user=<%=playlist.getCanal().getNombreCanal()%>&es_particular=true">
                                                                    <img src="https://img.youtube.com/vi/<%=datos[0]%>/0.jpg" class="card-img-top" alt="Miniatura de lista">
                                                                </a>
                                                                <div class="card-body">
                                                                    <h5 class="card-title"><strong><%=playlist.getNombreLista()%></strong></h5>
                                                                    <p class="card-text">Lista de Reproducción</p>
                                                                </div>
                                                                    <div class="card-footer">
                                                                        <small class="text-muted">Propietario: <%=playlist.getCanal().getNombreCanal()%></small>
                                                                    </div>
                                                        </div>
                                                    </div>
                                                <%}
                                            }
                                        }
                                    }%>
                            </div>
                        </div>
                </div>
            </div>
        </div>
    </div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>
