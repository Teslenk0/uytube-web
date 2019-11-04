<%@ page import="interfaces.IControladorCanal" %>
<%@ page import="fabrica.Fabrica" %>
<%@ page import="DataTypes.DtListaParticulares" %>
<%@ page import="DataTypes.DtUsuario" %><%--
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
</head>
<body style="background-color:#343841">
<%
    DtUsuario user = null;
    if (session.getAttribute("usuario") != null)
        user = (DtUsuario) session.getAttribute("usuario");
    String nomLista = request.getParameter("nomLista");
    Fabrica fabrica = Fabrica.getInstance();
    IControladorCanal controladorCanal = fabrica.getControladorCanal();
    DtListaParticulares lista = controladorCanal.buscarListaParticular(nomLista,user.getCanal());
    Boolean isPlaylistPrivate = lista.getPrivado();
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
                            <label class="cols-sm-2 control-label">Estado de canal</label>
                            <span id="is-lista-private" data-value="<%=isPlaylistPrivate%>" hidden></span>
                            <div class="custom-control custom-radio">
                                <input name="group1" value="privado" type="radio" class="custom-control-input" id="privado" name="defaultExampleRadios">
                                <label class="custom-control-label" for="privado">Privado</label>
                            </div>
                            <div class="custom-control custom-radio">
                                <input name="group1" value="publico" type="radio" class="custom-control-input" id="publico" name="defaultExampleRadios">
                                <label class="custom-control-label" for="publico">Publico</label>
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