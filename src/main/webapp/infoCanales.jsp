
<%@ page import="uytube.web.wsclients.ControladorUsuarioService" %>
<%@ page import="uytube.web.wsclients.ControladorCanalService" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Información Usuario</title>
</head>
<body>
<%
    ControladorUsuarioService us = new ControladorUsuarioService();
    uytube.web.wsclients.IControladorUsuario u = us.getControladorUsuarioPort();

    String nomCanal = (String) session.getAttribute("nomCanal");

    uytube.web.wsclients.DtUsuario user = u.buscarUsuarioCanal(nomCanal);
%>
<div id="modify-user-panel" class="container" style="margin-top: 30px; margin-bottom: 50px">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Información General</div>
                <div class="card-body">
                    <form class="form-horizontal" method="post" action="ModificoUserServlet" id="formModificar" enctype="multipart/form-data">
                        <div class="form-group">
                            <label for="nickname" class="control-label">Nickname</label>
                            <input type="text" class="form-control" name="i-nickname" id="nickname" value="<%=user.getNickname()%>" disabled>
                        </div>
                        <div class="form-group">
                            <label for="nombre" class="control-label">Nombre</label>
                            <input type="text" class="form-control" name="nombre" id="nombre" value="<%=user.getNombre()%>" disabled>
                        </div>
                        <div class="form-group">
                            <label for="apellido" class="control-label">Apellido</label>
                            <input type="text" class="form-control" name="apellido" id="apellido" value="<%=user.getApellido()%>" disabled>

                        </div>
                        <div class="form-group">
                            <label for="fechaNac" class="control-label">Fecha de Nacimiento</label>
                            <%  Date date = user.getFechaNac().toGregorianCalendar().getTime();
                                DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                                String fecha  = formatter.format(date);
                            %>
                            <input type="date" class="form-control" name="fechaNac" id="fechaNac" value="<%=fecha%>" disabled/>
                        </div>
                        <div class="form-group" id="errorNom">
                            <label for="nomCanal" class="control-label">Nombre de Canal</label>
                            <input type="text" class="form-control" name="nomCanal" id="nomCanal" value="<%=user.getCanal().getNombreCanal()%>" disabled/>
                        </div>
                        <div class="form-group">
                            <label for="descripcion">Descripción</label>
                            <textarea class="form-control" rows="4" name="descripcion" id="descripcion" disabled maxlength="300"><%=user.getCanal().getDescripcion()%></textarea>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>