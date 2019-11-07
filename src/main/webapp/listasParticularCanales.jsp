<%--
    Document   : listasParticular
    Created on : 13 oct. 2019, 20:49:45
    Author     : tesla
--%>

<%@include file="getPrimerVideoListaParticular.jsp"%>
<%@ page import="uytube.web.wsclients.*" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Listas Particulares</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
</head>
<body>
<br>
<div class="container-fluid">
    <div class="card-deck">
        <div class="row align-self-center">
    <%
            ControladorUsuarioService us = new ControladorUsuarioService();
            uytube.web.wsclients.IControladorUsuario u = us.getControladorUsuarioPort();
            ControladorCanalService controlador = new ControladorCanalService();
            uytube.web.wsclients.IControladorCanal c = controlador.getControladorCanalPort();

            String nomCanal = (String) session.getAttribute("nomCanal");
            uytube.web.wsclients.DtUsuario user = u.buscarUsuarioCanal(nomCanal);
            List listasParticulares = c.getListasReproduccion(user.getNickname());

            if (listasParticulares != null) {
                uytube.web.wsclients.DtListaParticulares lista;
                String[] datos;
                for (int i = 0; i < listasParticulares.size(); i++) {
                    lista = (uytube.web.wsclients.DtListaParticulares) listasParticulares.get(i);
                    datos = getPrimerVideoListaParticular(lista, user.getNickname());
                    if(!lista.isPrivado()){
                    if (datos != null) {%>
            <div class="col-md-4">
                <div class="card mb-3">
                    <div class="card-body">
                        <a href="verPlaylist.jsp?nomLista=<%=lista.getNombreLista()%>&user=<%=user.getCanal().getNombreCanal()%>&es_particular=true"><img src="https://img.youtube.com/vi/<%=datos[0]%>/0.jpg" class="card-img-top" alt="Miniatura de lista"></a>
                        <h5 class="card-title"><strong><%=lista.getNombreLista()%></strong></h5>
                        <p class="card-text">Categoria: <%=lista.getCategoria().getNombreCategoria()%></p>
                    </div>
                    <div class="card-footer">
                        <small class="text-muted">Cantidad de videos: <%=datos[1]%></small>
                    </div>
                </div>
            </div>
    <%} else {%>
            <div class="col-md-4">
                <div class="card mb-3">
                    <img src="assets/images/logo.png" class="card-img-top" alt="Miniatura de lista">
                    <div class="card-body">
                        <h5 class="card-title"><strong><%=lista.getNombreLista()%></strong></h5>
                    </div>
                    <div class="card-footer">
                        <small class="text-muted">Cantidad de videos: 0</small>
                    </div>
                </div>
            </div>
    <%}
    }
    }
    }
    %>
        </div>
        </div>
        </div>
</body>
</html>
