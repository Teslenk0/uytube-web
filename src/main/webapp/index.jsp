<%@page import="DataTypes.DtVideo"%>
<%@page import="java.util.List"%>
<%@page import="DataTypes.DtUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Inicio</title>
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"
              id="bootstrap-css">
        <link rel="stylesheet" type="text/css" href="assets/css/index.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

        <!-- cosas barra lateral
            <script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script> -->

        <!------ Include the above in your HEAD tag
        <link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">---------->
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description"
              content="Responsive sidebar template with sliding effect and dropdown menu based on bootstrap 3">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
        <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    </head>

    <body>
        <%
            //allow access only if session exists
            DtUsuario user = null;
            if (session.getAttribute("usuario") != null) {
                user = (DtUsuario) session.getAttribute("usuario");
        %>
        <script>
            $(document).ready(function () {
                var panel = $("#panelcentral");
                panel.load("inicio.jsp");
            });
        </script>
        <%
            }
        %>
        <!-- BARRA SUPERIOR -->
        <div class="barra_superior" style="background-color:black">
            <div class="d-inline">
                <a class="navbar-brand" href="index.jsp" style="margin-left: 45%"> <img src="assets/images/logo2.png"
                                                                                        width="112" height="auto"></a>
            </div>
        </div>


        <!-- ACA BARRA LATERAL -->
        <div class="page-wrapper chiller-theme toggled">
            <a id="show-sidebar" class="btn btn-sm btn-dark" href="#">
                <i class="fas fa-bars"></i>
            </a>
            <nav id="sidebar" class="sidebar-wrapper">
                <div class="sidebar-content">
                    <div class="sidebar-brand">
                        <a href="#">UyTube</a>
                        <div id="close-sidebar">
                            <i class="fas fa-times"></i>
                        </div>
                    </div>
                    <div class="sidebar-header">
                        <div class="user-pic">
                            <%if (user == null) {%>
                            <img class="img-responsive img-rounded"
                                 src="assets/imagenesUsuarios/Defecto.png"
                                 alt="User picture">
                            <%} else {
                                String ruta = "assets" + user.getImagen().toString();%>
                            <img class="img-responsive img-rounded" src="<%=ruta%>" alt="User picture">
                            <%}%>
                        </div>
                        <div class="user-info">
                            <span class="user-name">
                                <% if (user != null) {%>
                                <strong><%=user.getNickname().toString()%> </strong>
                                <%} else {%>
                                <strong>Invitado</strong>
                                <%}%>
                            </span>

                            <span class="user-status">
                                <% if (user != null) {%>
                                <i class="fa fa-circle"></i>
                                <span>Online</span>
                                <%} else {%>
                                <i class="fa fa-circle" style="color: red"></i>
                                <span>Offline</span>
                                <%}%>
                            </span>
                        </div>
                    </div>
                    <!-- sidebar-header  -->
                    <div class="sidebar-search">
                        <div>
                            <% if (user == null) {%>
                            <a href="login.jsp" style="margin-left: 25%">
                                <span>Iniciar Sesion</span>
                            </a>
                            <%} else {%>
                            <a href="LogoutServlet" style="margin-left: 25%">
                                <span>Cerrar Sesion</span>
                            </a>
                            <%}%>
                            <div class="input-group">
                                <input type="text" class="form-control search-menu" placeholder="Buscar...">
                                <div class="input-group-append">
                                    <span class="input-group-text">
                                        <i class="fa fa-search" aria-hidden="true"></i>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- sidebar-search  -->
                    <% if (user != null) {%>
                    <div class="sidebar-menu">
                        <ul>
                            <li class="sidebar-dropdown">
                                <a href="#">
                                    <i class="fa fa-user"></i>
                                    <span>Usuario</span>
                                </a>
                                <div class="sidebar-submenu">
                                    <ul>
                                        <li>
                                            <a href="#">Consulta
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#" id="modificoUser_btn">Modificar
                                            </a>
                                            <header class="header">
                                                <nav class="navbar navbar-toggleable-md navbar-light pt-0 pb-0 ">

                                                </nav>
                                            </header>

                                            <script type="text/javascript" src="/assets/js/barralateral_index.js"></script></a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="sidebar-dropdown">
                                <a href="#">
                                    <i class="fa fa-video"></i>
                                    <span>Videos</span>
                                </a>
                                <div class="sidebar-submenu">
                                    <ul>
                                        <li>
                                            <a href="#">Consulta Video

                                            </a>
                                        </li>
                                        <li>
                                            <a href="#" id="modificoVideo_btn">Modificar Video</a>
                                        </li>
                                        <li>
                                            <a href="#" id="altaVideo_btn">Subir Video</a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                            <li class="sidebar-dropdown">
                                <a href="#">
                                    <i class="fa fa-list"></i>
                                    <span>Playlist</span>
                                </a>
                                <div class="sidebar-submenu">
                                    <ul>
                                        <li>
                                            <a href="#">Modificar lista</a>
                                        </li>
                                        <li>
                                            <a href="#">Agregar video</a>
                                        </li>
                                        <li>
                                            <a href="#">Quitar video</a>
                                        </li>
                                        <li>
                                            <a href="#">Consulta de lista</a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                        </ul>
                        <!-- sidebar-menu  -->
                    </div>
                    <%}%>
                    <!-- sidebar-content  -->

            </nav>
            <!-- sidebar-wrapper  -->
            <main class="page-content">
                <div class="container-fluid" id="panelcentral">
                    <h2>Pro Sidebar</h2>
                    <hr>
                    <div class="row">
                        <div class="form-group col-md-12">
                            <p>This is a responsive sidebar template with dropdown menu based on bootstrap 4 framework.</p>
                            <p> You can find the complete code on <a href="https://github.com/azouaoui-med/pro-sidebar-template" target="_blank">
                                    Github</a>, it contains more themes and background image option</p>
                        </div>
                        <div class="form-group col-md-12">
                            <iframe src="https://ghbtns.com/github-btn.html?user=azouaoui-med&repo=pro-sidebar-template&type=star&count=true&size=large"
                                    frameborder="0" scrolling="0" width="140px" height="30px"></iframe>
                            <iframe src="https://ghbtns.com/github-btn.html?user=azouaoui-med&repo=pro-sidebar-template&type=fork&count=true&size=large"
                                    frameborder="0" scrolling="0" width="140px" height="30px"></iframe>
                        </div>
                    </div>
                    <h5>More templates</h5>
                    <hr>
                    <div class="row">
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                            <div class="card rounded-0 p-0 shadow-sm">
                                <img src="https://user-images.githubusercontent.com/25878302/58369568-a49b2480-7efc-11e9-9ca9-2be44afacda1.png" class="card-img-top rounded-0" alt="Angular pro sidebar">
                                <div class="card-body text-center">
                                    <h6 class="card-title">Angular Pro Sidebar</h6>
                                    <a href="https://github.com/azouaoui-med/angular-pro-sidebar" target="_blank" class="btn btn-primary btn-sm">Github</a>
                                    <a href="https://azouaoui-med.github.io/angular-pro-sidebar/demo/" target="_blank" class="btn btn-success btn-sm">Preview</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
                            <div class="card rounded-0 p-0 shadow-sm">
                                <img src="https://user-images.githubusercontent.com/25878302/58369258-33f20900-7ef8-11e9-8ff3-b277cb7ed7b4.PNG" class="card-img-top rounded-0" alt="Angular pro sidebar">
                                <div class="card-body text-center">
                                    <h6 class="card-title">Angular Dashboard</h6>
                                    <a href="https://github.com/azouaoui-med/lightning-admin-angular" target="_blank" class="btn btn-primary btn-sm">Github</a>
                                    <a href="https://azouaoui-med.github.io/lightning-admin-angular/demo/" target="_blank" class="btn btn-success btn-sm">Preview</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </main>
            <!-- page-content" -->
        </div>
        <!-- page-wrapper -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
        <script src="assets/js/modificarUser.js"></script>
        <script src="assets/js/modificarVideo.js"></script>
        <script src="assets/js/altaVideo.js"></script>
    </body>

</html>
