<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="uytube.web.wsclients.ControladorUsuarioService" %>
<%@ page import="uytube.web.wsclients.ControladorCanalService" %>
<%@include file="getID.jsp"%>
<%--
  Created by IntelliJ IDEA.
  User: caste
  Date: 18/10/19
  Time: 15:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link rel="stylesheet" type="text/css" href="assets/css/modificaruser.css">
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <title>Videos</title>
</head>
<body>

<!-- BARRA SUPERIOR -->
<div class="barra_superior" style="background-color:#343841">
    <div class="d-inline">
        <a class="navbar-brand" href="index.jsp" style="margin-left: 45%"> <img src="assets/images/logo2.png" width="112" height="auto"></a>
    </div>
</div>

<div id="modify-user-panel" class="container" style="margin-top: 50px; margin-bottom: 50px">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Elegir Video A Agregar</div>
                <div class="card-body">

                    <div class="container-fluid">
                        <div class="card-deck">
                            <div class="row align-self-center">
                                <%
                                    ControladorUsuarioService us = new ControladorUsuarioService();
                                    uytube.web.wsclients.IControladorUsuario u = us.getControladorUsuarioPort();
                                    ControladorCanalService controlador = new ControladorCanalService();
                                    uytube.web.wsclients.IControladorCanal c = controlador.getControladorCanalPort();

                                    String nombrePlaylist = request.getParameter("nomLista");
                                    uytube.web.wsclients.DtUsuario user = null;
                                    if (session.getAttribute("usuario") != null) {
                                        user = (uytube.web.wsclients.DtUsuario) session.getAttribute("usuario");
                                    }

                                    List videosUser = new ArrayList<>();
                                    videosUser = c.listaVideos(user.getCanal());
                                    List<uytube.web.wsclients.DtVideo> lista_videos = new ArrayList<>();
                                    lista_videos.addAll(videosUser);

                                    List usuarios = u.listaUsuarios();

                                    List aux = null;
                                    uytube.web.wsclients.DtVideo vidActual;
                                    uytube.web.wsclients.DtUsuario userActual = null;

                                    String esParticular = request.getParameter("es_particular");
                                    for(int x = 0; x < usuarios.size(); x++) {
                                        userActual = (uytube.web.wsclients.DtUsuario) usuarios.get(x);
                                        if(!userActual.getNickname().equals(user.getNickname())) {
                                            aux = c.listaVideos(userActual.getCanal());
                                            if(!aux.isEmpty()) {
                                                for (int y = 0; y < aux.size(); y++) {
                                                    vidActual = (uytube.web.wsclients.DtVideo) aux.get(y);
                                                    if (!vidActual.isPrivado()) {
                                                        lista_videos.add(vidActual);
                                                    }
                                                }
                                            }
                                        }
                                    }

                                    String id;
                                    uytube.web.wsclients.DtVideo vid = null;

                                    if (lista_videos != null) {
                                        for (int i = 0; i < lista_videos.size(); i++) {
                                            vid = (uytube.web.wsclients.DtVideo) lista_videos.get(i);
                                            if (vid.getUrl() != null) {
                                                //getID es la funcion definida en el .jsp con el mismo nombre (getID.jsp)
                                                id = getID(vid.getUrl());
                                %>
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <div class="card-body">
                                        <%if(esParticular.equals("true")) {
                                        %>
                                            <a href="/uytube/AgregarVideoPlaylistParticularServlet?nomPlaylist=<%=nombrePlaylist%>&nomVideo=<%=vid.getNombre()%>&nomCanal=<%=vid.getCanal().getNombreCanal()%>">
                                                <img src="https://img.youtube.com/vi/<%=id%>/0.jpg" class="card-img-top" alt="Miniatura de video">
                                            </a>
                                        <%}
                                        else if(esParticular.equals("false")) {%>
                                            <a href="/uytube/AgregarVideoPlaylistDefectoServlet?nomPlaylist=<%=nombrePlaylist%>&nomVideo=<%=vid.getNombre()%>&nomCanal=<%=vid.getCanal().getNombreCanal()%>">
                                                <img src="https://img.youtube.com/vi/<%=id%>/0.jpg" class="card-img-top" alt="Miniatura de video">
                                            </a>
                                        <%}%>
                                        <h5 class="card-title"><strong><%=vid.getNombre()%></strong></h5>
                                    </div>
                                    <div class="card-footer">
                                        <small class="text-muted">Canal: <%=vid.getCanal().getNombreCanal()%></small>
                                    </div>
                                </div>
                            </div>
                                <%         }
                                }
                                }
                                %>
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
