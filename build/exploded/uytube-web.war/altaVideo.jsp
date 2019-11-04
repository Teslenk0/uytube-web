<%@ page import="fabrica.Fabrica" %>
<%@ page import="interfaces.IControladorCanal" %>
<%@ page import="java.util.List" %>
<%@ page import="DataTypes.DtCategoria" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="java.time.format.DateTimeFormatter" %><%--
  Created by IntelliJ IDEA.
  User: esteban
  Date: 10/10/19
  Time: 19:10
  To change this template use File | Settings | File Templates.
--%>
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
                <div class="card-header">Subir Video</div>
                <div class="card-body">
                    <form class="form-horizontal" method="post" action="AltaVideoServlet" id="formAltaVideo">
                        <div class="form-group" id="divError">
                            <label for="nombreVideo" class="control-label">Nombre video</label>
                            <input type="text" class="form-control" name="nombreVideo" id="nombreVideo" placeholder="Ingresa Nombre Video" required/>
                        </div>
                        <div class="form-group">
                            <label for="duracion" class="control-label">Duracion</label>
                            <input type="text" class="form-control" name="duracion" id="duracion" placeholder="Ingresa la Duración" required/>
                        </div>
                        <div class="form-group" id="urlError">
                            <label for="url" class="control-label">URL</label>
                            <input type="url" class="form-control" name="url" id="url" placeholder="Ingresa URL" required>
                        </div>
                        <div class="form-group">
                            <label for="descripcion" class="control-label">Descripción</label>
                            <textarea class="form-control" rows="4" name="descripcion" id="descripcion" required maxlength="300"></textarea>
                        </div>
                        <div class="form-group">
                            <label for="nombreVideo" class="control-label">Estado de video</label>
                            <div class="custom-control custom-radio">
                                <input type="radio" class="custom-control-input" id="privado" value="publico" name="estado">
                                <label class="custom-control-label" for="privado" name="privado">Privado</label>
                            </div>
                            <div class="custom-control custom-radio">
                                <input type="radio" class="custom-control-input" id="publico" value="publico" name="estado" checked>
                                <label class="custom-control-label" for="publico">Publico</label>
                            </div>
                        </div>

                        <label class="control-label" for="categorias">Categorías</label>
                        <div class="btn-group dropup" >
                            <select id="categorias" name="categorias" required>
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
<script src="assets/js/altaVideo.js" type="text/javascript"></script>
</body>
</html>