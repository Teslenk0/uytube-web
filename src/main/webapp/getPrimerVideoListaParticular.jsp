<%-- 
    Document   : getPrimerVideoListaParticular
    Created on : 13 oct. 2019, 20:47:20
    Author     : tesla
--%>

<%@include file="getID.jsp" %>
<%@page import="java.util.List"%>
<%@ page import="uytube.web.wsclients.DtListaParticulares" %>
<%@ page import="uytube.web.wsclients.ControladorCanalService" %>
<%@ page import="uytube.web.wsclients.IControladorCanal" %>
<%@ page import="uytube.web.wsclients.DtVideo" %>

<%!    public String[] getPrimerVideoListaParticular(DtListaParticulares list, String usuario) {
        ControladorCanalService c = new ControladorCanalService();
        IControladorCanal controladorCanal = c.getControladorCanalPort();
        uytube.web.wsclients.DtListaParticularVideos vid = null;
        DtVideo v = null;
        List videos = null;
        videos = controladorCanal.getVideosListaParticular(usuario, list.getNombreLista());
        if (!videos.isEmpty()) {
            vid = (uytube.web.wsclients.DtListaParticularVideos) videos.get(0);
            v = controladorCanal.obtenerVideo(vid.getVideo(), vid.getCanal());
            String id = getID(v.getUrl());
            String[] array = {id, String.valueOf(videos.size())};
            return array;
        } else {
            return null;
        }
    }
%>
