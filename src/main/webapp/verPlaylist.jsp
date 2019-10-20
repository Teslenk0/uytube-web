<%@ page import="java.util.List" %>
<%@ page import="DataTypes.DtVideo" %>
<%@ page import="DataTypes.DtUsuario" %>
<%@ page import="fabrica.Fabrica" %>
<%@ page import="interfaces.IControladorUsuario" %>
<%@ page import="interfaces.IControladorCanal" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="DataTypes.DtListaParticularVideos" %>
<%@ page import="DataTypes.DtListaDefectoVideos" %>
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
</head>
<body>
    <%  String nomLista = request.getParameter("nomLista");
        String canal = request.getParameter("user");
        String particular = request.getParameter("es_particular");
        Fabrica f = Fabrica.getInstance();
        IControladorCanal c = f.getControladorCanal();
        IControladorUsuario u = f.getControladorUsuario();
        DtUsuario user = u.buscarUsuarioCanal(canal);
        List listaVideos;
        if(particular.equals("true"))
            listaVideos = c.getVideosListaParticular(user.getNickname(), nomLista);
        else
            listaVideos = c.getVideosListaDefecto(user.getNickname(),nomLista);
    %>
<div class="barra_superior" style="background-color:#343841">
    <div class="d-inline">
        <a class="navbar-brand" href="index.jsp" style="margin-left: 46%"> <img src="assets/images/logo2.png" width="112" height="auto"></a>
    </div>
</div>
<div id="modify-user-panel" class="container" style="margin-top: 50px; margin-bottom: 50px">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header" align="center"><%=nomLista%></div>
                <div class="card-body">
                    <div class="container-fluid">
                        <div class="card-deck">
                            <% if(particular.equals("true")){ %>
                            <div class="row">
                                <%
                                    if (listaVideos != null) {
                                        DtVideo v;
                                        String id;
                                        for (int i = 0; i < listaVideos.size(); i++) {
                                            DtListaParticularVideos li = (DtListaParticularVideos) listaVideos.get(i);
                                            v = c.obtenerVideo(li.getVideo(),li.getCanal());
                                            id = getID(v.getUrl());
                                        %>
                                        <div class="col-md-6">
                                            <div class="card mb-3">
                                                <div class="card-body">
                                                    <a href="verVideos.jsp?video=<%=v.getNombre()%>&canal=<%=v.getCanal().getNombre_canal()%>">
                                                        <img src="https://img.youtube.com/vi/<%=id%>/0.jpg" class="card-img-top" alt="Miniatura de video">
                                                    </a>
                                                    <h5 class="card-title"><strong><%=v.getNombre()%></strong></h5>
                                                    <p class="card-text"><%=v.getDescripcion()%></p>
                                                </div>
                                                <div class="card-footer">
                                                    <small>Canal: <%=v.getCanal().getNombre_canal()%></small>
                                                    <br>
                                                    <small>Duracion: <%=v.getDuracion()%></small>
                                                </div>
                                            </div>
                                        </div>
                                <% }
                                }%>
                            </div>
                            <%}else{%>
                            <div class="row">
                                    <%
                                        if (listaVideos != null) {
                                            DtVideo v;
                                            String id;
                                            for (int i = 0; i < listaVideos.size(); i++) {
                                                DtListaDefectoVideos li = (DtListaDefectoVideos) listaVideos.get(i);
                                                v = c.obtenerVideo(li.getVideo(),li.getCanal());
                                                id = getID(v.getUrl());
                                    %>
                                    <div class="col-md-6">
                                        <div class="card mb-3">
                                            <div class="card-body">
                                                <a href="verVideos.jsp?video=<%=v.getNombre()%>&canal=<%=v.getCanal().getNombre_canal()%>">
                                                    <img src="https://img.youtube.com/vi/<%=id%>/0.jpg" class="card-img-top" alt="Miniatura de video">
                                                </a>
                                                <h5 class="card-title"><strong><%=v.getNombre()%></strong></h5>
                                                <p class="card-text"><%=v.getDescripcion()%></p>
                                            </div>
                                            <div class="card-footer">
                                                <small>Canal: <%=v.getCanal().getNombre_canal()%></small>
                                                <br>
                                                <small>Duracion: <%=v.getDuracion()%></small>
                                            </div>
                                        </div>
                                    </div>
                                    <%}

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
