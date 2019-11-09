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
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link rel="stylesheet" type="text/css" href="assets/css/modificaruser.css">
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <title>Videos</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
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
        if(particular.equals("true"))
            listaVideos = c.getVideosListaParticular(user.getNickname(), nomLista);
        else
            listaVideos = c.getVideosListaDefecto(user.getNickname(),nomLista);
    %>
<div class="barra_superior text-center" style="background-color:#343841">
    <div class="d-inline">
        <a class="navbar-brand" href="index.jsp"> <img src="assets/images/logo2.png" width="112" height="auto"></a>
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
</body>
</html>
