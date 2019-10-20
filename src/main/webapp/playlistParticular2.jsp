<%--
    Document   : listasParticular
    Created on : 13 oct. 2019, 20:49:45
    Author     : caste
--%>

<%@include file="getPrimerVideoListaParticular.jsp"%>
<%@page import="java.util.List"%>

<%@page import="interfaces.IControladorCanal"%>
<%@page import="fabrica.Fabrica"%>
<%@page import="DataTypes.DtUsuario"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Listas Particulares</title>
</head>
<body>
<div class="card-group">
    <%
        DtUsuario user = null;
        String esParticular = "true";
        if (session.getAttribute("usuario") != null) {
            user = (DtUsuario) session.getAttribute("usuario");
            Fabrica fabrica = Fabrica.getInstance();
            IControladorCanal controladorCanal = fabrica.getControladorCanal();
            List listasParticulares = controladorCanal.getListasReproduccion(user.getNickname());

            if (listasParticulares != null) {
                DtListaParticulares lista;
                String[] datos;
                for (int i = 0; i < listasParticulares.size(); i++) {
                    lista = (DtListaParticulares) listasParticulares.get(i);
                    datos = getPrimerVideoListaParticular(lista, user.getNickname());
                    if (datos != null) {%>
    <div class="card">
        <img src="https://img.youtube.com/vi/<%=datos[0].toString()%>/0.jpg" class="card-img-top" alt="Miniatura de lista">
        <div class="card-body">
            <h5 class="card-title"><strong><%=lista.getNombreLista()%></strong></h5>
            <p class="card-text">Categoria: <%=lista.getCategoria().getnombreCategoria()%></p>
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
