<%-- 
    Document   : videos
    Created on : 12 oct. 2019, 15:47:40
    Author     : tesla
--%>

<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="DataTypes.DtVideo"%>
<%@page import="java.util.List"%>
<%@page import="DataTypes.DtUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Videos</title>
    </head>
    <body>
        <!-- HAY UN PROBLEMA CON LOS VIDEOS PORQUE LA URL NO ES APTA PARA EMBEBER -->
        <div class="container-fluid" id="panelVideos">
            <div class="row">
                <%
                    DtUsuario user = null;
                    if (session.getAttribute("usuario") != null) {
                        user = (DtUsuario) session.getAttribute("usuario");
                    }
                    /*http://www.youtube.com/watch?v=dQw4w9WgXcQ&a=GxdCwVVULXctT2lYDEPllDR0LRTutYfW
                                http://www.youtube.com/watch?v=dQw4w9WgXcQ 
                                http://youtu.be/dQw4w9WgXcQ 
                                http://www.youtube.com/embed/dQw4w9WgXcQ
                                http://www.youtube.com/v/dQw4w9WgXcQ 
                                http://www.youtube.com/e/dQw4w9WgXcQ
                                http://www.youtube.com/watch?v=dQw4w9WgXcQ
                                http://www.youtube.com/watch?feature=player_embedded&v=dQw4w9WgXcQ
                                http://www.youtube-nocookie.com/v/6L3ZvIMwZFM?version=3&hl=en_US&rel=0*/
                    DtVideo vid = null;
                    if (session.getAttribute("videos") != null) {
                        List videos = (List) session.getAttribute("videos");
                        String id;
                        String pattern = "(?<=watch\\?v=|/videos/|embed\\/|youtu.be\\/|\\/v\\/|\\/e\\/|watch\\?v%3D|watch\\?feature=player_embedded&v=|%2Fvideos%2F|embed%\u200C\u200B2F|youtu.be%2F|%2Fv%2F)[^#\\&\\?\\n]*";
                        Pattern compiledPattern = Pattern.compile(pattern);

                        for (int i = 0; i < videos.size(); i++) {
                            vid = (DtVideo) videos.get(i);
                            if (vid.getUrl() != null) {
                                Matcher matcher = compiledPattern.matcher(vid.getUrl()); //url is youtube url for which you want to extract the id.
                                if (matcher.find()) {
                                    id = matcher.group();
                                    System.out.println(id);
                                }else{
                                    id=null;
                                }

                %>
                <div class="col">
                    <div class="form-group col-md-12">
                        <div class="embed-responsive embed-responsive-16by9">
                            <iframe class="embed-responsive-item" src="https://www.youtube.com/embed/<%=id%>?modestbranding=1" allowfullscreen></iframe>
                        </div>
                        <a><h5><%=vid.getNombre()%></h5></a>
                    </div>
                </div>
                <%         }
                        }
                    }
                %>
            </div>
        </div>
    </body>
</html>
