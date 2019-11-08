<%@ page import="uytube.web.wsclients.DtUsuario" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@page contentType="text/html;charset=UTF-8"%>
<%@page %>
<html>
<head>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link rel="stylesheet" type="text/css" href="assets/css/modificaruser.css">
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <title>Modificar Usuario</title>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
</head>
<body style="background-color: #32353E">
<%
    DtUsuario user = null;
    HttpSession s = request.getSession(true);
    if (s.getAttribute("usuario") != null) {
        user = (DtUsuario) s.getAttribute("usuario");
    }

    assert user != null;
    Boolean isChannelPrivate = user.getCanal().isPrivado();

    session.setAttribute("oldN",user.getCanal().getNombreCanal());
%>
<div id="modify-user-panel" class="container" style="margin-top: 50px; margin-bottom: 50px">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Modificar</div>
                <div class="card-body">
                    <form class="form-horizontal" method="post" action="ModificoUserServlet" id="formModificar" enctype="multipart/form-data">
                        <div class="form-group">
                            <label for="nickname" class="control-label">Nickname <span style="color: red">*</span></label>
                            <input type="text" class="form-control" name="i-nickname" id="nickname" value="<%=user.getNickname()%>" disabled>
                        </div>
                        <div class="form-group">
                            <label for="nombre" class="control-label">Nombre <span style="color: red">*</span></label>
                            <input type="text" class="form-control" name="nombre" id="nombre" value="<%=user.getNombre()%>" required>
                        </div>
                        <div class="form-group">
                            <label for="apellido" class="control-label">Apellido <span style="color: red">*</span></label>
                            <input type="text" class="form-control" name="apellido" id="apellido" value="<%=user.getApellido()%>" required>

                        </div>
                        <div class="form-group">
                            <label for="email" class="control-label">Email <span style="color: red">*</span></label>
                            <input type="email" class="form-control" name="email" id="email" value="<%=user.getEmail()%>" disabled/>
                        </div>
                        <div class="form-group">
                            <%  Date date = user.getFechaNac().toGregorianCalendar().getTime();
                                DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
                                String fecha  = formatter.format(date);%>
                            <label for="fechaNac" class="control-label">Fecha de Nacimiento <span style="color: red">*</span></label>
                            <input type="date" class="form-control" name="fechaNac" id="fechaNac" value="<%=fecha%>" required/>
                        </div>
                        <div class="form-group" id="confirmacionDiv">
                            <label for="password" class="control-label">Contraseña <span style="color: red">*</span></label>
                            <input type="password" class="form-control" name="password" id="password" value="<%=user.getContrasenia()%>" required/>
                        </div>
                        <div class="form-group" >
                            <label for="confirmPassword" class="cols-sm-2 control-label">Repetir Contraseña <span style="color: red">*</span></label>
                            <input type="password" class="form-control" name="confirmPassword" id="confirmPassword" value="<%=user.getContrasenia()%>" required/>
                        </div>
                        <div class="form-group" id="errorNom">
                            <label for="nomCanal" class="control-label">Nombre de Canal</label>
                            <input type="text" class="form-control" name="nomCanal" id="nomCanal" value="<%=user.getCanal().getNombreCanal()%>" />
                        </div>
                        <div class="form-group">
                            <label for="descripcion">Descripcion</label>
                            <textarea class="form-control" rows="4" name="descripcion" id="descripcion" required maxlength="300"><%=user.getCanal().getDescripcion()%></textarea>
                        </div>
                        <div class="form-group">
                            <label for="nomCanal" class="control-label">Estado de canal</label>
                            <span id="is-channel-private" data-value="<%=isChannelPrivate%>" hidden></span>
                            <div class="custom-control custom-radio">
                                <input name="group1" value="privado" type="radio" class="custom-control-input" id="privado">
                                <label class="custom-control-label" for="privado">Privado</label>
                            </div>
                            <div class="custom-control custom-radio">
                                <input name="group1" value="publico" type="radio" class="custom-control-input" id="publico">
                                <label class="custom-control-label" for="publico">Publico</label>
                            </div>
                        </div>

                        <div class="custom-file" style="margin-top: 2%; margin-bottom: 2%">
                                <input type="file" class="custom-file-input" name="image" id="image" accept="image/*">
                                <label class="custom-file-label" for="image">Elige una imágen</label>
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
<script>
    $(document).ready(function () {
        $(".custom-file-input").on("change", function() {
            const fileName = $(this).val().split("\\").pop();
            $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
        });

        const isChannelPrivate = $("#is-channel-private").attr("data-value");

        if (isChannelPrivate === "true") {
            $("#privado").attr("checked", true);
        } else {
            $("#publico").attr("checked", true);
        }

        const form = $("#formModificar");
        form.submit(function (e) {
            e.preventDefault();
            e.returnValue = false;
            const dato = $('#nomCanal').val().trim();
            $.ajax({
                type: 'get',
                url: 'ValidarModificarUserServlet',
                dataType: 'JSON',
                data:  {
                    loadProds: 1,
                    nombre: dato
                },
                success: function (response) {
                    if(!response.canal){
                        form.off('submit');
                        form.submit();
                    }else{
                        const div = $("#errorNom");
                        $('#alertaRoja').remove();
                        div.append('<p id="alertaRoja" style="color: red">Este nombre de canal ya esta en uso</p>');
                    }
                },
                error: function (data) {
                    console.log("ERROR: Fallo la peticion hacia el servlet");
                }
            });
        });
    });
</script>
<script src="assets/js/modificarUser.js" type="text/javascript"></script>
</body>
</html>
