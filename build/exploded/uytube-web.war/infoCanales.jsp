<%@page import="DataTypes.DtUsuario"%>
<%@ page import="fabrica.Fabrica" %>
<%@ page import="interfaces.IControladorUsuario" %>
<%@page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <title>Informacion Usuario</title>
</head>
<body>
<%
    String nomCanal = (String) session.getAttribute("nomCanal");
    Fabrica f = Fabrica.getInstance();
    IControladorUsuario u = f.getControladorUsuario();
    DtUsuario user = u.buscarUsuarioCanal(nomCanal);
%>
<div id="modify-user-panel" class="container" style="margin-top: 30px; margin-bottom: 50px">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Informacion General</div>
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
                            <input type="date" class="form-control" name="fechaNac" id="fechaNac" value="<%=user.getFechaNac()%>" disabled/>
                        </div>
                        <div class="form-group" id="errorNom">
                            <label for="nomCanal" class="control-label">Nombre de Canal</label>
                            <input type="text" class="form-control" name="nomCanal" id="nomCanal" value="<%=user.getCanal().getNombre_canal()%>" disabled/>
                        </div>
                        <div class="form-group">
                            <label for="descripcion">Descripcion</label>
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
