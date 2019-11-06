<%-- 
    Document   : primerVideoListaDefecto
    Created on : 13 oct. 2019, 19:07:13
    Author     : tesla
--%>
<%@include file="getID.jsp" %>
<%@page import="java.util.List"%>
<%@ page import="uytube.web.wsclients.DtListaDefectoVideos" %>
<%@ page import="uytube.web.wsclients.DtVideo" %>
<%@ page import="uytube.web.wsclients.ControladorCanalService" %>
<%!    public String[] getPrimerVideoListaDefecto(uytube.web.wsclients.DtListaporDefecto list, String usuario) {
        ControladorCanalService c = new ControladorCanalService();
        uytube.web.wsclients.IControladorCanal controladorCanal = c.getControladorCanalPort();
        DtListaDefectoVideos vid = null;
        DtVideo v = null;
        List videos = null;
        videos = controladorCanal.getVideosListaDefecto(usuario, list.getNombreLista());
        if (!videos.isEmpty()) {
            vid = (DtListaDefectoVideos) videos.get(0);
            v = controladorCanal.obtenerVideo(vid.getVideo(), vid.getCanal());
            String id = getID(v.getUrl());
            String[] array = {id, String.valueOf(videos.size())};
            return array;
        } else {
            return null;
        }
    }
%>
