<%@ page import="java.util.List" %>
<%@ page import="uytube.web.wsclients.ControladorCanalService" %>

<%@ page import="uytube.web.wsclients.ControladorUsuarioService" %>
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
    <title>Vídeos de Playlist</title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="assets/css/modificaruser.css">

    <script type="text/javascript" src="assets/js/jquery-3.4.1.min.js"></script>
</head>
<body style="background-color: #EEEEEE">
    <%  String nomLista = request.getParameter("nomLista");
        String canal = request.getParameter("user");
        String particular = request.getParameter("es_particular");

        ControladorCanalService controllerCanal = new ControladorCanalService();
        uytube.web.wsclients.IControladorCanal c =  controllerCanal.getControladorCanalPort();

        ControladorUsuarioService controllerUser = new ControladorUsuarioService();
        uytube.web.wsclients.IControladorUsuario u = controllerUser.getControladorUsuarioPort();

        uytube.web.wsclients.DtUsuario user = u.buscarUsuarioCanal(canal);
        
        List listaVideos;
        if(particular.equals("true") && !nomLista.equals("Historial"))
            listaVideos = c.getVideosListaParticular(user.getNickname(), nomLista);
        else if(!nomLista.equals("Historial"))
            listaVideos = c.getVideosListaDefecto(user.getNickname(),nomLista);
        else
            listaVideos = c.obtenerVideosHistoricos(user.getCanal());
    %>
<div class="barra_superior text-center" style="background-color:#343841">
    <div class="d-inline">
        <a class="navbar-brand" href="index.jsp"> <img src="assets/images/logo2.png" width="112" height="auto" alt=""></a>
    </div>
</div>
<div id="modify-user-panel" class="container" style="margin-top: 50px; margin-bottom: 50px">
    <div class="row justify-content-center">
        <div class="col-md-10">
            <div class="card">
                <div class="card-header text-center"><%=nomLista%></div>
                <div class="card-body">
                    <%if(listaVideos.isEmpty()){%>
                    <p class="card-text text-center">Esta lista no contiene videos</p>
                    <%}%>
                        <div class="card-group">
                            <% if(particular.equals("true")){ %>
                                <%
                                    if (!listaVideos.isEmpty()) {
                                        uytube.web.wsclients.DtVideo v;
                                        String id;
                                        for (int i = 0; i < listaVideos.size(); i++) {
                                            uytube.web.wsclients.DtListaParticularVideos li = (uytube.web.wsclients.DtListaParticularVideos) listaVideos.get(i);
                                            v = c.obtenerVideo(li.getVideo(),li.getCanal());
                                            id = getID(v.getUrl());
                                        %>
                                        <div class="col-md-6">
                                            <div class="card my-3">
                                                <a href="verVideos.jsp?video=<%=v.getNombre()%>&canal=<%=v.getCanal().getNombreCanal()%>">
                                                    <img src="https://img.youtube.com/vi/<%=id%>/0.jpg" class="card-img-top" alt="Miniatura de video">
                                                </a>
                                                <div class="card-body">
                                                    <h5 class="card-title"><strong><%=v.getNombre()%></strong></h5>
                                                    <p class="card-text"><%=v.getDescripcion()%></p>
                                                </div>
                                                <div class="card-footer">
                                                    <small>Canal: <%=v.getCanal().getNombreCanal()%></small>
                                                    <br>
                                                    <small>Duración: <%=v.getDuracion()%></small>
                                                </div>
                                            </div>
                                        </div>
                                <% }
                                }%>
                        </div>
                            <%}else{%>
                                    <%
                                        if (!listaVideos.isEmpty()) {
                                            uytube.web.wsclients.DtVideo v;
                                            String id;
                                            for (int i = 0; i < listaVideos.size(); i++) {
                                                uytube.web.wsclients.DtListaDefectoVideos li = (uytube.web.wsclients.DtListaDefectoVideos) listaVideos.get(i);
                                                v = c.obtenerVideo(li.getVideo(),li.getCanal());
                                                id = getID(v.getUrl());
                                    %>
                                    <div class="col-md-6">
                                        <div class="card my-3">
                                            <a href="verVideos.jsp?video=<%=v.getNombre()%>&canal=<%=v.getCanal().getNombreCanal()%>">
                                                <img src="https://img.youtube.com/vi/<%=id%>/0.jpg" class="card-img-top" alt="Miniatura de video">
                                            </a>
                                            <div class="card-body">
                                                <h5 class="card-title"><strong><%=v.getNombre()%></strong></h5>
                                                <p class="card-text"><%=v.getDescripcion()%></p>
                                            </div>
                                            <div class="card-footer">
                                                <small>Canal: <%=v.getCanal().getNombreCanal()%></small>
                                                <br>
                                                <small>Duración: <%=v.getDuracion()%></small>
                                            </div>
                                        </div>
                                    </div>
                                    <%}

                                    }
                                    }%>
                </div>
            </div>
        </div>
    </div>
</div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>
