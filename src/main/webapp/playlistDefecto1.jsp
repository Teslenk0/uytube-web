<%--
  Created by IntelliJ IDEA.
  User: tesla
  Date: 13/10/19
  Time: 18:32
  To change this template use File | Settings | File Templates.
--%>
<%@include file="getPrimerVideoListaDefecto.jsp"%>
<%@page import="uytube.web.wsclients.DtListaporDefecto"%>
<%@page import="java.util.List"%>

<%@page import="uytube.web.wsclients.DtUsuario"%>
<%@ page contentType="text/html;charset=UTF-8"%>

<html>
<head>
    <title>Listas Defecto</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
</head>
<body>
<div class="card-group">
    <%
        DtUsuario user;
        String esParticular = "false";
        if (session.getAttribute("usuario") != null) {
            user = (DtUsuario) session.getAttribute("usuario");

            ControladorCanalService c = new ControladorCanalService();
            uytube.web.wsclients.IControladorCanal controladorCanal = c.getControladorCanalPort();

            List listasDefecto = controladorCanal.getListasDefecto(user.getNickname());

            if (listasDefecto != null) {
                DtListaporDefecto lista;
                String[] datos;
                for (int i = 0; i < listasDefecto.size(); i++) {
                    lista = (DtListaporDefecto) listasDefecto.get(i);
                    datos = getPrimerVideoListaDefecto(lista, user.getNickname());
                    if (datos != null) {%>
    <div class="card">
        <img src="https://img.youtube.com/vi/<%=datos[0]%>/0.jpg" class="card-img-top" alt="Miniatura de lista">
        <div class="card-body">
            <h5 class="card-title"><strong><%=lista.getNombreLista()%></strong></h5>
        </div>
        <div class="card-footer">
            <a class="btn btn-primary" href="eliminarVideoPlaylist2Defecto.jsp?nomLista=<%=lista.getNombreLista()%>&es_particular=<%=esParticular%>">Eliminar</a>
        </div>
    </div>
    <%} else {%>
    <div class="card">
        <img src="assets/images/logo.png" class="card-img-top" alt="Miniatura de lista">

        <div class="card-body">
            <h5 class="card-title"><strong><%=lista.getNombreLista()%></strong></h5>
        </div>
        <div class="card-footer">
            <a class="btn btn-primary" href="eliminarVideoPlaylist2Defecto.jsp?nomLista=<%=lista.getNombreLista()%>&es_particular=<%=esParticular%>">Eliminar</a>
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
