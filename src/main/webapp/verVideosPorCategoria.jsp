<%@ page import="java.util.List" %>
<%@ page import="fabrica.Fabrica" %>
<%@ page import="interfaces.IControladorCanal" %>
<%@ page import="DataTypes.DtVideo" %>
<%@ page import="DataTypes.DtListaParticularVideos" %>
<%@ page import="DataTypes.DtListaParticulares" %>
<%@ page import="interfaces.IControladorUsuario" %>
<%@include file="getPrimerVideoListaParticular.jsp"%>
<%--
  Created by IntelliJ IDEA.
  User: esteban
  Date: 19/10/19
  Time: 20:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link rel="stylesheet" type="text/css" href="assets/css/modificaruser.css">
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <title>Videos</title>
</head>
<body>
<div class="barra_superior" style="background-color:#343841">
    <div class="d-inline">
        <a class="navbar-brand" href="index.jsp" style="margin-left: 45%"> <img src="assets/images/logo2.png" width="112" height="auto"></a>
    </div>
</div>
<%
    Fabrica fabrica = Fabrica.getInstance();
    IControladorCanal c = fabrica.getControladorCanal();
    IControladorUsuario u = fabrica.getControladorUsuario();
    String categoria = request.getParameter("categoria");
    List listaVidCat = c.listarVideosPorCategoria(categoria);
    List listaPlaylistCat = c.obtenerListasParticularesPorCategoria(categoria);

%>
    <div id="modify-user-panel" class="container" style="margin-top: 50px; margin-bottom: 50px">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">Lista por categoria: <%=categoria%></div>
                    <div class="card-body">
                        <div class="container-fluid">
                            <div class="card-deck">
                                <div class="row align-self-center">
                                    <%
                                    DtVideo vid;
                                    DtListaParticulares playlist = null;
                                    String id;
                                    if(listaVidCat != null){
                                        for(int x = 0; x<listaVidCat.size(); x++){
                                            vid = (DtVideo) listaVidCat.get(x);
                                            if (vid.getUrl() != null) {
                                                id = getID(vid.getUrl());
                                                if(!vid.getPrivado()){%>
                                                    <div class="col-md-4">
                                                        <div class="card mb-3">
                                                            <div class="card-body">
                                                                <a href="verVideos.jsp?video=<%=vid.getNombre()%>&canal=<%=vid.getCanal().getNombre_canal()%>">
                                                                    <img src="https://img.youtube.com/vi/<%=id%>/0.jpg" class="card-img-top" alt="Miniatura de video">
                                                                </a>
                                                                <h5 class="card-title"><strong><%=vid.getNombre()%></strong></h5>
                                                                <p class="card-text">Video</p>
                                                            </div>
                                                            <div class="card-footer">
                                                                <small class="text-muted">Propietario: <%=vid.getCanal().getNombre_canal()%></small>
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
                                            playlist = (DtListaParticulares) listaPlaylistCat.get(y);
                                            DtUsuario usuario = u.buscarUsuarioCanal(playlist.getCanal().getNombre_canal());
                                            datos = getPrimerVideoListaParticular(playlist, usuario.getNickname());
                                            if (datos != null) {
                                                if(!playlist.getPrivado()){%>
                                                    <div class="col-md-4">
                                                        <div class="card mb-3">
                                                                <div class="card-body">
                                                                    <a href="verPlaylist.jsp?nomLista=<%=playlist.getNombreLista()%>&user=<%=playlist.getCanal().getNombre_canal()%>&es_particular=true">
                                                                        <img src="https://img.youtube.com/vi/<%=datos[0].toString()%>/0.jpg" class="card-img-top" alt="Miniatura de lista">
                                                                    </a>
                                                                    <h5 class="card-title"><strong><%=playlist.getNombreLista()%></strong></h5>
                                                                    <p class="card-text">Lista de Reproduccion</p>
                                                                </div>
                                                                    <div class="card-footer">
                                                                        <small class="text-muted">Propietario: <%=playlist.getCanal().getNombre_canal()%></small>
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
