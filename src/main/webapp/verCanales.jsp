<%@ page import="fabrica.Fabrica" %>
<%@ page import="interfaces.IControladorUsuario" %>
<%@ page import="DataTypes.DtUsuario" %>
<%@ page import="java.util.List" %><%--
    Document   : inicio
    Created on : 12 oct. 2019, 13:32:29
    Author     : tesla
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <% String nomCanal = request.getParameter("nomCanal");
            session.setAttribute("nomCanal",nomCanal);
            Fabrica f = Fabrica.getInstance();
            IControladorUsuario u = f.getControladorUsuario();
            DtUsuario user = u.buscarUsuarioCanal(nomCanal);

            List listaSeguidos = null;
            DtUsuario logiado = null;
            if (session.getAttribute("usuario") != null) {
                logiado = (DtUsuario) session.getAttribute("usuario");
                listaSeguidos = u.listaSeguidos(logiado.getNickname());
            }
        %>
        <title><%=nomCanal%></title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"
              id="bootstrap-css">
        <link rel="stylesheet" type="text/css" href="assets/css/index.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">

    </head>
    <body>
        <div class="barra_superior" style="background-color:#343841">
            <div class="d-inline">
                <a class="navbar-brand" href="index.jsp" style="margin-left: 46%"> <img src="assets/images/logo2.png" width="112" height="auto"></a>
            </div>
        </div>
        <hr>
            <div class="form-group">
            <%String ruta = "assets" + user.getImagen();%>
            <img class="img-thumbnail" src="<%=ruta%>" style="margin-left: 45%" alt="User picture">
            <hr>
            <%
                if(logiado!=null){
                    boolean aux = false;
                    for(int r=0; r<listaSeguidos.size(); r++){
                        String usuarios = (String) listaSeguidos.get(r);
                        DtUsuario auxiliar = u.buscarUsuario(usuarios);
                        if(auxiliar.getNickname().equals(user.getNickname())){
                            aux = true;
                        }
                    }%>
                    <h5 align="center">Canal de <%=user.getNickname()%></h5>
                    <%if(aux == true){%>
                        <a href="/UnfollowUsuarioServlet?seguir=<%=user.getNickname()%>" style="margin-left: 48%" class="btn btn-danger"><i class="fa fa-close-round"></i> Unfollow</i><br></a>
                    <%
                    }
                    else{%>
                        <a href="/FollowUsuarioServlet?seguir=<%=user.getNickname()%>" style="margin-left: 48%" class="btn btn-success" ><i class="fa fa-checkmark-round"></i> Follow</i><br></a>
                    <%}
                }else{%>
                    <h5 align="center">Canal de <%=user.getNickname()%></h5>
                <%}
            %>
            </div>
        <hr>
        <ul class="nav nav-tabs" id="myTab" role="tablist">
            <li class="nav-item">
                <a class="nav-link active" id="videos-tab" href="#videos" role="tab" aria-controls="videos" aria-selected="true">Videos
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
                <a class="nav-link" id="informacion-tab" href="#informacion" role="tab" aria-controls="informacion" aria-selected="false">Informacion
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

        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
                crossorigin="anonymous"></script>
    </body>
</html>
