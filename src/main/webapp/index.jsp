<%@include file="getPrimerVideoListaParticular.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Inicio</title>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.6/css/all.css">
        <link rel="stylesheet" type="text/css" href="assets/css/index.css">

        <script type="text/javascript" src="assets/js/jquery-3.4.1.min.js"></script>
    </head>

    <body style="background-color: #EEEEEE">
        <%
            uytube.web.wsclients.DtUsuario user = null;
            if (session.getAttribute("usuario") != null) {
                user = (uytube.web.wsclients.DtUsuario) session.getAttribute("usuario");
            }
            ControladorCanalService controllerCanal = new ControladorCanalService();
            uytube.web.wsclients.IControladorCanal c = controllerCanal.getControladorCanalPort();
        %>
        <!-- BARRA SUPERIOR -->
        <div class="barra_superior text-center" style="background-color:#343841">
            <div class="d-inline">
                <a class="navbar-brand" href="index.jsp"> <img src="assets/images/logo2.png" width="112" height="auto"></a>
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
                        <div class="foto-user">
                            <%if (user == null) {%>
                                <img class="img-rounded" src="/assets/imagenesUsuarios/Defecto.png" alt="User picture" style="float: left; width: 60px;
                                padding: 2px;
                                border-radius: 12px;
                                margin-right: 15px;
                                overflow: hidden">
                            <%} else {
                                String ruta = "/assets" + user.getImagen();%>
                                <img class="img-rounded" src="<%=ruta%>" alt="User picture" style="float: left; width: 60px;
                                padding: 2px;
                                border-radius: 12px;
                                margin-right: 15px;
                                overflow: hidden">
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
                                <span>Iniciar Sesión</span>
                            </a>
                            <%} else {%>
                            <a href="LogoutServlet" style="margin-left: 25%">
                                <span>Cerrar Sesión</span>
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
                                            uytube.web.wsclients.DtCategoria dtaux;
                                            for(int x = 0 ; x< listaCat.size(); x++){
                                                dtaux = (uytube.web.wsclients.DtCategoria) listaCat.get(x);%>
                                            <a href="verVideosPorCategoria.jsp?categoria=<%=dtaux.getNombreCategoria()%>" id=""><%=dtaux.getNombreCategoria()%></a>
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
                        <a class="dropdown-item" href="#">Alfabéticamente (Defecto)</a>
                        <a class="dropdown-item" href="BuscarServlet?buscador=<%=request.getAttribute("ultimaBusqueda")%>&ordFecha=1">Fecha de carga</a>
                    </div>
                </div>
                <div class="card-group" id="deck-videos">
                        <%
                            List videos = (List) request.getAttribute("videos");
                            if (videos != null) {
                                uytube.web.wsclients.DtVideo v;
                                String id;
                                for (int i = 0; i < videos.size(); i++) {
                                    v = (uytube.web.wsclients.DtVideo) videos.get(i);
                                    id = getID(v.getUrl());

                        %>
                                    <div class="col-md-4">
                                        <div class="card video-resultado my-3">
                                            <a href="verVideos.jsp?video=<%=v.getNombre()%>&canal=<%=v.getCanal().getNombreCanal()%>">
                                                <img src="https://img.youtube.com/vi/<%=id%>/0.jpg" class="card-img-top" alt="Miniatura de video">
                                            </a>
                                            <div class="card-body">
                                                <h5 class="card-title"><strong><%=v.getNombre()%></strong></h5>
                                                <p class="card-text"><%=v.getDescripcion()%></p>
                                            </div>
                                            <div class="card-footer">
                                                <small>Canal: <%=v.getCanal().getNombreCanal()%></small>
                                                <br>
                                                <small>Duración: <%=v.getDuracion()%></small>
                                            </div>
                                        </div>
                                    </div>
                        <%
                                }
                            }
                        %>
                </div>
                <div class="card-group" id="deck-listas">
                        <%
                        List listasParticulares = (List) request.getAttribute("listas");

                        if (listasParticulares != null) {
                            uytube.web.wsclients.DtListaParticulares lista;
                            String[] datos;
                            for (int i = 0; i < listasParticulares.size(); i++) {
                                lista = (uytube.web.wsclients.DtListaParticulares) listasParticulares.get(i);

                                if(lista.isPrivado()){
                                    datos = getPrimerVideoListaParticular(lista, lista.getCanal().getUsuario().getNickname());

                                if (datos != null) {%>
                        <div class="col-md-4">
                            <div class="card listas-resultado my-3">
                                <a href="verPlaylist.jsp?nomLista=<%=lista.getNombreLista()%>&user=<%=lista.getCanal().getNombreCanal()%>&es_particular=true"><img src="https://img.youtube.com/vi/<%=datos[0]%>/0.jpg" class="card-img-top" alt="Miniatura de video"></a>
                                <div class="card-body">
                                    <h5 class="card-title"><strong><%=lista.getNombreLista()%></strong></h5>
                                    <p class="card-text">Categoría: <%=lista.getCategoria().getNombreCategoria()%></p>
                                    <p class="card-text">Dueño: <%=lista.getCanal().getNombreCanal()%></p>
                                </div>
                                <div class="card-footer">
                                    <small>Cantidad de videos: <%=datos[1]%></small>
                                </div>
                            </div>
                        </div>
                        <%}else{%>
                        <div class="col-md-4">
                            <div class="card listas-resultado my-3">
                                <a href="verPlaylist.jsp?nomLista=<%=lista.getNombreLista()%>&user=<%=lista.getCanal().getNombreCanal()%>&es_particular=true"><img src="assets/images/logo.png" class="card-img-top" alt="Miniatura de video" ></a>
                                <div class="card-body">
                                    <h5 class="card-title"><strong><%=lista.getNombreLista()%></strong></h5>
                                    <p class="card-text">Categoría: <%=lista.getCategoria().getNombreCategoria()%></p>
                                    <p class="card-text">Dueño: <%=lista.getCanal().getNombreCanal()%></p>
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
                 <div class="card-group" id="deck-canales">
                        <%
                            List canales = (List) request.getAttribute("canales");

                            if (canales != null) {
                                uytube.web.wsclients.DtCanal canal;
                                for (int i = 0; i < canales.size(); i++) {
                                    canal = (uytube.web.wsclients.DtCanal) canales.get(i);
                                    if(!canal.isPrivado()){
                        %>
                        <div class="col-md-3">
                            <div class="card canales-resultado my-3">
                                <a href="verCanales.jsp?nomCanal=<%=canal.getNombreCanal()%>"><img src="/assets<%=canal.getUsuario().getImagen()%>" class="card-img-top" alt="Miniatura de canal" ></a>
                                <div class="card-body">
                                    <h5 class="card-title"><strong><%=canal.getNombreCanal()%></strong></h5>
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
        <script type="text/javascript" src="assets/js/filtrado.js"></script>
        <script type="text/javascript" src="assets/js/search.js"></script>
        <script type="text/javascript" src="assets/js/barralateral_index.js"></script>
        <script type="text/javascript" src="assets/js/clearPaneles.js"></script>

        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    </body>
</html>
