<%--
  Created by IntelliJ IDEA.
  User: tesla
  Date: 13/10/19
  Time: 18:32
  To change this template use File | Settings | File Templates.
--%>
<%@include file="getPrimerVideoListaDefecto.jsp"%>

<%@page import="uytube.web.wsclients.ControladorUsuarioService"%>

<%@ page contentType="text/html;charset=UTF-8"%>

<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Listas Defecto</title>
    </head>
    <body>
        <div class="card-group">
            <%
                ControladorCanalService controlador = new ControladorCanalService();
                uytube.web.wsclients.IControladorCanal c = controlador.getControladorCanalPort();

                    uytube.web.wsclients.DtUsuario user = (uytube.web.wsclients.DtUsuario) session.getAttribute("usuario");
                    List listasDefecto = c.getListasDefecto(user.getNickname());

                    if (listasDefecto != null) {
                        uytube.web.wsclients.DtListaporDefecto lista;
                        String[] datos = {};
                        List listaVideosHistoricos;
                        DtListaDefectoVideos auxiliar;
                        DtVideo auxVideo;
                        for (int i = 0; i < listasDefecto.size(); i++) {
                            lista = (uytube.web.wsclients.DtListaporDefecto) listasDefecto.get(i);
                            if(!lista.getNombreLista().equals("Historial"))
                                datos = getPrimerVideoListaDefecto(lista, user.getNickname());
                            else {
                                listaVideosHistoricos = c.obtenerVideosHistoricos(user.getCanal());
                                if(!listaVideosHistoricos.isEmpty()){
                                    auxiliar = (DtListaDefectoVideos) listaVideosHistoricos.get(0);
                                    auxVideo = c.obtenerVideo(auxiliar.getVideo(),auxiliar.getCanal());
                                    String id = getID(auxVideo.getUrl());
                                    datos = new String[]{id, String.valueOf(listaVideosHistoricos.size())};
                                }else{
                                    datos = null;
                                }
                            }
                            if (datos != null) {%>
            <div class="card">
                <div class="card-body">
                    <a href="verPlaylist.jsp?nomLista=<%=lista.getNombreLista()%>&user=<%=user.getCanal().getNombreCanal()%>&es_particular=false"><img src="https://img.youtube.com/vi/<%=datos[0]%>/0.jpg" class="card-img-top" alt="Miniatura de lista"></a>
                    <h5 class="card-title"><strong><%=lista.getNombreLista()%></strong></h5>
                </div>
                <div class="card-footer">
                    <small class="text-muted">Cantidad de vídeos: <%=datos[1]%></small>
                </div>
            </div>
            <%} else {%>
            <div class="card">
                <div class="card-body">
                    <a href="verPlaylist.jsp?nomLista=<%=lista.getNombreLista()%>&user=<%=user.getCanal().getNombreCanal()%>&es_particular=false"><img src="assets/images/logo.png" class="card-img-top" alt="Miniatura de lista"></a>
                    <h5 class="card-title"><strong><%=lista.getNombreLista()%></strong></h5>
                </div>
                <div class="card-footer">
                    <small class="text-muted">Cantidad de vídeos: 0</small>
                </div>
            </div>
            <%}
                        }
                    }
            %>
        </div>
    </body>
</html>
