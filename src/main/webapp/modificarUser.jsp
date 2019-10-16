<%@page import="DataTypes.DtUsuario"%>
<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@page session="true" %>
<html>
<head>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link rel="stylesheet" type="text/css" href="assets/css/modificaruser.css">
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <title>Modificar Usuario</title>
</head>
<body style="background-color: #32353E">
<%
    //allow access only if session exists
    DtUsuario user = null;
    HttpSession s = request.getSession(true);
    if (s.getAttribute("usuario") != null) {
        user = (DtUsuario) s.getAttribute("usuario");
    }
    Boolean isChannelPrivate = user.getCanal().getPrivado();
%>
<div id="modify-user-panel" class="container" style="margin-top: 50px; margin-bottom: 50px">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Modificar</div>
                <div class="card-body">
                    <form class="form-horizontal" method="post" action="ModificoUserServlet" id="formModificar" enctype="multipart/form-data">
                        <div class="form-group">
                            <label for="nickname" class="cols-sm-2 control-label">Nickname <span style="color: red">*</span></label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa" aria-hidden="true"></i></span>
                                    <input type="text" class="form-control" name="i-nickname" id="nickname" value="<%=user.getNickname()%>" disabled>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="nombre" class="cols-sm-2 control-label">Nombre <span style="color: red">*</span></label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa" aria-hidden="true"></i></span>
                                    <input type="text" class="form-control" name="nombre" id="nombre" value="<%=user.getNombre()%>" oninvalid="this.setCustomValidity('Debe ingresar su nombrecito')" required>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="apellido" class="cols-sm-2 control-label">Apellido <span style="color: red">*</span></label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa" aria-hidden="true"></i></span>
                                    <input type="text" class="form-control" name="apellido" id="apellido" value="<%=user.getApellido()%>" required>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="email" class="cols-sm-2 control-label">Email <span style="color: red">*</span>
                            </label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa" aria-hidden="true"></i></span>
                                    <input type="email" class="form-control" name="email" id="email" value="<%=user.getEmail()%>" disabled/>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="fechaNac" class="cols-sm-2 control-label">Fecha de Nacimiento <span style="color: red">*</span></label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-lg" aria-hidden="true"></i></span>
                                    <input type="date" class="form-control" name="fechaNac" id="fechaNac" value="<%=user.getFechaNac()%>" required/>
                                </div>
                            </div>
                        </div>
                        <div class="form-group" id="confirmacionDiv">
                            <label for="password" class="cols-sm-2 control-label">Contraseña <span style="color: red">*</span></label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-lg" aria-hidden="true"></i></span>
                                    <input type="password" class="form-control" name="password" id="password" value="<%=user.getContrasenia()%>" required/>
                                </div>
                            </div>
                        </div>
                        <div class="form-group" >
                            <label for="confirmPassword" class="cols-sm-2 control-label">Repetir Contraseña <span style="color: red">*</span></label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-lg" aria-hidden="true"></i></span>
                                    <input type="password" class="form-control" name="confirmPassword" id="confirmPassword" value="<%=user.getContrasenia()%>" required/>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="nomCanal" class="cols-sm-2 control-label">Nombre de Canal</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-lg" aria-hidden="true"></i></span>
                                    <input type="text" class="form-control" name="nomCanal" id="nomCanal" value="<%=user.getCanal().getNombre_canal()%>" />
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="descripcion">Descripcion</label>
                            <textarea class="form-control" rows="4" name="descripcion" id="descripcion"><%=user.getCanal().getDescripcion()%></textarea>
                        </div>
                        <div class="form-group">
                            <label for="nomCanal" class="cols-sm-2 control-label">Estado de canal</label>
                            <span id="is-channel-private" data-value="<%=isChannelPrivate%>" hidden></span>
                            <div class="custom-control custom-radio">
                                <input name="group1" value="privado" type="radio" class="custom-control-input" id="privado" name="defaultExampleRadios">
                                <label class="custom-control-label" for="privado">Privado</label>
                            </div>
                            <div class="custom-control custom-radio">
                                <input name="group1" value="publico" type="radio" class="custom-control-input" id="publico" name="defaultExampleRadios">
                                <label class="custom-control-label" for="publico">Publico</label>
                            </div>
                        </div>

                        <div class="form-group" style="display:inline">
                            <button style="margin-left: 35%; margin-right: 10px" id="modificarVideo_btn" type="button" class="btn btn-secondary">Videos</button><button id="modificarPlaylist_btn" type="button" class="btn btn-secondary">Playlists</button>
                        </div>

                        <div class="file-field input-field">
                            <div class="waves-effect waves-light btn">
                                <span>Imágen</span>
                                <input type="file" name="image" accept="image/*">
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
<script src="assets/js/modificarUser.js" type="text/javascript"></script>
</body>
</html>
