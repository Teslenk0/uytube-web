<%-- 
    Document   : videos
    Created on : 12 oct. 2019, 15:47:40
    Author     : tesla
--%>
<%@include file="getID.jsp"%>
<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="DataTypes.DtVideo"%>
<%@page import="java.util.List"%>
<%@page import="DataTypes.DtUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Videos</title>
    </head>
    <body>
        <br>
        <br>

        <div class="container-fluid" id="panelVideos">
            <div class="row">
                <div class="card-group">
                    <%
                        DtUsuario user = null;
                        if (session.getAttribute("usuario") != null) {
                            user = (DtUsuario) session.getAttribute("usuario");
                        }
                        String id;
                        DtVideo vid = null;
                        if (session.getAttribute("videos") != null) {
                            List videos = (List) session.getAttribute("videos");
                            for (int i = 0; i < videos.size(); i++) {
                                vid = (DtVideo) videos.get(i);
                                if (vid.getUrl() != null) {
                                    //getID es la funcion definida en el .jsp con el mismo nombre (getID.jsp)
                                    id = getID(vid.getUrl());
                    %>

                    <div class="card">
                        <a href="verVideos.jsp?variable1=<%=id%>"><img src="https://img.youtube.com/vi/<%=id%>/0.jpg" name="<%=id%>" id="<%=id%>" class="card-img-top" alt="Miniatura de video"></a>
                            <h5 class="card-title"><strong><%=vid.getNombre()%></strong></h5>
                            <p class="card-text"><%=vid.getDescripcion()%></p>
                        </div>
                        <div class="card-footer">
                            <small class="text-muted">Subido el: <%=vid.getFechaPublicacion().toString()%></small>
                        </div>
                    </div>

                    <!--<div class="col">
                        <div class="form-group col-md-12">
                            <a href="#verVideo" target="_blank">
                                <img src="https://img.youtube.com/vi/<%=id%>/0.jpg" alt="Miniatura video">
                            </a>
                            <div class="embed-responsive embed-responsive-16by9">
                                <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/<%=id%>?modestbranding=1" allowfullscreen></iframe>
                                
                            </div>
                            <a><h5><%=vid.getNombre()%></h5></a>
                        </div>
                    </div>-->
                    <%         }
                            }
                        }
                    %>
                </div>
            </div>
        </div>
    </body>
</html>
