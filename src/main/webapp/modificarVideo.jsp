<%--
  Created by IntelliJ IDEA.
  User: isaac
  Date: 9/10/2019
  Time: 20:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.List" %>
<%@ page import="uytube.web.wsclients.*" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <title>Modificar Usuario</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
</head>
<body style="background-color: #32353E">
<%
    String nomVideo = request.getParameter("nombre");
    DtUsuario user = null;
    if (session.getAttribute("usuario") != null) {
        user = (DtUsuario) session.getAttribute("usuario");
    }
%>
<div class="container" style="margin-top: 50px; margin-bottom: 50px">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Modificar</div>
                <div class="card-body">
                    <form class="form-horizontal needs-validation" method="post" action="ModificarVideoServlet" id="formMVideo">
                        <%
                            ControladorCanalService f = new ControladorCanalService();
                            IControladorCanal c = f.getControladorCanalPort();
                            assert user != null;
                            DtVideo video = c.obtenerVideo(nomVideo, user.getCanal().getNombreCanal());
                            session.setAttribute("oldV",video.getNombre());
                            Boolean isChannelPrivate = video.isPrivado();
                        %>
                        <div class="form-group" id="errorNom">
                            <label for="nomV" class="control-label">Nombre de Video</label>
                            <input type="text" class="form-control" name="nomV" id="nomV" value="<%=video.getNombre()%>" required>
                        </div>
                        <div class="form-group">
                            <label for="fechaPu" class="control-label"></label>
                            <input type="date" class="form-control" name="fechaPu" id="fechaPu" value="<%=video.getFechaPublicacion()%>" required>
                        </div>
                        <div class="form-group" id="urlError">
                            <label for="url" class="control-label"></label>
                            <input type="url" class="form-control" name="url" id="url" value="<%=video.getUrl()%>" required>
                        </div>
                        <div class="form-group">
                            <label for="duracion" class="control-label"></label>
                            <input type="input" class="form-control" name="duracion" id="duracion" value="<%=video.getDuracion()%>" required>
                        </div>
                        <div class="form-group">
                            <label for="desc" class="control-label">Descripción</label>
                            <textarea class="form-control rounded-0" name="desc" id="desc" rows="4" required><%=video.getDescripcion()%></textarea>
                        </div>
                        <label class="cols-sm-2 control-label" for="categorias">Categorias</label>
                        <div class="btn-group dropup">
                            <select id="categorias" name="categorias">
                                <option value="<%=video.getCategoria()%>" selected hidden><%=video.getCategoria()%></option>
                                <%
                                    List lista = c.getCategorias();
                                    for (Object o : lista) {
                                        DtCategoria cat = (DtCategoria) o;
                                %>
                                <option value="<%=cat.getNombreCategoria()%>"><%=cat.getNombreCategoria()%></option>
                                <%
                                    }
                                %>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="privado">Estado de video</label>
                            <span id="is-channel-private" data-value="<%=isChannelPrivate%>" hidden></span>
                            <div class="custom-control custom-radio">
                                <input type="radio" class="custom-control-input" id="privado" value="publico" name="estado">
                                <label class="custom-control-label" for="privado">Privado</label>
                            </div>
                            <div class="custom-control custom-radio">
                                <input type="radio" class="custom-control-input" id="publico" value="publico" name="estado">
                                <label class="custom-control-label" for="publico">Publico</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <button style="margin-top: 10px" type="submit" class="btn btn-success btn-lg btn-block" id="submitForm">Modificar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="assets/js/modificarVideo.js" type="text/javascript"></script>
</body>
</html>
