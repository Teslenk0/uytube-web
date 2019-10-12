<%@ page import="fabrica.Fabrica" %>
<%@ page import="interfaces.IControladorCanal" %>
<%@ page import="java.util.List" %>
<%@ page import="DataTypes.DtCategoria" %><%--
  Created by IntelliJ IDEA.
  User: esteban
  Date: 10/10/19
  Time: 19:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="https://unpkg.com/popper.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <title>Registro de Usuario</title>
</head>
<body style="background-color: #32353E">
<div class="container" style="margin-top: 50px; margin-bottom: 50px">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Subir Video</div>
                <div class="card-body">

                    <form class="form-horizontal" method="post" action="AltaVideoServlet" id="formAltaVideo">

                        <div class="form-group">
                            <label for="nombreVideo" class="cols-sm-2 control-label">Nombre video</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa" aria-hidden="true"></i></span>
                                    <input type="text" class="form-control" name="nombreVideo" id="nombreVideo" placeholder="Ingresa nombre video" />
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="duracion" class="cols-sm-2 control-label">Duracion</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa" aria-hidden="true"></i></span>
                                    <input type="text" class="form-control" name="duracion" id="duracion" placeholder="Ingresa la duracion" />
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="url" class="cols-sm-2 control-label">URL</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa" aria-hidden="true"></i></span>
                                    <input type="text" class="form-control" name="url" id="url" placeholder="Ingresa url" />
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="descripcion" class="cols-sm-2 control-label">Descripcion</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa" aria-hidden="true"></i></span>
                                    <textarea class="form-control" rows="4" name="descripcion" id="descripcion"></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="Fecha" class="cols-sm-2 control-label">Fecha de publicacion</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa" aria-hidden="true"></i></span>
                                    <input type="date" class="form-control" name="Fecha" id="Fecha" />
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="nombreVideo" class="cols-sm-2 control-label">Estado de video</label>
                            <div class="custom-control custom-radio">
                                <input type="radio" class="custom-control-input" id="privado" name="defaultExampleRadios">
                                <label class="custom-control-label" for="privado" name="privado">Privado</label>
                            </div>
                            <div class="custom-control custom-radio">
                                <input type="radio" class="custom-control-input" id="publico" name="defaultExampleRadios" checked>
                                <label class="custom-control-label" for="publico">Publico</label>
                            </div>
                        </div>
                            <div class="dropdown">
                                <a aria-expanded="false" aria-haspopup="true" role="button" data-toggle="dropdown" class="dropdown-toggle" href="#">
                                    <span id="selected">Categorias</span><span class="caret"></span></a>
                                <% Fabrica fabrica = Fabrica.getInstance();
                                IControladorCanal controladorCanal = fabrica.getControladorCanal();
                                List lista = controladorCanal.getCategorias();
                                for(int x=0 ; x<lista.size(); x++) {
                                    DtCategoria c = (DtCategoria) lista.get(x);%>
                                <ul class="dropdown-menu" role="menu" aria-labelledby="dropdown">
                                    <li><a class="dropdown-item" id="cat"> <%=c.getnombreCategoria()%></a></li>
                                    <%}%>
                                </ul>
                            </div>

                        <div class="form-group " id="divError">
                            <button type="submit"  id="aceptar" class="btn btn-success btn-lg btn-block login-button">Aceptar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="assets/js/altaVideo.js" type="text/javascript"></script>
</body>
</html>