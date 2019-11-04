<%-- 
    Document   : getPrimerVideoListaParticular
    Created on : 13 oct. 2019, 20:47:20
    Author     : tesla
--%>

<%@include file="getID.jsp" %>
<%@page import="interfaces.IControladorCanal"%>
<%@page import="fabrica.Fabrica"%>
<%@page import="java.util.List"%>
<%@ page import="DataTypes.*" %>

<%!    public String[] getPrimerVideoListaParticular(DtListaReproduccion list, String usuario) {
        Fabrica fabrica = Fabrica.getInstance();
        IControladorCanal controladorCanal = fabrica.getControladorCanal();
        DtListaParticularVideos vid = null;
        DtVideo v = null;
        List videos = null;
        videos = (List) controladorCanal.getVideosListaParticular(usuario, list.getNombreLista());
        if (!videos.isEmpty()) {
            vid = (DtListaParticularVideos) videos.get(0);
            v = (DtVideo) controladorCanal.obtenerVideo(vid.getVideo(), vid.getCanal());
            String id = getID(v.getUrl());
            String[] array = {id, String.valueOf(videos.size())};
            return array;
        } else {

            return null;
        }
    }
%>
