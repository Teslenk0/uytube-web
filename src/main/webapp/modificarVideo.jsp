<%--
  Created by IntelliJ IDEA.
  User: isaac
  Date: 9/10/2019
  Time: 20:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.util.List" %>
<%@ page import="uytube.web.wsclients.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Modificar Vídeo</title>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script type="text/javascript" src="assets/js/jquery-3.4.1.min.js"></script>
</head>
<body style="background-color: #EEEEEE">
<%
    String nomVideo = request.getParameter("nombre");
    DtUsuario user = null;
    if (session.getAttribute("usuario") != null) {
        user = (DtUsuario) session.getAttribute("usuario");
    }
%>
<div class="barra_superior text-center" style="background-color:#343841">
    <div class="d-inline">
        <a class="navbar-brand" href="index.jsp"> <img src="assets/images/logo2.png" width="112" height="auto"></a>
    </div>
</div>
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
                            <label for="nomV" class="control-label">Nombre de Vídeo</label>
                            <input type="text" class="form-control" name="nomV" id="nomV" value="<%=video.getNombre()%>" required>
                        </div>
                        <div class="form-group">
                            <label for="fechaPu" class="control-label">Fecha de Publicación</label>
                            <%  Date date = video.getFechaPublicacion().toGregorianCalendar().getTime();
                                DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                                String fecha  = formatter.format(date);
                                Calendar ca = Calendar.getInstance();
                                ca.setTime(formatter.parse(fecha));
                                ca.add(Calendar.DATE, 1);
                                fecha = formatter.format(ca.getTime());
                            %>
                            <input type="date" class="form-control" name="fechaPu" id="fechaPu" value="<%=fecha%>" required>
                        </div>
                        <div class="form-group" id="urlError">
                            <label for="url" class="control-label">URL de Vídeo</label>
                            <input type="url" class="form-control" name="url" id="url" value="<%=video.getUrl()%>" required>
                        </div>
                        <div class="form-group">
                            <label for="desc" class="control-label">Descripción</label>
                            <textarea class="form-control rounded-0" name="desc" id="desc" rows="4" required><%=video.getDescripcion()%></textarea>
                        </div>
                        <label class="cols-sm-2 control-label" for="categorias">Categorías</label>
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
                            <label for="privado">Estado de vídeo</label>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>
