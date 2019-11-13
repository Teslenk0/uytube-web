<%@ page import="uytube.web.wsclients.ControladorCanalService" %>
<%@ page import="uytube.web.wsclients.DtCategoria" %>
<%@ page import="uytube.web.wsclients.IControladorCanal" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: esteban
  Date: 10/10/19
  Time: 19:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Alta Vídeo</title>
</head>
<body style="background-color: #32353E">
<div class="container" style="margin-top: 50px; margin-bottom: 50px">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Subir Vídeo</div>
                <div class="card-body">
                    <form class="form-horizontal" method="post" action="AltaVideoServlet" id="formAltaVideo">
                        <div class="form-group" id="divError">
                            <label for="nombreVideo" class="control-label">Nombre de vídeo</label>
                            <input type="text" class="form-control" name="nombreVideo" id="nombreVideo" placeholder="Ingresa Nombre Video" required/>
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
                            <label for="nombreVideo" class="control-label">Estado de vídeo</label>
                            <div class="custom-control custom-radio">
                                <input type="radio" class="custom-control-input" id="privado" value="publico" name="estado">
                                <label class="custom-control-label" for="privado" name="privado">Privado</label>
                            </div>
                            <div class="custom-control custom-radio">
                                <input type="radio" class="custom-control-input" id="publico" value="publico" name="estado" checked>
                                <label class="custom-control-label" for="publico">Público</label>
                            </div>
                        </div>

                        <label class="control-label" for="categorias">Categorías</label>
                        <div class="btn-group dropup">
                            <select id="categorias" name="categorias" required>
                                <%
                                    ControladorCanalService f = new ControladorCanalService();
                                    IControladorCanal controladorCanal = f.getControladorCanalPort();
                                    List lista = controladorCanal.getCategorias();
                                    for(int x=0 ; x<lista.size(); x++) {
                                        DtCategoria c = (DtCategoria) lista.get(x);
                                        if(c != null) {%>
                                <option value="<%=c.getNombreCategoria()%>" name="categoria"><%=c.getNombreCategoria()%></option>
                                <%}}%>
                            </select>
                        </div>
                        <div class="form-group " >
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