<%-- 
    Document   : videos
    Created on : 12 oct. 2019, 15:47:40
    Author     : tesla
--%>
<%@include file="getID.jsp"%>
<%@page import="DataTypes.DtVideo"%>
<%@page import="java.util.List"%>
<%@ page import="uytube.web.wsclients.ControladorUsuarioService" %>
<%@ page import="uytube.web.wsclients.ControladorCanalService" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Videos</title>
    </head>
    <body>
        <br>
        <div class="container-fluid">
            <div class="card-deck">
                <div class="row align-self-center">
                    <%
                        ControladorUsuarioService us = new ControladorUsuarioService();
                        uytube.web.wsclients.IControladorUsuario u = us.getControladorUsuarioPort();
                        ControladorCanalService controlador = new ControladorCanalService();
                        uytube.web.wsclients.IControladorCanal c = controlador.getControladorCanalPort();

                        uytube.web.wsclients.DtUsuario user = null;
                        if (session.getAttribute("usuario") != null) {
                            user = (uytube.web.wsclients.DtUsuario) session.getAttribute("usuario");
                        }
                        String id;
                        DtVideo vid;
                        List videos = c.listaVideos(user.getCanal());
                        if (videos != null) {
                            for (int i = 0; i < videos.size(); i++) {
                                vid = (DtVideo) videos.get(i);
                                if (vid.getUrl() != null) {
                                    id = getID(vid.getUrl());
                    %>

                    <div class="col-md-4">
                        <div class="card mb-3">
                        <div class="card-body">
                            <a href="verVideos.jsp?video=<%=vid.getNombre()%>&canal=<%=vid.getCanal().getNombre_canal()%>">
                                <img src="https://img.youtube.com/vi/<%=id%>/0.jpg" class="card-img-top" alt="Miniatura de video">
                            </a>
                            <h5 class="card-title"><strong><%=vid.getNombre()%></strong></h5>
                            <p class="card-text"><%=vid.getDescripcion()%></p>
                        </div>
                        <div class="card-footer">
                            <small class="text-muted">Subido el: <%=vid.getFechaPublicacion().toString()%></small>
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
    </body>
</html>
