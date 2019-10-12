<%-- 
    Document   : inicio
    Created on : 12 oct. 2019, 13:32:29
    Author     : tesla
--%>

<%@page import="DataTypes.DtUsuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio</title>
    </head>
    <body>
        <%
            DtUsuario user = null;
            if (session.getAttribute("usuario") != null) {
                user = (DtUsuario) session.getAttribute("usuario");
            }
        %>

        <h2>Bienvenido de nuevo, 
            <%=user.getNickname()%>
        </h2>
        <hr>
        <div class="row">
            <div class="form-group col-md-12">
                <p>This is a responsive sidebar template with dropdown menu based on bootstrap 4 framework.</p>
                <p> You can find the complete code on <a href="https://github.com/azouaoui-med/pro-sidebar-template" target="_blank">
                        Github</a>, it contains more themes and background image option</p>
            </div>
            <div class="form-group col-md-12">
                <iframe src="https://ghbtns.com/github-btn.html?user=azouaoui-med&repo=pro-sidebar-template&type=star&count=true&size=large"
                        frameborder="0" scrolling="0" width="140px" height="30px"></iframe>
                <iframe src="https://ghbtns.com/github-btn.html?user=azouaoui-med&repo=pro-sidebar-template&type=fork&count=true&size=large"
                        frameborder="0" scrolling="0" width="140px" height="30px"></iframe>
            </div>
        </div>
        <h5>Mi canal</h5>
        <hr>
        <!--<div class="row">
        <!-- Nav tabs -->
        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
            <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item">
                    <a class="nav-link active" id="videos-tab" data-toggle="tab" href="#videos" role="tab" aria-controls="videos" aria-selected="true">Videos 
                        <i class="fas fa-play"></i>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="playlists-tab" data-toggle="tab" href="#playlists" role="tab" aria-controls="playlists" aria-selected="false">PlayLists
                        <i class="fa fa-list"></i>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="social-tab" data-toggle="tab" href="#social" role="tab" aria-controls="social" aria-selected="false">Social
                        <i class="fas fa-users"></i>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="info-tab" data-toggle="tab" href="#informacion" role="tab" aria-controls="informacion" aria-selected="false">Informacion
                        <i class="fas fa-address-card"></i>
                    </a>
                </li>
            </ul>
        </div>
        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4">
            <div class="tab-content">
                <div class="tab-pane fade show active" id="videos" role="tabpanel" aria-labelledby="videos-tab">QUE OTA?</div>
                <div class="tab-pane fade" id="playlists" role="tabpanel" aria-labelledby="plylists-tab">HOLA BB</div>
                <div class="tab-pane fade" id="social" role="tabpanel" aria-labelledby="social-tab">JA VAI BOLTS </div>
                <div class="tab-pane fade" id="informacion" role="tabpanel" aria-labelledby="info-tab">TOMAR NO CU</div>
            </div>
        </div>

        <!--</div>-->
    </body>
</html>
