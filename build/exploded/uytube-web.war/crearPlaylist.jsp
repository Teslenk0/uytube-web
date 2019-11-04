<%--
  Created by IntelliJ IDEA.
  User: caste
  Date: 16/10/19
  Time: 18:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="fabrica.Fabrica" %>
<%@ page import="interfaces.IControladorCanal" %>
<%@ page import="java.util.List" %>
<%@ page import="DataTypes.DtCategoria" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Alta video</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="https://unpkg.com/popper.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

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
                            <label for="nombrePlaylist" class="cols-sm-2 control-label">Nombre playlist</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa" aria-hidden="true"></i></span>
                                    <input type="text" class="form-control" name="nombrePlaylist" id="nombrePlaylist" placeholder="Ingrese nombre Playlist" />
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="cols-sm-2 control-label">Estado de Playlist</label>
                            <div class="custom-control custom-radio">
                                <input name="group1" value="privado" type="radio" class="custom-control-input" id="privado" name="defaultExampleRadios">
                                <label class="custom-control-label" for="privado">Privado</label>
                            </div>
                            <div class="custom-control custom-radio">
                                <input name="group1" value="publico" type="radio" class="custom-control-input" id="publico" name="defaultExampleRadios">
                                <label class="custom-control-label" for="publico">Publico</label>
                            </div>
                        </div>
                        <label class="cols-sm-2 control-label" for="categorias">Categorias</label>
                        <div class="btn-group dropup" style="margin-bottom: 10px">
                            <select id="categorias" name="categorias">
                                <% Fabrica fabrica = Fabrica.getInstance();
                                    IControladorCanal controladorCanal = fabrica.getControladorCanal();
                                    List lista = controladorCanal.getCategorias();
                                    for(int x=0 ; x<lista.size(); x++) {
                                        DtCategoria c = (DtCategoria) lista.get(x);
                                        if(c != null) {%>
                                <option value="<%=c.getnombreCategoria()%>" name="categoria"><%=c.getnombreCategoria()%></option>
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
