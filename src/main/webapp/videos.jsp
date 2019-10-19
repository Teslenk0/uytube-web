<%-- 
    Document   : videos
    Created on : 12 oct. 2019, 15:47:40
    Author     : tesla
--%>
<%@include file="getID.jsp"%>
<%@page import="DataTypes.DtUsuario"%>
<%@page import="DataTypes.DtVideo"%>
<%@page import="java.util.List"%>
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
                        DtUsuario user = null;
                        if (session.getAttribute("usuario") != null) {
                            user = (DtUsuario) session.getAttribute("usuario");
                        }
                        String id;
                        DtVideo vid;
                        if (session.getAttribute("videos") != null) {
                            List videos = (List) session.getAttribute("videos");
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
