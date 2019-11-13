<%@ page import="uytube.web.wsclients.ControladorCanalService" %>
<%@ page import="java.util.List" %>
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
    <title>Eliminar Vídeo</title>

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
    <%ControladorCanalService controlador = new ControladorCanalService();
        uytube.web.wsclients.IControladorCanal c = controlador.getControladorCanalPort();

        String nombrePlaylist = request.getParameter("nomLista");
        uytube.web.wsclients.DtUsuario user = null;
        if (session.getAttribute("usuario") != null) {
            user = (uytube.web.wsclients.DtUsuario) session.getAttribute("usuario");
        }

        String esParticular = request.getParameter("es_particular");
        List lista_videos;
        lista_videos=c.getVideosListaParticular(user.getNickname(),nombrePlaylist);%>
    <div class="row justify-content-center">
        <div class="col-md-10">
            <div class="card">
                <div class="card-header text-center">Elegir Vídeo A Eliminar</div>
                <div class="card-body">
                    <%if(lista_videos.isEmpty()){%>
                    <p class="card-text text-center">Esta lista no contiene videos para eliminar</p>
                    <%}%>
                        <div class="card-group">
                                <%
                                    String id;
                                    uytube.web.wsclients.DtListaParticularVideos vid;
                                    uytube.web.wsclients.DtVideo aux;
                                    if (lista_videos != null) {
                                        for (int i = 0; i < lista_videos.size(); i++) {
                                            vid = (uytube.web.wsclients.DtListaParticularVideos) lista_videos.get(i);
                                            aux = c.obtenerVideo(vid.getVideo(),vid.getCanal());
                                            if (aux.getUrl() != null) {
                                                id = getID(aux.getUrl());
                                %>
                                <div class="col-md-6">
                                    <div class="card my-3">
                                        <%if(esParticular.equals("true")) {
                                        %>

                                        <a href="/uytube/EliminarVideoPlaylistParticularServlet?nomPlaylist=<%=nombrePlaylist%>&nomVideo=<%=aux.getNombre()%>&nomCanal=<%=aux.getCanal().getNombreCanal()%>">
                                            <img src="https://img.youtube.com/vi/<%=id%>/0.jpg" class="card-img-top" alt="Miniatura de video">
                                        </a>
                                        <%}
                                        else if(esParticular.equals("false")) {%>
                                        <a href="/uytube/EliminarVideoPlaylistParticularServlet?nomPlaylist=<%=nombrePlaylist%>&nomVideo=<%=aux.getNombre()%>&nomCanal=<%=aux.getCanal().getNombreCanal()%>">
                                            <img src="https://img.youtube.com/vi/<%=id%>/0.jpg" class="card-img-top" alt="Miniatura de video">
                                        </a>
                                        <%}%>
                                        <div class="card-body">
                                            <h5 class="card-title"><strong><%=aux.getNombre()%></strong></h5>
                                        </div>
                                        <div class="card-footer">
                                            <small class="text-muted">Canal: <%=aux.getCanal().getNombreCanal()%></small>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>
