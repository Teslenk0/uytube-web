<%-- 
    Document   : getPrimerVideoListaParticular
    Created on : 13 oct. 2019, 20:47:20
    Author     : tesla
--%>

<%@page import="DataTypes.DtListaParticularVideos"%>
<%@page import="DataTypes.DtListaParticulares"%>
<%@include file="getID.jsp" %>
<%@page import="interfaces.IControladorCanal"%>
<%@page import="fabrica.Fabrica"%>
<%@page import="java.util.List"%>
<%@page import="DataTypes.DtListaporDefecto"%>
<%@page import="DataTypes.DtVideo"%>
<%@page import="DataTypes.DtListaDefectoVideos"%>

<%!    public String[] getPrimerVideoListaParticular(DtListaParticulares list, String usuario) {
        System.out.println(usuario + " -> " + list.getNombreLista());
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
