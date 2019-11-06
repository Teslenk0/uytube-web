<%@ page import="uytube.web.wsclients.DtUsuario" %><%--
    Document   : inicio
    Created on : 12 oct. 2019, 13:32:29
    Author     : tesla
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Canal</title>

        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
                crossorigin="anonymous"></script>
        <script src="assets/js/inicio.js" type="text/javascript"></script>
    </head>
    <body>
        <%DtUsuario user = (DtUsuario) session.getAttribute("usuario");%>
        <hr>
            <h5><%=user.getCanal().getNombreCanal()%></h5>
        <hr>
        <ul class="nav nav-tabs" id="myTab" role="tablist">
            <li class="nav-item">
                <a class="nav-link active" id="videos-tab" href="#videos" role="tab" aria-controls="videos" aria-selected="true">Videos 
                    <i class="fas fa-play"></i>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="playlists-tab" href="#playlists" role="tab" aria-controls="playlists" aria-selected="false">PlayLists
                    <i class="fa fa-list"></i>  
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" id="social-tab" href="#social" role="tab" aria-controls="social" aria-selected="false">Social
                    <i class="fas fa-users"></i>
                </a>
            </li>
        </ul>


        <div class="tab-content">
            <div class="tab-pane fade show active" id="videos" role="tabpanel" aria-labelledby="videos-tab"></div>
            <div class="tab-pane fade" id="playlists" role="tabpanel" aria-labelledby="playlists-tab"></div>
            <div class="tab-pane fade" id="social" role="tabpanel" aria-labelledby="social-tab"></div>
        </div>

        <script src="assets/js/inicio.js" type="text/javascript"></script>
        <script>
            $(document).ready(function () {
                $("#videos-tab").click();
            });
        </script>
    </body>
</html>
