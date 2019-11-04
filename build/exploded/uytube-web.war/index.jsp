<%@include file="getPrimerVideoListaParticular.jsp"%>
<%@page import="java.util.List"%>
<%@ page import="DataTypes.*" %>
<%@ page import="interfaces.IControladorUsuario" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

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

        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description"
              content="Responsive sidebar template with sliding effect and dropdown menu based on bootstrap 3">
        <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
    </head>

    <body style="background-color: #EEEEEE">
        <%
            DtUsuario user = null;
            if (session.getAttribute("usuario") != null) {
                user = (DtUsuario) session.getAttribute("usuario");
            }
            Fabrica fabrica = Fabrica.getInstance();
            IControladorCanal c = fabrica.getControladorCanal();
        %>
        <!-- BARRA SUPERIOR -->
        <div class="barra_superior" style="background-color:#343841">
            <div class="d-inline">
                <a class="navbar-brand" href="index.jsp" style="margin-left: 45%"> <img src="assets/images/logo2.png" width="112" height="auto"></a>
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
                        <a href="index.jsp">UyTube</a>
                        <div id="close-sidebar">
                            <i class="fas fa-times"></i>
                        </div>
                    </div>
                    <div class="sidebar-header">
                        <div class="user-pic">
                            <%if (user == null) {%>
                            <img class="img-responsive img-rounded"
                                 src="http://localhost:8080/assets/imagenesUsuarios/Defecto.png"
                                 alt="User picture">
                            <%} else {
                        String ruta = "http://localhost:8080/assets" + user.getImagen();%>
                            <img class="img-responsive img-rounded" src="<%=ruta%>" alt="User picture">
                            <%}%>
                        </div>
                        <div class="user-info">
                            <span class="user-name">
                                <% if (user != null) {%>
                                <strong><%=user.getNickname()%> </strong>
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
                                <form id="buscarForm" method="get" action="BuscarServlet">
                                    <div class="input-group-append">
                                        <span class="input-group-text">
                                            <input type="text" class="form-control search-menu" id="input_search" name="buscador" placeholder="Buscar...">
                                            <a href="javascript:{}" onclick="document.getElementById('buscarForm').submit();" style="margin-left: -10px"><i class="fa fa-search" aria-hidden="true"></i></a>
                                        </span>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                    <!-- sidebar-search  -->
                    <% if (user != null) {%>
                    <div class="sidebar-menu">
                        <ul>
                            <li>
                                <a href="index.jsp">
                                    <i class="fa fa-home"></i>
                                    <span class="menu-text">Inicio</span>
                                </a>
                            </li>
                            <li>
                                <a href="#" id="canal_btn">
                                    <i class="fa fa-film"></i>
                                    <span class="menu-text">Canal</span>
                                </a>
                            </li>
                            <li class="sidebar-dropdown">
                                <a href="#">
                                    <i class="fa fa-user"></i>
                                    <span>Usuario</span>
                                </a>
                                <div class="sidebar-submenu">
                                    <ul>      
                                        <li>
                                            <a href="#" id="modificoUser_btn">Modificar</a>
                                            <header class="header">
                                                <nav class="navbar navbar-toggleable-md navbar-light pt-0 pb-0 ">
                                                </nav>
                                            </header>
                                            <script type="text/javascript" src="assets/js/barralateral_index.js"></script></a>
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
                                            <a href="#" id="crearLista_btn">Crear lista</a>
                                        </li>
                                        <li>
                                            <a href="#" id="modificarPlaylist_btn">Modificar lista</a>
                                        </li>
                                        <li>
                                            <a href="#" id="agregarVidPlaylist_btn">Agregar video</a>
                                        </li>
                                        <li>
                                            <a href="#" id="eliminarVidPlaylist_btn">Quitar video</a>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class="sidebar-menu">
                        <ul>
                            <li class="sidebar-dropdown">
                                <a href="#">
                                    <i class="fa fa-list-alt"></i>
                                    <span>Consulta Categorias</span>
                                </a>
                                <div class="sidebar-submenu">
                                    <ul>
                                        <li><%
                                            List listaCat = c.getCategorias();
                                            DtCategoria dtaux = null;
                                            for(int x = 0 ; x< listaCat.size(); x++){
                                                dtaux = (DtCategoria) listaCat.get(x);%>
                                            <a href="verVideosPorCategoria.jsp?categoria=<%=dtaux.getnombreCategoria()%>" id=""><%=dtaux.getnombreCategoria()%></a>
                                            <%}%>
                                        </li>
                                    </ul>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <%}%>
                    <!-- sidebar-content  -->
            </nav>
            <!-- sidebar-wrapper  -->
            <div class="page-content" id="panelcentral">
                <div class="btn-group">
                    <button class="btn btn-secondary btn-lg dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Filtrar
                        <i class="fas fa-filter"></i>
                    </button>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" id="filtroListas" href="#">Playlists</a>
                        <a class="dropdown-item" id="filtroVideos" href="#">Videos</a>
                        <a class="dropdown-item" id="filtroCanales" href="#">Canales</a>
                    </div>
                </div>
                <div class="btn-group">
                    <button class="btn btn-secondary btn-lg dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Ordenar
                        <i class="fas fa-sort"></i>
                    </button>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="#">Alfabeticamente (Defecto)</a>
                        <a class="dropdown-item" href="BuscarServlet?buscador=<%=request.getAttribute("ultimaBusqueda")%>&ordFecha=1">Fecha de carga</a>
                    </div>
                </div>
                <div class="container-fluid">
                <div class="card-deck" id="deck-videos">
                    <div class="row align-self-center">
                        <%
                            List videos = (List) request.getAttribute("videos");
                            if (videos != null) {
                                DtVideo v;
                                String id;
                                for (int i = 0; i < videos.size(); i++) {
                                    v = (DtVideo) videos.get(i);
                                    id = getID(v.getUrl());

                        %>
                                    <div class="col-md-4">
                                        <div class="card video-resultado mb-3">
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
                        <%
                                }
                            }
                        %>
                    </div>
                </div>
                <div class="card-deck" id="deck-listas">
                    <div class="row align-self-center">
                        <%
                        List listasParticulares = (List) request.getAttribute("listas");

                        if (listasParticulares != null) {
                            DtListaParticulares lista;
                            String[] datos;
                            for (int i = 0; i < listasParticulares.size(); i++) {
                                lista = (DtListaParticulares) listasParticulares.get(i);
                                if(!lista.getPrivado()){
                                    datos = getPrimerVideoListaParticular(lista, lista.getCanal().getUsuario().getNickname());

                                if (datos != null) {%>
                        <div class="col-md-4">
                            <div class="card listas-resultado mb-3">
                                <div class="card-body">
                                    <a href="verPlaylist.jsp?nomLista=<%=lista.getNombreLista()%>&user=<%=lista.getCanal().getNombre_canal()%>&es_particular=true"><img src="https://img.youtube.com/vi/<%=datos[0]%>/0.jpg" class="card-img-top" alt="Miniatura de video"></a>
                                    <h5 class="card-title"><strong><%=lista.getNombreLista()%></strong></h5>
                                    <p class="card-text">Categoria: <%=lista.getCategoria().getnombreCategoria()%></p>
                                    <p class="card-text">Dueño: <%=lista.getCanal().getNombre_canal()%></p>
                                </div>
                                <div class="card-footer">
                                    <small>Cantidad de videos: <%=datos[1]%></small>
                                </div>
                            </div>
                        </div>
                        <%}else{%>
                        <div class="col-md-4">
                            <div class="card listas-resultado mb-3">
                                <div class="card-body">
                                    <a href="verPlaylist.jsp?nomLista=<%=lista.getNombreLista()%>&user=<%=lista.getCanal().getNombre_canal()%>&es_particular=true"><img src="assets/images/logo.png" class="card-img-top" alt="Miniatura de video" ></a>
                                    <h5 class="card-title"><strong><%=lista.getNombreLista()%></strong></h5>
                                    <p class="card-text">Categoria: <%=lista.getCategoria().getnombreCategoria()%></p>
                                    <p class="card-text">Dueño: <%=lista.getCanal().getNombre_canal()%></p>
                                </div>
                                <div class="card-footer">
                                    <small>Cantidad de videos: 0</small>
                                </div>
                            </div>
                        </div>
                        <%
                            }
                            }
                            }
                            }
                        %>
                    </div>
                </div>
                 <div class="card-deck" id="deck-canales">
                    <div class="row align-self-center">
                        <%
                            List canales = (List) request.getAttribute("canales");

                            if (canales != null) {
                                DtCanal canal;
                                for (int i = 0; i < canales.size(); i++) {
                                    canal = (DtCanal) canales.get(i);
                                    if(!canal.getPrivado()){
                        %>
                        <div class="col-md-offset">
                            <div class="card canales-resultado mb-3">
                                <div class="card-body">
                                    <a href="verCanales.jsp?nomCanal=<%=canal.getNombre_canal()%>"><img src="http://localhost:8080/assets<%=canal.getUsuario().getImagen()%>" class="card-img-top" alt="Miniatura de canal" ></a>
                                    <h5 class="card-title"><strong><%=canal.getNombre_canal()%></strong></h5>
                                    <p class="card-text"><%=canal.getDescripcion()%></p>
                                </div>
                                <div class="card-footer">
                                    <small>Dueño: <%=canal.getUsuario().getNickname()%></small>
                                </div>
                            </div>
                        </div>
                        <%  }
                            }
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
        </main>
        </div>
        <script src="assets/js/filtrado.js"></script>
        <script src="assets/js/search.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
        <script src="assets/js/clearPaneles.js"></script>
    </body>

</html>
