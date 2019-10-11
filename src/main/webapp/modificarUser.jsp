<%--
  Created by IntelliJ IDEA.
  User: isaac
  Date: 9/10/2019
  Time: 20:17
  To change this template use File | Settings | File Templates.
--%>
<%@page import="DataTypes.DtUsuario"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
                    <form class="form-horizontal" method="post" action="ValidarUsuarioServlet" id="formRegistrar">
                        <div class="form-group">
                            <label for="nickname" class="cols-sm-2 control-label">Nickname <span style="color: red">*</span></label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa" aria-hidden="true"></i></span>
                                    <input type="text" class="form-control" name="nickname" id="nickname" placeholder= "Escribir nombre" disabled>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="nombre" class="cols-sm-2 control-label">Nombre <span style="color: red">*</span></label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa" aria-hidden="true"></i></span>
                                    <input type="text" class="form-control" name="nombre" id="nombre" placeholder="Ingresa tu Nombre" oninvalid="this.setCustomValidity('Debe ingresar su nombrecito')" required>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="apellido" class="cols-sm-2 control-label">Apellido <span style="color: red">*</span></label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa" aria-hidden="true"></i></span>
                                    <input type="text" class="form-control" name="apellido" id="apellido" placeholder="Ingresa tu Apellido" required>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="email" class="cols-sm-2 control-label">Email <span style="color: red">*</span>
                            </label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa" aria-hidden="true"></i></span>
                                    <input type="email" class="form-control" name="email" id="email" placeholder="Ingresa tu Email" required/>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="fechaNac" class="cols-sm-2 control-label">Fecha de Nacimiento <span style="color: red">*</span></label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-lg" aria-hidden="true"></i></span>
                                    <input type="date" class="form-control" name="fechaNac" id="fechaNac" required/>
                                </div>
                            </div>
                        </div>
                        <div class="form-group" id="confirmacionDiv">
                            <label for="password" class="cols-sm-2 control-label">Contraseña <span style="color: red">*</span></label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-lg" aria-hidden="true"></i></span>
                                    <input type="password" class="form-control" name="password" id="password" placeholder="Ingresa tu Contraseña" required/>
                                </div>
                            </div>
                        </div>
                        <div class="form-group" >
                            <label for="confirmPassword" class="cols-sm-2 control-label">Repetir Contraseña <span style="color: red">*</span></label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-lg" aria-hidden="true"></i></span>
                                    <input type="password" class="form-control" name="confirmPassword" id="confirmPassword" placeholder="Repite tu Contraseña" required/>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="nomCanal" class="cols-sm-2 control-label">Nombre de Canal</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-lg" aria-hidden="true"></i></span>
                                    <input type="text" class="form-control" name="nomCanal" id="nomCanal" placeholder="Ingrese el Nombre de Canal" />
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="descripcion">Descripcion</label>
                            <textarea class="form-control" rows="4" id="descripcion"></textarea>
                        </div>
                        <div class="dropdown">
                            <button class="btn btn-secondary dropdown-toggle " type="button" id="dropdownMenuButton1" style="margin-left: 140px" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Videos
                            </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                                <a class="dropdown-item" href="#">Action</a>
                                <a class="dropdown-item" href="#">Another action</a>
                                <a class="dropdown-item" href="#">Something else here</a>
                            </div>
                        </div>
                        <div class="dropdown is-light">
                            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Listas de reproduccion
                            </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton2">
                                <a class="dropdown-item" href="#">Action</a>
                                <a class="dropdown-item" href="#">Another action</a>
                                <a class="dropdown-item" href="#">Something else here</a>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="nomCanal" class="cols-sm-2 control-label">Estado de canal</label>
                            <div class="custom-control custom-radio">
                                <input type="radio" class="custom-control-input" id="privado" name="defaultExampleRadios">
                                <label class="custom-control-label" for="privado">Privado</label>
                            </div>
                            <div class="custom-control custom-radio">
                                <input type="radio" class="custom-control-input" id="publico" name="defaultExampleRadios" checked>
                                <label class="custom-control-label" for="publico">Publico</label>
                            </div>
                        </div>
                        <form action="myform.cgi">
                            <input type="file" name="fileupload" value="fileupload" id="fileupload">
                        </form>
                        <div class="form-group">
                            <button style="margin-top: 10px" type="submit" class="btn btn-success btn-lg btn-block login-button" id="submitForm">Modificar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="assets/js/registrar.js" type="text/javascript"></script>
</body>
</html>
