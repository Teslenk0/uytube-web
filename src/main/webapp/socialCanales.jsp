<%@ page import="uytube.web.wsclients.DtUsuario" %>

<%@ page import="java.util.List" %>
<%@ page import="uytube.web.wsclients.ControladorUsuarioService" %>
<%--
  Created by IntelliJ IDEA.
  User: esteban
  Date: 18/10/19
  Time: 13:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Social</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/social.css">
</head>
<body style="background-color: #EEEEEE">
    <%
        String nomCanal = (String) session.getAttribute("nomCanal");
        ControladorUsuarioService controllerUser = new ControladorUsuarioService();
        uytube.web.wsclients.IControladorUsuario u = controllerUser.getControladorUsuarioPort();

        DtUsuario user = u.buscarUsuarioCanal(nomCanal);
        List listaSeguidos = u.listaSeguidos(user.getNickname());
        List listaSeguidores = u.listaSeguidores(user.getNickname());
    %>
<br>
<div class="container">
    <div class="user-profile">
        <div class="row">
            <div class="col-md-4">
                <div class="profile-info-left">
                    <div class="section">
                        <h3>Descripcion canal</h3>
                        <p><%=user.getCanal().getDescripcion()%></p>
                    </div>
                    <div class="section">
                        <h3>Estadisticas</h3>
                        <%
                        if(!listaSeguidos.isEmpty()){%>
                            <p><span class="badge"><%=listaSeguidos.size()%></span> Seguidos</p>
                        <%}
                        else{%>
                            <p><span class="badge">0</span> Seguidos</p>
                        <%}
                        if(!listaSeguidores.isEmpty()){%>
                            <p><span class="badge"><%=listaSeguidores.size()%></span> Seguidores</p>
                        <%}
                        else{%>
                            <p><span class="badge">0</span> Seguidores</p>
                        <%}%>

                    </div>
                    <div class="section">
                        <h3>Social</h3>
                        <ul class="list-unstyled list-social">
                            <li><a href="#"><i class="fa fa-twitter"></i> @<%=user.getNickname()%></a></li>
                            <li><a href="#"><i class="fa fa-facebook"></i> <%=user.getNickname()%></a></li>
                            <li><a href="#"><i class="fa fa-dribbble"></i> <%=user.getNickname()%></a></li>
                            <li><a href="#"><i class="fa fa-linkedin"></i> <%=user.getNickname()%></a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-md-8">
                <div class="profile-info-right">
                    <ul class="nav nav-pills nav-pills-custom-minimal custom-minimal-bottom">
                        <li><a data-toggle="tab">Seguidores</a></li>
                    </ul>
                    <div class="tab-content">
                        <!-- followers -->
                        <%
                        if(!listaSeguidores.isEmpty()){
                            for(int x=0; x<listaSeguidores.size(); x++){
                                if(listaSeguidores.get(x) != null){
                                    DtUsuario nomSeguidor = (DtUsuario) listaSeguidores.get(x);
                                    %>
                                    <div class="media user-follower">
                                        <%String ruta = "/assets" + nomSeguidor.getImagen();%>
                                        <img src="<%=ruta%>" alt="User Avatar" class="media-object pull-left">
                                        <div class="media-body">
                                            <a href="verCanales.jsp?nomCanal=<%=nomSeguidor.getCanal().getNombreCanal()%>" style="margin-left: 10px"><%=nomSeguidor.getNickname()%></a>
                                        </div>
                                    </div>
                                <!-- end followers -->
                                <%}
                            }
                         }%>
                        <!-- following -->
                        <ul class="nav nav-pills nav-pills-custom-minimal custom-minimal-bottom">
                        <li><a data-toggle="tab">Seguidos</a></li>
                        </ul>
                        <%
                        if(!listaSeguidos.isEmpty()){
                            for(int y=0; y<listaSeguidos.size(); y++){
                                if(listaSeguidos.get(y) != null){
                                    String aux = (String) listaSeguidos.get(y);
                                    DtUsuario userSeguidos = u.buscarUsuario(aux);
                                %>
                                <div class="media user-follower" style="margin-top: 30px">
                                    <%String ruta = "/assets" + userSeguidos.getImagen();%>
                                    <img src="<%=ruta%>" alt="User Avatar" class="media-object pull-left">
                                    <div class="media-body">
                                        <a href="verCanales.jsp?nomCanal=<%=userSeguidos.getCanal().getNombreCanal()%>" style="margin-left: 10px"><%=userSeguidos.getNickname()%></a>
                                    </div>
                                </div>
                            <%}
                            }
                        }%>
                        <!-- end following -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
