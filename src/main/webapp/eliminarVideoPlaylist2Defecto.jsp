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
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link rel="stylesheet" type="text/css" href="assets/css/modificaruser.css">
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <title>Eliminar Video</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
</head>
<body style="background-color: #EEEEEE">

<!-- BARRA SUPERIOR -->
<div class="barra_superior text-center" style="background-color:#343841">
    <div class="d-inline">
        <a class="navbar-brand" href="index.jsp"> <img src="assets/images/logo2.png" width="112" height="auto"></a>
    </div>
</div>

<div id="modify-user-panel" class="container" style="margin-top: 50px; margin-bottom: 50px">
    <%
        ControladorCanalService controlador = new ControladorCanalService();
        uytube.web.wsclients.IControladorCanal c = controlador.getControladorCanalPort();

        String nombrePlaylist = request.getParameter("nomLista");
        uytube.web.wsclients.DtUsuario user = null;
        if (session.getAttribute("usuario") != null) {
            user = (uytube.web.wsclients.DtUsuario) session.getAttribute("usuario");
        }

        String esParticular = request.getParameter("es_particular");
        List lista_videos;
        lista_videos= c.getVideosListaDefecto(user.getNickname(),nombrePlaylist);%>
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
                                    uytube.web.wsclients.DtListaDefectoVideos vid;
                                    uytube.web.wsclients.DtVideo aux;
                                    if (lista_videos != null) {
                                        for (int i = 0; i < lista_videos.size(); i++) {
                                            vid = (uytube.web.wsclients.DtListaDefectoVideos) lista_videos.get(i);
                                            aux = c.obtenerVideo(vid.getVideo(),vid.getCanal());
                                            if (aux.getUrl() != null) {
                                                id = getID(aux.getUrl());
                                %>
                                <div class="col-md-6">
                                    <div class="card my-3">
                                        <%if(esParticular.equals("true")) {
                                        %>
                                        <a href="/uytube/EliminarVideoPlaylistDefectoServlet?nomPlaylist=<%=nombrePlaylist%>&nomVideo=<%=aux.getNombre()%>&nomCanal=<%=aux.getCanal().getNombreCanal()%>">
                                            <img src="https://img.youtube.com/vi/<%=id%>/0.jpg" class="card-img-top" alt="Miniatura de video">
                                        </a>
                                        <%}
                                        else if(esParticular.equals("false")) {%>
                                        <a href="/uytube/EliminarVideoPlaylistDefectoServlet?nomPlaylist=<%=nombrePlaylist%>&nomVideo=<%=aux.getNombre()%>&nomCanal=<%=aux.getCanal().getNombreCanal()%>">
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
</body>
</html>
