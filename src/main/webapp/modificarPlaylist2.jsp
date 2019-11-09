<%@ page import="uytube.web.wsclients.ControladorCanalService" %><%--
  Created by IntelliJ IDEA.
  User: tecnologo
  Date: 17/10/19
  Time: 6:00 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link rel="stylesheet" type="text/css" href="assets/css/modificaruser.css">
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <title>Modificar Playlist</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
</head>
<body style="background-color: #EEEEEE">
    <!-- BARRA SUPERIOR -->
    <div class="barra_superior text-center" style="background-color:#343841">
        <div class="d-inline">
            <a class="navbar-brand" href="index.jsp"> <img src="assets/images/logo2.png" width="112" height="auto"></a>
        </div>
    </div>
<%
    uytube.web.wsclients.DtUsuario user = null;
    if (session.getAttribute("usuario") != null)
        user = (uytube.web.wsclients.DtUsuario) session.getAttribute("usuario");
    String nomLista = request.getParameter("nomLista");
    ControladorCanalService controllerCanal = new ControladorCanalService();
    uytube.web.wsclients.IControladorCanal controladorCanal = controllerCanal.getControladorCanalPort();
    uytube.web.wsclients.DtListaParticulares lista = controladorCanal.buscarListaParticular(nomLista,user.getCanal());
    Boolean isPlaylistPrivate = lista.isPrivado();
    session.setAttribute("lista", lista);

%>
<div id="modify-user-panel" class="container" style="margin-top: 50px; margin-bottom: 50px">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Modificar</div>
                <div class="card-body">
                    <form class="form-horizontal" method="post" action="ModificoPlaylistServlet">
                        <div class="form-group">
                            <label class="cols-sm-2 control-label">Estado de Canal</label>
                            <span id="is-lista-private" data-value="<%=isPlaylistPrivate%>" hidden></span>
                            <div class="custom-control custom-radio">
                                <input name="group1" value="privado" type="radio" class="custom-control-input" id="privado" name="defaultExampleRadios">
                                <label class="custom-control-label" for="privado">Privado</label>
                            </div>
                            <div class="custom-control custom-radio">
                                <input name="group1" value="publico" type="radio" class="custom-control-input" id="publico" name="defaultExampleRadios">
                                <label class="custom-control-label" for="publico">Público</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <button style="margin-top: 10px" type="submit" class="btn btn-success btn-lg btn-block login-button" id="submitForm">Modificar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="assets/js/modificarPlaylist.js"></script>
</body>
</html>