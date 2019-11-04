<%--
  Created by IntelliJ IDEA.
  User: tesla
  Date: 13/10/19
  Time: 18:32
  To change this template use File | Settings | File Templates.
--%>
<%@include file="getPrimerVideoListaDefecto.jsp"%>
<%@page import="DataTypes.DtVideo"%>
<%@page import="DataTypes.DtListaporDefecto"%>
<%@page import="DataTypes.DtListaDefectoVideos"%>
<%@page import="java.util.List"%>

<%@page import="interfaces.IControladorCanal"%>
<%@page import="fabrica.Fabrica"%>
<%@page import="DataTypes.DtUsuario"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
    <head>
        <title>Listas Defecto</title>
    </head>
    <body>
        <div class="card-group">
            <%
                DtUsuario user = null;
                if (session.getAttribute("usuario") != null) {
                    user = (DtUsuario) session.getAttribute("usuario");
                    Fabrica fabrica = Fabrica.getInstance();
                    IControladorCanal controladorCanal = fabrica.getControladorCanal();
                    List listasDefecto = controladorCanal.getListasDefecto(user.getNickname());

                    if (listasDefecto != null) {
                        DtListaporDefecto lista;
                        String[] datos;
                        for (int i = 0; i < listasDefecto.size(); i++) {
                            lista = (DtListaporDefecto) listasDefecto.get(i);
                            datos = getPrimerVideoListaDefecto(lista, user.getNickname());
                            if (datos != null) {%>
            <div class="card">
                <div class="card-body">
                    <a href="verPlaylist.jsp?nomLista=<%=lista.getNombreLista()%>&user=<%=user.getCanal().getNombre_canal()%>&es_particular=false"><img src="https://img.youtube.com/vi/<%=datos[0]%>/0.jpg" class="card-img-top" alt="Miniatura de lista"></a>
                    <h5 class="card-title"><strong><%=lista.getNombreLista()%></strong></h5>
                </div>
                <div class="card-footer">
                    <small class="text-muted">Cantidad de videos: <%=datos[1]%></small>
                </div>
            </div>
            <%} else {%>
            <div class="card">
                <div class="card-body">
                    <a href="verPlaylist.jsp?nomLista=<%=lista.getNombreLista()%>&user=<%=user.getCanal().getNombre_canal()%>&es_particular=false"><img src="assets/images/logo.png" class="card-img-top" alt="Miniatura de lista"></a>
                    <h5 class="card-title"><strong><%=lista.getNombreLista()%></strong></h5>
                </div>
                <div class="card-footer">
                    <small class="text-muted">Cantidad de videos: 0</small>
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
