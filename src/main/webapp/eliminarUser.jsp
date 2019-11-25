<%@ page import="uytube.web.wsclients.ControladorCanalService" %><%--
  Created by IntelliJ IDEA.
  User: tecnologo
  Date: 17/10/19
  Time: 6:00 pm
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Modificar Playlist</title>

    <script src='assets/js/sweetalert2.all.min.js' type='text/javascript'></script>
</head>
<body style="background-color: #EEEEEE">
<div id="modify-user-panel" class="container" style="margin-top: 50px; margin-bottom: 50px">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Eliminar</div>
                <div class="card-body">
                    <form class="form-horizontal" method="post" action="EliminarUserServlet" id="formEliminarUser">
                        <div class="form-group">
                            <label class="cols-sm-2 control-label">Los datos serán eliminados sin posibilidad de recuperación</label>
                        </div>
                        <div class="form-group">
                            <button style="margin-top: 10px" type="submit" class="btn btn-danger btn-lg btn-block login-button" id="submitForm">Eliminar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
    <script src="assets/js/eliminarUser.js"></script>
</body>
</html>