<%--
  Created by IntelliJ IDEA.
  User: isaac
  Date: 11/10/2019
  Time: 18:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="assets/css/registrar.css">
    <title>Registro de Usuario</title>
</head>
<body>
<div class="container" style="margin-top: 50px; margin-bottom: 50px">
    <div class="row justify-content-center">
        <div class="card col s10 offset-s1 align z-depth-4">
            <div class="card-content">
                <form id="bodyForm" method="post" action="RegistrarServlet" novalidate enctype="multipart/form-data">
                    <span class="card-title" style="text-align:center">Registrar</span>
                    <div class="divider"></div>
                        <div class="row" style="margin-top: 10px; margin-bottom: -15px">
                            <div class="col s6">
                                <div class="input-field">
                                    <i class="material-icons prefix">person</i>
                                    <label for="nombre" >Nombre </label>
                                    <input type="text" name="nombre" id="nombre" onfocusout="validateNombre()">
                                    <span class="helper-text"></span>
                                </div>
                            </div>
                            <div class="col s6">
                                <div class="input-field">
                                    <i class="material-icons prefix">person</i>
                                    <label for="apellido">Apellido</label>
                                    <input type="text" name="apellido" id="apellido" onfocusout="validateApellido()">
                                    <span class="helper-text"></span>
                                </div>
                            </div>
                        </div>
                        <div class="input-field">
                            <i class="material-icons prefix">group</i>
                            <label for="nickname">Nickname</label>
                            <input type="text" name="nickname" id="nickname" onfocusout="validateNickname()">
                            <span class="helper-text"></span>
                        </div>
                        <div class="input-field">
                            <i class="material-icons prefix">email</i>
                            <label for="email">Email </label>
                            <input type="email" name="email" id="email" onfocusout="validateEmail()">
                            <span class="helper-text"></span>
                        </div>
                        <div class="input-field">
                            <i class="material-icons prefix">today</i>
                            <label for="fechaNac">Fecha de Nacimiento</label>
                            <input type="text" class="datepicker validate" name="fechaNac" id="fechaNac" required>
                            <span class="helper-text" data-error="Este campo es obligatorio"></span>
                        </div>
                        <div class="input-field">
                            <i class="material-icons prefix">lock_open</i>
                            <label for="password">Contraseña</label>
                            <input type="password" name="password" id="password" onfocusout="validatePassword()">
                            <span class="helper-text"></span>
                        </div>
                        <div class="input-field" >
                            <i class="material-icons prefix">lock_outline</i>
                            <label for="confirmPassword">Confirmar Contraseña</label>
                            <input type="password" name="confirmPassword" id="confirmPassword" onfocusout="validateConfirmPassword()">
                            <span class="helper-text"></span>
                        </div>
                        <div class="input-field">
                            <i class="material-icons prefix">videocam</i>
                            <label for="nomCanal">Nombre de Canal (Opcional)</label>
                            <input type="text" name="nomCanal" id="nomCanal" onfocusout="validateCanal()">
                            <span class="helper-text"></span>
                        </div>
                        <div class="input-field">
                            <i class="material-icons prefix">mode_edit</i>
                            <label for="descripcion" data-error="An error has occurred">Descripción</label>
                            <textarea id="descripcion" name="descripcion" class="materialize-textarea validate" data-length="300" maxlength="300" required></textarea>
                            <span class="helper-text" data-error="Este campo es obligatorio"></span>
                        </div>
                        <div class="file-field input-field">
                            <div class="waves-effect waves-light btn">
                                <span>Imágen</span>
                                <input type="file" name="image">
                            </div>
                            <div class="file-path-wrapper">
                                <input class="file-path validate" type="text">
                            </div>
                        </div>
                        <button type="submit" class="btn-block waves-effect waves-light btn"><i class="material-icons left">person</i>Registrar</button>
                        <div class="card-action">
                            <a href="login.jsp">Iniciar Sesión</a>
                        </div>
                </form>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="assets/js/jquery-3.4.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<script src="assets/js/registrarT.js" type="text/javascript"></script>
<script>
$(document).ready(function() {
    $('.datepicker').datepicker();
    $('textarea#descripcion').characterCounter();
    $('.datepicker').datepicker({
        firstDay: true,
        format: 'dd-mm-yyyy',
        i18n: {
            months: ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"],
            monthsShort: ["Ene", "Feb", "Mar", "Abr", "May", "Jun", "Jul", "Ago", "Set", "Oct", "Nov", "Dic"],
            weekdays: ["Domingo","Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado"],
            weekdaysShort: ["Dom","Lun", "Mar", "Mie", "Jue", "Vie", "Sab"],
            weekdaysAbbrev: ["D","L", "M", "M", "J", "V", "S"]
        }
    });
});
</script>
</body>
</html>
