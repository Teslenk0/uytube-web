<%--
  Created by IntelliJ IDEA.
  User: caste
  Date: 15/10/19
  Time: 15:01
  To change this template use File | Settings | File Templates.
--%>
<%@include file="getPrimerVideoListaParticular.jsp"%>
<%@page import="DataTypes.DtUsuario"%>

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <title>Listas Particulares</title>
</head>
<body>
<div class="card-group">
    <%
        DtUsuario user;
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
                    if (datos != null) {
    %>
    <div class="card" id="playlist_div">
        <img src="https://img.youtube.com/vi/<%=datos[0]%>/0.jpg" class="card-img-top" alt="Miniatura de lista">
        <div class="card-body">
            <h5 class="card-title"><strong><%=lista.getNombreLista()%></strong></h5>
            <p class="card-text">Categoria: <%=lista.getCategoria().getnombreCategoria()%></p>
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