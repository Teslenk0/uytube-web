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
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Agregar Videos</title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script type="text/javascript" src="assets/js/jquery-3.4.1.min.js"></script>
</head>
<body style="background-color: #EEEEEE">

<!-- BARRA SUPERIOR -->
<div class="barra_superior text-center" style="background-color:#343841">
    <div class="d-inline">
        <a class="navbar-brand" href="index.jsp"> <img src="assets/images/logo2.png" width="112" height="auto"></a>
    </div>
</div>

<div id="modify-user-panel" class="container" style="margin-top: 50px; margin-bottom: 50px">
    <div class="row justify-content-center">
        <div class="col-md-10">
            <div class="card">
                <div class="card-header text-center">Elegir Vídeo</div>
                <div class="card-body">
                        <div class="card-group">
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

                                    List videosUser;
                                    videosUser = c.listaVideos(user.getCanal());
                                    List<uytube.web.wsclients.DtVideo> lista_videos = new ArrayList<>();
                                    lista_videos.addAll(videosUser);

                                    List usuarios = u.listaUsuarios();

                                    List aux;
                                    uytube.web.wsclients.DtVideo vidActual;
                                    uytube.web.wsclients.DtUsuario userActual;

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
                                    uytube.web.wsclients.DtVideo vid;

                                    if (lista_videos != null) {
                                        for (int i = 0; i < lista_videos.size(); i++) {
                                            vid = lista_videos.get(i);
                                            if (vid.getUrl() != null) {
                                                id = getID(vid.getUrl());
                                %>
                            <div class="col-md-6">
                                <div class="card my-3">
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
                                    <div class="card-body">
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>
