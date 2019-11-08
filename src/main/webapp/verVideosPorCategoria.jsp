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
<head>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link rel="stylesheet" type="text/css" href="assets/css/modificaruser.css">
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Videos</title>
</head>
<body>
<div class="barra_superior text-center" style="background-color:#343841">
    <div class="d-inline">
        <a class="navbar-brand" href="index.jsp"> <img src="assets/images/logo2.png" width="112" height="auto"></a>
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
                    <div class="card-header">Lista por categoría: <%=categoria%></div>
                    <div class="card-body">
                        <div class="container-fluid">
                            <div class="card-deck">
                                <div class="row align-self-center">
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
                                                        <div class="card mb-3">
                                                            <div class="card-body">
                                                                <a href="verVideos.jsp?video=<%=vid.getNombre()%>&canal=<%=vid.getCanal().getNombreCanal()%>">
                                                                    <img src="https://img.youtube.com/vi/<%=id%>/0.jpg" class="card-img-top" alt="Miniatura de video">
                                                                </a>
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
                                                    <div class="col-md-4">
                                                        <div class="card mb-3">
                                                                <div class="card-body">
                                                                    <a href="verPlaylist.jsp?nomLista=<%=playlist.getNombreLista()%>&user=<%=playlist.getCanal().getNombreCanal()%>&es_particular=true">
                                                                        <img src="https://img.youtube.com/vi/<%=datos[0]%>/0.jpg" class="card-img-top" alt="Miniatura de lista">
                                                                    </a>
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
        </div>
    </div>
</body>
</html>
