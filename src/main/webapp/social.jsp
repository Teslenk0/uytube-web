<%@ page import="DataTypes.DtUsuario" %>
<%@ page import="fabrica.Fabrica" %>
<%@ page import="interfaces.IControladorUsuario" %>
<%@ page import="interfaces.IControladorCanal" %>
<%@ page import="DataTypes.DtCanal" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: esteban
  Date: 18/10/19
  Time: 13:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Social</title>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="assets/css/social.css">
</head>
<body>
    <%
    DtUsuario user = null;
    if (session.getAttribute("usuario") != null) {
    user = (DtUsuario) session.getAttribute("usuario");
    }
    Fabrica fabrica = Fabrica.getInstance();
    IControladorCanal c = fabrica.getControladorCanal();
    IControladorUsuario u = fabrica.getControladorUsuario();
    List listaSeguidos = u.listaSeguidos(user.getNickname());
    List listaSeguidores = u.listaSeguidores(user.getNickname());
    %>
<br>
<br>
<div class="container">
    <div class="user-profile">

        <div class="row">
            <div class="col-md-4">
                <div class="profile-info-left">
                    <!--<div class="text-center">
                        <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="Avatar" class="avatar img-circle">
                        <h2>Jack Bay</h2>
                    </div>
                    <div class="action-buttons">
                        <div class="row">
                            <div class="col-xs-6">
                                <a href="#" class="btn btn-success btn-block"><i class="fa fa-plus-round"></i> Follow</a>
                            </div>
                            <div class="col-xs-6">
                                <a href="#" class="btn btn-primary btn-block"><i class="fa fa-android-mail"></i> Message</a>
                            </div>
                        </div>
                    </div>-->
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
                            boolean aux = false;
                            for(int x=0; x<listaSeguidores.size(); x++){
                                if(listaSeguidores.get(x) != null){
                                    DtUsuario nomSeguidor = (DtUsuario) listaSeguidores.get(x);
                                    %>
                                    <div class="media user-follower">
                                        <%String ruta = "assets" + nomSeguidor.getImagen().toString();%>
                                        <img src="<%=ruta%>" alt="User Avatar" class="media-object pull-left">
                                        <div class="media-body">
                                            <a href="#"><%=nomSeguidor.getNickname()%></a>
                                            <%
                                                for(int r=0; r<listaSeguidos.size(); r++){
                                                    String usuarios = (String) listaSeguidos.get(r);
                                                    DtUsuario auxiliar = u.buscarUsuario(usuarios);
                                                    if(auxiliar.getNickname().equals(nomSeguidor.getNickname())){
                                                        aux = true;
                                                    }
                                                }
                                                if(aux == true){%>
                                                    <a href="/UnfollowUsuarioServlet?seguir=<%=nomSeguidor.getNickname()%>" class="btn btn-danger"><i class="fa fa-close-round"></i> Unfollow</i><br></a>
                                                    <%aux = false;
                                                }
                                                else{%>
                                                    <a href="/FollowUsuarioServlet?seguir=<%=nomSeguidor.getNickname()%>" class="btn btn-success" ><i class="fa fa-checkmark-round"></i> Follow</i><br></a>
                                                <%}%>

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
                                    //System.out.println("nombre del seguidor en string: "+userSeguidos.getNickname());
                                %>
                                <div class="media user-follower" style="margin-top: 30px">
                                    <%String ruta = "assets" + userSeguidos.getImagen().toString();%>
                                    <img src="<%=ruta%>" alt="User Avatar" class="media-object pull-left">
                                    <div class="media-body">
                                        <a href="#"><%=userSeguidos.getNickname()%></a>
                                        <a href="/UnfollowUsuarioServlet?seguir=<%=userSeguidos.getNickname()%>" class="btn btn-danger"><i class="fa fa-close-round"></i> Unfollow</i><br></a>
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
