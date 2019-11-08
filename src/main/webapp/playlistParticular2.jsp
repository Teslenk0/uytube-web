<%--
    Document   : listasParticular
    Created on : 13 oct. 2019, 20:49:45
    Author     : caste
--%>

<%@include file="getPrimerVideoListaParticular.jsp"%>
<%@page import="java.util.List"%>

<%@page import="uytube.web.wsclients.DtUsuario"%>
<%@ page contentType="text/html;charset=UTF-8"%>

<html>
<head>
    <title>Listas Particulares</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
</head>
<body>
<div class="card-group">
    <%
        DtUsuario user;
        String esParticular = "true";
        if (session.getAttribute("usuario") != null) {
            user = (DtUsuario) session.getAttribute("usuario");
            ControladorCanalService controllerCanal = new ControladorCanalService();
            uytube.web.wsclients.IControladorCanal controladorCanal = controllerCanal.getControladorCanalPort();
            List listasParticulares = controladorCanal.getListasReproduccion(user.getNickname());

            if (listasParticulares != null) {
                DtListaParticulares lista;
                String[] datos;
                for (int i = 0; i < listasParticulares.size(); i++) {
                    lista = (DtListaParticulares) listasParticulares.get(i);
                    datos = getPrimerVideoListaParticular(lista, user.getNickname());
                    if (datos != null) {%>
    <div class="card">
        <img src="https://img.youtube.com/vi/<%=datos[0]%>/0.jpg" class="card-img-top" alt="Miniatura de lista">
        <div class="card-body">
            <h5 class="card-title"><strong><%=lista.getNombreLista()%></strong></h5>
            <p class="card-text">Categoría: <%=lista.getCategoria().getNombreCategoria()%></p>
        </div>
        <div class="card-footer">
            <a class="btn btn-primary" href="agregarVideoPlaylist2.jsp?nomLista=<%=lista.getNombreLista()%>&es_particular=<%=esParticular%>">Agregar</a>
        </div>
    </div>
    <%} else {%>
    <div class="card">
        <img src="assets/images/logo.png" class="card-img-top" alt="Miniatura de lista">

        <div class="card-body">
            <h5 class="card-title"><strong><%=lista.getNombreLista()%></strong></h5>
        </div>
        <div class="card-footer">
            <a class="btn btn-primary" href="agregarVideoPlaylist2.jsp?nomLista=<%=lista.getNombreLista()%>&es_particular=<%=esParticular%>">Agregar</a>
        </div>
    </div>
    <%}
    }
    }
    }
    %>
</div>
</body>
</html>
