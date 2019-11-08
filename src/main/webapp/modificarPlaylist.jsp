<%--
  Created by IntelliJ IDEA.
  User: caste
  Date: 15/10/19
  Time: 15:01
  To change this template use File | Settings | File Templates.
--%>
<%@include file="getPrimerVideoListaParticular.jsp"%>

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <title>Listas Particulares</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

</head>
<body>
<div class="card-group">
    <%
        ControladorCanalService controlador = new ControladorCanalService();
        uytube.web.wsclients.IControladorCanal c = controlador.getControladorCanalPort();

        uytube.web.wsclients.DtUsuario user;
        if (session.getAttribute("usuario") != null) {
            user = (uytube.web.wsclients.DtUsuario) session.getAttribute("usuario");

            List listasParticulares = c.getListasReproduccion(user.getNickname());

            if (listasParticulares != null) {
                uytube.web.wsclients.DtListaParticulares lista;
                String[] datos;
                for (int i = 0; i < listasParticulares.size(); i++) {
                    lista = (uytube.web.wsclients.DtListaParticulares) listasParticulares.get(i);
                    datos = getPrimerVideoListaParticular(lista, user.getNickname());
                    if (datos != null) {
    %>
    <div class="card" id="playlist_div">
        <img src="https://img.youtube.com/vi/<%=datos[0]%>/0.jpg" class="card-img-top" alt="Miniatura de lista">
        <div class="card-body">
            <h5 class="card-title"><strong><%=lista.getNombreLista()%></strong></h5>
            <p class="card-text">Categoría: <%=lista.getCategoria().getNombreCategoria()%></p>
        </div>
        <div class="card-footer">
            <a href="modificarPlaylist2.jsp?nomLista=<%=lista.getNombreLista()%>" class="btn btn-primary">Modificar</a>
        </div>
    </div>
    <%} else {%>
    <div class="card">
        <img src="assets/images/logo.png" class="card-img-top" alt="Miniatura de lista">

        <div class="card-body">
            <h5 class="card-title"><strong><%=lista.getNombreLista()%></strong></h5>
        </div>
        <div class="card-footer">
            <a href="modificarPlaylist2.jsp?nomLista=<%=lista.getNombreLista()%>" class="btn btn-primary">Modificar</a>
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