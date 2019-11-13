<%@ page import="uytube.web.wsclients.DtUsuario" %>
<%@ page import="java.util.List" %>
<%@ page import="uytube.web.wsclients.ControladorCanalService" %>
<%@ page import="uytube.web.wsclients.ControladorUsuarioService" %>
<%@ page contentType="text/html;charset=UTF-8"%>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Social</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/social.css">
</head>
<body>
    <%
    uytube.web.wsclients.DtUsuario user = null;
    if (session.getAttribute("usuario") != null) {
    user = (DtUsuario) session.getAttribute("usuario");
    }
    ControladorCanalService controllerCanal = new ControladorCanalService();
    uytube.web.wsclients.IControladorCanal c = controllerCanal.getControladorCanalPort();

    ControladorUsuarioService controllerUser = new ControladorUsuarioService();
    uytube.web.wsclients.IControladorUsuario u = controllerUser.getControladorUsuarioPort();

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
                    <div class="section">
                        <h3>Descripción de Canal</h3>
                        <p><%=user.getCanal().getDescripcion()%></p>
                    </div>
                    <div class="section">
                        <h3>Estadísticas</h3>
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
                                        <%String ruta = "/assets" + nomSeguidor.getImagen();%>
                                        <img src="<%=ruta%>" alt="User Avatar" class="media-object pull-left">
                                        <div class="media-body">
                                            <a href="verCanales.jsp?nomCanal=<%=nomSeguidor.getCanal().getNombreCanal()%>" style="margin-left: 10px"><%=nomSeguidor.getNickname()%></a>
                                            <%
                                                for(int r=0; r<listaSeguidos.size(); r++){
                                                    String usuarios = (String) listaSeguidos.get(r);
                                                    DtUsuario auxiliar = u.buscarUsuario(usuarios);
                                                    if(auxiliar.getNickname().equals(nomSeguidor.getNickname())){
                                                        aux = true;
                                                    }
                                                }
                                                if(aux == true){%>
                                                    <a href="/uytube/UnfollowUsuarioServlet?seguir=<%=nomSeguidor.getNickname()%>" class="btn btn-danger"><i class="fa fa-close-round"></i> Unfollow</i><br></a>
                                                    <%aux = false;
                                                }
                                                else{%>
                                                    <a href=/uytube/FollowUsuarioServlet?seguir=<%=nomSeguidor.getNickname()%>" class="btn btn-success" ><i class="fa fa-checkmark-round"></i> Follow</i><br></a>
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
                                %>
                                <div class="media user-follower" style="margin-top: 30px">
                                    <%String ruta = "/assets" + userSeguidos.getImagen();%>
                                    <img src="<%=ruta%>" alt="User Avatar" class="media-object pull-left">
                                    <div class="media-body">
                                        <a href="verCanales.jsp?nomCanal=<%=userSeguidos.getCanal().getNombreCanal()%>" style="margin-left: 10px"><%=userSeguidos.getNickname()%></a>
                                        <a href="/uytube/UnfollowUsuarioServlet?seguir=<%=userSeguidos.getNickname()%>" class="btn btn-danger"><i class="fa fa-close-round"></i> Unfollow</i><br></a>
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
