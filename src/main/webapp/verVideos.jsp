<%@ page import="interfaces.IControladorCanal" %>
<%@ page import="fabrica.Fabrica" %>
<%@ page import="java.util.List" %>
<%@ page import="DataTypes.DtVideo" %>
<%@ page import="DataTypes.DtComentario" %><%--
  Created by IntelliJ IDEA.
  User: esteban
  Date: 14/10/19
  Time: 21:10
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Ver Videos</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous" id="bootstrap-css">
    <link rel="stylesheet" type="text/css" href="assets/css/index.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script type="text/javascript" src='verVideos.jsp'> </script>
</head>
<body>
<!-- BARRA SUPERIOR -->
<div class="barra_superior" style="background-color:black">
    <div class="d-inline">
        <a class="navbar-brand" href="index.jsp" style="margin-left: 45%"> <img src="assets/images/logo2.png" width="112" height="auto"></a>
    </div>
</div>

<div class="row justify-content-center">
    <div class="col-md-8">
        <div class="card">
            <div class="card-body">
                <form class="form-horizontal" method="post" action="AltaVideoServlet" id="formAltaVideo">

                    <div class="form-group">
                         <div class="cols-sm-10">
                             <iframe width="720" height="315" src="https://www.youtube.com/embed/Es6GRMHXeCQ?modestbranding=1" frameborder="0" allowfullscreen style="margin-left: 45px"></iframe>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="descripcion" class="cols-sm-2 control-label"><strong>Descripcion:</strong></label>
                        <div class="cols-sm-10">
                            <div class="input-group" >
                                <span class="input-group-addon"><i class="fa fa" aria-hidden="true"></i></span>
                                <textarea class="form-control" rows="3" name="descripcion" id="descripcion" placeholder="4A ETAPA A CONTRAMANO LIGUILLA"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="comentario" class="cols-sm-2 control-label"><strong Comentario:></strong></label>
                        <div class="cols-sm-10">
                            <div class="input-group" >
                                <span class="input-group-addon"><i class="fa fa" aria-hidden="true"></i></span>
                                <textarea class="form-control" rows="2" name="comentario" id="comentario" placeholder="Agrega un comentario"></textarea>
                            </div>
                        </div>
                    </div>

                    <div class="form-group" >
                        <button type="submit"  id="comenta" class="btn btn-success btn-lg btn-block login-button" style="margin-left: 650px; width: 130px">Comentar</button>
                    </div>

                    <div >
                        <a >Aca van los comentarios</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</div>
</body>
</html>




