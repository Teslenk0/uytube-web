<%--
  Created by IntelliJ IDEA.
  User: isaac
  Date: 9/10/2019
  Time: 20:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"
      id="bootstrap-css">
    <link rel="stylesheet" type="text/css" href="assets/css/registrar.css">
    <script type="text/javascript" src="assets/js/jquery-3.4.1.min.js"></script>
    <title>Registro de Usuario</title>
</head>
<body style="background-color: #32353E">
<div class="container" style="margin-top: 50px; margin-bottom: 50px">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Registrar</div>
                <div class="card-body">

                    <form class="form-horizontal" method="post" action="RegistrarServlet" id="validateForm">

                        <div class="form-group">
                            <label for="nombre" class="cols-sm-2 control-label">Nombre <span style="color: red">*</span></label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                                    <input type="text" class="form-control" name="nombre" id="nombre" placeholder="Ingresa tu Nombre">
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="apellido" class="cols-sm-2 control-label">Apellido <span style="color: red">*</span></label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                                    <input type="text" class="form-control" name="apellido" id="apellido" placeholder="Ingresa tu Apellido">
                                </div>
                            </div>
                        </div>
                        <div class="form-group" id="dNickname">
                            <label for="nickname" class="cols-sm-2 control-label">Nickname <span style="color: red">*</span></label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
                                    <input type="text" class="form-control" name="nickname" id="nickname" placeholder="Ingresa tu Nickname">
                                </div>
                            </div>
                        </div>
                        <div class="form-group" id="dEmail">
                            <label for="email" class="cols-sm-2 control-label">Email <span style="color: red">*</span></label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
                                    <input type="email" class="form-control" name="email" id="email" placeholder="Ingresa tu Email"/>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="fechaNac" class="cols-sm-2 control-label">Fecha de Nacimiento <span style="color: red">*</span></label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                                    <input type="date" class="form-control" name="fechaNac" id="fechaNac" required/>
                                </div>
                            </div>
                        </div>
                        <div class="form-group" id="confirmacionDiv">
                            <label for="password" class="cols-sm-2 control-label">Contraseña <span style="color: red">*</span></label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                                    <input type="password" class="form-control" name="password" id="password" placeholder="Ingresa tu Contraseña"/>
                                </div>
                            </div>
                        </div>
                        <div class="form-group" >
                            <label for="confirmPassword" class="cols-sm-2 control-label">Repetir Contraseña <span style="color: red">*</span></label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                                    <input type="password" class="form-control" name="confirmPassword" id="confirmPassword" placeholder="Repite tu Contraseña"/>
                                </div>
                            </div>
                        </div>
                        <div class="form-group" id="dCanal">
                            <label for="nomCanal" class="cols-sm-2 control-label">Nombre de Canal</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                                    <input type="text" class="form-control" name="nomCanal" id="nomCanal" placeholder="Ingrese el Nombre de Canal" />
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="descripcion">Descripcion</label>
                            <textarea class="form-control" rows="4" id="descripcion" name="descripcion"></textarea>
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
                        <form action="#">
                            <input type="file" name="fileupload" value="fileupload" id="fileupload">
                        </form>
                        <div class="form-group">
                            <button type="button" class="btn btn-success btn-lg btn-block login-button" id="submitForm">Registrar</button>
                        </div>
                        <div class="login-register">
                            <a href="login.jsp">Iniciar Sesión</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script src='http://cdnjs.cloudflare.com/ajax/libs/bootstrap-validator/0.4.5/js/bootstrapvalidator.min.js'></script>
<script src="assets/js/registrar.js" type="text/javascript"></script>
</body>
</html>
