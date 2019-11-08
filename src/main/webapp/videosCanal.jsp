<%-- 
    Document   : videos
    Created on : 12 oct. 2019, 15:47:40
    Author     : tesla
--%>
<%@include file="getID.jsp"%>
<%@ page import="java.util.List" %>
<%@ page import="uytube.web.wsclients.ControladorCanalService" %>
<%@ page import="uytube.web.wsclients.ControladorUsuarioService" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Videos</title>

        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
    </head>
    <body>
        <br>
        <div class="container-fluid">
            <div class="card-deck">
                <div class="row align-self-center">
                    <%
                        String nomCanal = (String) session.getAttribute("nomCanal");
                        ControladorUsuarioService controllerUser = new ControladorUsuarioService();
                        uytube.web.wsclients.IControladorUsuario u = controllerUser.getControladorUsuarioPort();

                        ControladorCanalService controllerCanal = new ControladorCanalService();
                        uytube.web.wsclients.IControladorCanal c = controllerCanal.getControladorCanalPort();

                        uytube.web.wsclients.DtUsuario user = u.buscarUsuarioCanal(nomCanal);
                        List videos =  c.listaVideos(user.getCanal());
                        String id;
                        if (videos!=null) {
                            uytube.web.wsclients.DtVideo vid;
                            for (int i = 0; i < videos.size(); i++) {
                                vid = (uytube.web.wsclients.DtVideo) videos.get(i);
                                if(!vid.isPrivado()){
                                    if (vid.getUrl() != null) {
                                        id = getID(vid.getUrl());
                    %>
                        <div class="col-md-4">
                            <div class="card mb-3">
                                <div class="card-body">
                                    <a href="verVideos.jsp?video=<%=vid.getNombre()%>&canal=<%=vid.getCanal().getNombreCanal()%>">
                                        <img src="https://img.youtube.com/vi/<%=id%>/0.jpg" class="card-img-top" alt="Miniatura de video">
                                    </a>
                                    <h5 class="card-title"><strong><%=vid.getNombre()%></strong></h5>
                                    <p class="card-text"><%=vid.getDescripcion()%></p>
                                </div>
                                <div class="card-footer">
                                    <%  Date date = vid.getFechaPublicacion().toGregorianCalendar().getTime();
                                        DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
                                        String fecha  = formatter.format(date);
                                        Calendar ca = Calendar.getInstance();
                                        ca.setTime(formatter.parse(fecha));
                                        ca.add(Calendar.DATE, 1);
                                        fecha = formatter.format(ca.getTime());%>
                                    <small class="text-muted">Subido el: <%=fecha%></small>
                                </div>
                            </div>
                        </div>
                    <%              }
                                }
                            }
                        }
                    %>
                </div>
            </div>
        </div>
    </body>
</html>
