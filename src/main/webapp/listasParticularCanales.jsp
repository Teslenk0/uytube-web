<%--
    Document   : listasParticular
    Created on : 13 oct. 2019, 20:49:45
    Author     : tesla
--%>

<%@include file="getPrimerVideoListaParticular.jsp"%>
<%@page import="DataTypes.DtUsuario"%>
<%@page import="interfaces.IControladorUsuario"%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Listas Particulares</title>
</head>
<body>
<br>
<div class="container-fluid">
    <div class="card-deck">
        <div class="row align-self-center">
    <%
            String nomCanal = (String) session.getAttribute("nomCanal");
            Fabrica f = Fabrica.getInstance();
            IControladorUsuario u = f.getControladorUsuario();
            IControladorCanal c = f.getControladorCanal();
            DtUsuario user = u.buscarUsuarioCanal(nomCanal);
            List listasParticulares = c.getListasReproduccion(user.getNickname());

            if (listasParticulares != null) {
                DtListaParticulares lista;
                String[] datos;
                for (int i = 0; i < listasParticulares.size(); i++) {
                    lista = (DtListaParticulares) listasParticulares.get(i);
                    datos = getPrimerVideoListaParticular(lista, user.getNickname());
                    if(!lista.getPrivado()){
                    if (datos != null) {%>
            <div class="col-md-10">
                <div class="card mb-5">
                    <a href="verPlaylist.jsp?nomLista=<%=lista.getNombreLista()%>&user=<%=user.getCanal().getNombre_canal()%>&es_particular=true"><img src="https://img.youtube.com/vi/<%=datos[0]%>/0.jpg" class="card-img-top" alt="Miniatura de lista"></a>
                    <div class="card-body">
                        <h5 class="card-title"><strong><%=lista.getNombreLista()%></strong></h5>
                        <p class="card-text">Categoria: <%=lista.getCategoria().getnombreCategoria()%></p>
                    </div>
                    <div class="card-footer">
                        <small class="text-muted">Cantidad de videos: <%=datos[1]%></small>
                    </div>
                </div>
            </div>
    <%} else {%>
            <div class="col-md-10">
                <div class="card mb-5">
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
