
<%@ page import="uytube.web.wsclients.DtUsuario" %>
<%@ page import="java.util.List" %>
<%@ page import="uytube.web.wsclients.ControladorUsuarioService" %><%--
    Document   : inicio
    Created on : 12 oct. 2019, 13:32:29
    Author     : tesla
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <% String nomCanal = request.getParameter("nomCanal");
            session.setAttribute("nomCanal",nomCanal);
            ControladorUsuarioService controllerUser = new ControladorUsuarioService();
            uytube.web.wsclients.IControladorUsuario u = controllerUser.getControladorUsuarioPort();
            uytube.web.wsclients.DtUsuario user = u.buscarUsuarioCanal(nomCanal);

            List listaSeguidos = null;
            DtUsuario logiado = null;
            if (session.getAttribute("usuario") != null) {
                logiado = (DtUsuario) session.getAttribute("usuario");
                listaSeguidos = u.listaSeguidos(logiado.getNickname());
            }
        %>
        <title><%=nomCanal%></title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.6/css/all.css">

        <script type="text/javascript" src="assets/js/jquery-3.4.1.min.js"></script>
    </head>
    <body style="background-color: #EEEEEE">
        <div class="barra_superior text-center" style="background-color:#343841">
            <div class="d-inline">
                <a class="navbar-brand" href="index.jsp"> <img src="assets/images/logo2.png" width="112" height="auto"></a>
            </div>
        </div>
        <hr>
            <div class="form-group text-center">
            <%String ruta = "/assets" + user.getImagen();%>
            <img class="img-thumbnail" src="<%=ruta%>" style=" width: 160px; height: auto" alt="User picture">
            <hr>
            <%
                if(logiado!=null && !user.getNickname().equals(logiado.getNickname())){
                    boolean aux = false;
                    for(int r=0; r<listaSeguidos.size(); r++){
                        String usuarios = (String) listaSeguidos.get(r);
                        uytube.web.wsclients.DtUsuario auxiliar = u.buscarUsuario(usuarios);
                        if(auxiliar.getNickname().equals(user.getNickname())){
                            aux = true;
                        }
                    }%>
                    <h5 align="center">Canal de <%=user.getNickname()%></h5>
                    <%if(aux == true){%>
                        <a href="/uytube/UnfollowUsuarioServlet?seguir=<%=user.getNickname()%>" class="btn btn-danger"><i class="fa fa-close-round"></i> Unfollow</i><br></a>
                    <%
                    }
                    else{%>
                        <a href="/uytube/FollowUsuarioServlet?seguir=<%=user.getNickname()%>" class="btn btn-success" ><i class="fa fa-checkmark-round"></i> Follow</i><br></a>
                    <%}
                }else{%>
                    <h5 align="center">Canal de <%=user.getNickname()%></h5>
                <%}
            %>
            </div>
        <hr>
        <ul class="nav nav-tabs" id="myTab" role="tablist">
            <li class="nav-item">
                <a class="nav-link active" id="videos-tab" href="#videos" role="tab" aria-controls="videos" aria-selected="true">Vídeos
                    <i class="fas fa-play"></i>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="playlists-tab" href="#playlists" role="tab" aria-controls="playlists" aria-selected="false">PlayLists
                    <i class="fa fa-list"></i>  
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="social-tab" href="#social" role="tab" aria-controls="social" aria-selected="false">Social
                    <i class="fas fa-users"></i>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="informacion-tab" href="#informacion" role="tab" aria-controls="informacion" aria-selected="false">Información
                    <i class="fas fa-address-card"></i>
                </a>
            </li>
        </ul>
        <div class="tab-content">
            <div class="tab-pane fade show active" id="videos" role="tabpanel" aria-labelledby="videos-tab"></div>
            <div class="tab-pane fade" id="playlists" role="tabpanel" aria-labelledby="playlists-tab"></div>
            <div class="tab-pane fade" id="social" role="tabpanel" aria-labelledby="social-tab"></div>
            <div class="tab-pane fade" id="informacion" role="tabpanel" aria-labelledby="informacion-tab"></div>
        </div>
        <script src="assets/js/verCanales.js" type="text/javascript"></script>
        <script>
            $(document).ready(function () {
                $("#videos-tab").click();
            });
        </script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>
</html>
