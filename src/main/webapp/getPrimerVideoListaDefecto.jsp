<%-- 
    Document   : primerVideoListaDefecto
    Created on : 13 oct. 2019, 19:07:13
    Author     : tesla
--%>
<%@include file="getID.jsp" %>
<%@page import="interfaces.IControladorCanal"%>
<%@page import="fabrica.Fabrica"%>
<%@page import="java.util.List"%>
<%@page import="DataTypes.DtListaporDefecto"%>
<%@page import="DataTypes.DtVideo"%>
<%@page import="DataTypes.DtListaDefectoVideos"%>

<%!    public String[] getPrimerVideoListaDefecto(DtListaporDefecto list, String usuario) {
        System.out.println(usuario + " -> " + list.getNombreLista());
        Fabrica fabrica = Fabrica.getInstance();
        IControladorCanal controladorCanal = fabrica.getControladorCanal();
        DtListaDefectoVideos vid = null;
        DtVideo v = null;
        List videos = null;
        videos = (List) controladorCanal.getVideosListaDefecto(usuario, list.getNombreLista());
        if (!videos.isEmpty()) {
            vid = (DtListaDefectoVideos) videos.get(0);
            v = (DtVideo) controladorCanal.obtenerVideo(vid.getVideo(), vid.getCanal());
            String id = getID(v.getUrl());
            String[] array = {id, String.valueOf(videos.size())};
            /*array[0] = id;
            array[1] = String.valueOf(videos.size());*/
            return array;
        } else {

            return null;
        }
    }
%>
