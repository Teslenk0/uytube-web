<%@ page import="java.util.List" %>
<%@ page import="DataTypes.DtVideo" %>
<%@ page import="DataTypes.DtUsuario" %>
<%@ page import="fabrica.Fabrica" %>
<%@ page import="interfaces.IControladorUsuario" %>
<%@ page import="interfaces.IControladorCanal" %>
<%@ page import="java.util.ArrayList" %>
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
                                    String nombrePlaylist = request.getParameter("nomLista");
                                    DtUsuario user = null;
                                    if (session.getAttribute("usuario") != null) {
                                        user = (DtUsuario) session.getAttribute("usuario");
                                    }

                                    Fabrica fabrica = Fabrica.getInstance();
                                    IControladorUsuario controladorUsuario = fabrica.getControladorUsuario();
                                    IControladorCanal controladorCanal = fabrica.getControladorCanal();

                                    List<DtVideo> videosUser = new ArrayList<>();
                                    videosUser=(List) session.getAttribute("videos");
                                    List<DtVideo> lista_videos = new ArrayList<>();
                                    lista_videos.addAll(videosUser);

                                    List usuarios = controladorUsuario.listaUsuarios();

                                    List aux = null;
                                    DtVideo vidActual;
                                    DtUsuario userActual = null;

                                    String esParticular = request.getParameter("es_particular");
                                    for(int x = 0; x < usuarios.size(); x++) {
                                        userActual = (DtUsuario) usuarios.get(x);
                                        if(!userActual.getNickname().equals(user.getNickname())) {
                                            aux = controladorCanal.listaVideos(userActual.getCanal());
                                            if(!aux.isEmpty()) {
                                                for (int y = 0; y < aux.size(); y++) {
                                                    vidActual = (DtVideo) aux.get(y);
                                                    if (!vidActual.getPrivado()) {
                                                        lista_videos.add(vidActual);
                                                    }
                                                }
                                            }
                                        }
                                    }

                                    String id;
                                    DtVideo vid = null;

                                    if (lista_videos != null) {
                                        for (int i = 0; i < lista_videos.size(); i++) {
                                            vid = (DtVideo) lista_videos.get(i);
                                            if (vid.getUrl() != null) {
                                                //getID es la funcion definida en el .jsp con el mismo nombre (getID.jsp)
                                                id = getID(vid.getUrl());
                                %>
                            <div class="col-md-4">
                                <div class="mb-3">
                                    <div class="card-body">
                                        <%if(esParticular.equals("true")) {
                                        %>
                                            <a href="/uytube/AgregarVideoPlaylistParticularServlet?nomPlaylist=<%=nombrePlaylist%>&nomVideo=<%=vid.getNombre()%>&nomCanal=<%=vid.getCanal().getNombre_canal()%>">
                                                <img src="https://img.youtube.com/vi/<%=id%>/0.jpg" class="card-img-top" alt="Miniatura de video">
                                            </a>
                                        <%}
                                        else if(esParticular.equals("false")) {%>
                                            <a href="/uytube/AgregarVideoPlaylistDefectoServlet?nomPlaylist=<%=nombrePlaylist%>&nomVideo=<%=vid.getNombre()%>&nomCanal=<%=vid.getCanal().getNombre_canal()%>">
                                                <img src="https://img.youtube.com/vi/<%=id%>/0.jpg" class="card-img-top" alt="Miniatura de video">
                                            </a>
                                        <%}%>
                                        <h5 class="card-title"><strong><%=vid.getNombre()%></strong></h5>
                                    </div>
                                    <div class="card-footer">
                                        <small class="text-muted">Canal: <%=vid.getCanal().getNombre_canal()%></small>
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
