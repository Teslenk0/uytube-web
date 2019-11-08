<%--
  Created by IntelliJ IDEA.
  User: caste
  Date: 16/10/19
  Time: 18:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.List" %>
<%@ page import="uytube.web.wsclients.ControladorUsuarioService" %>
<%@ page import="uytube.web.wsclients.ControladorCanalService" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <title>Alta video</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="https://unpkg.com/popper.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
</head>
<body style="background-color: #32353E">
<div class="container" style="margin-top: 50px; margin-bottom: 50px">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Crear Playlist</div>
                <div class="card-body">
                    <form class="form-horizontal" method="post" action="CrearPlaylistServlet" id="formCrearPlaylist">
                        <div class="form-group" id="divError">
                            <div class="input-group">
                                <label for="nombrePlaylist" class="control-label">Nombre Playlist</label>
                                <input type="text" class="form-control" name="nombrePlaylist" id="nombrePlaylist" placeholder="Ingrese Nombre Playlist" required/>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="cols-sm-2 control-label">Estado de Playlist</label>
                            <div class="custom-control custom-radio">
                                <input name="group1" value="privado" type="radio" class="custom-control-input" id="privado" name="defaultExampleRadios" checked>
                                <label class="custom-control-label" for="privado">Privado</label>
                            </div>
                            <div class="custom-control custom-radio">
                                <input name="group1" value="publico" type="radio" class="custom-control-input" id="publico" name="defaultExampleRadios">
                                <label class="custom-control-label" for="publico">Público</label>
                            </div>
                        </div>
                        <label class="cols-sm-2 control-label" for="categorias">Categorías</label>
                        <div class="btn-group dropup" style="margin-bottom: 10px">
                            <select id="categorias" name="categorias">
                                <%  ControladorUsuarioService us = new ControladorUsuarioService();
                                    uytube.web.wsclients.IControladorUsuario u = us.getControladorUsuarioPort();
                                    ControladorCanalService controlador = new ControladorCanalService();
                                    uytube.web.wsclients.IControladorCanal c = controlador.getControladorCanalPort();

                                    List lista = c.getCategorias();
                                    for(int x=0 ; x<lista.size(); x++) {
                                        uytube.web.wsclients.DtCategoria cat = (uytube.web.wsclients.DtCategoria) lista.get(x);
                                        if(c != null) {%>
                                <option value="<%=cat.getNombreCategoria()%>" name="categoria"><%=cat.getNombreCategoria()%></option>
                                <%}}%>
                            </select>
                        </div>
                        <div class="form-group ">
                            <button type="submit" id="aceptar" class="btn btn-success btn-lg btn-block login-button">Aceptar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="assets/js/crearPlaylist.js" type="text/javascript"></script>
</body>
</html>
