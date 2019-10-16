<%@ page import="interfaces.IControladorCanal" %>
<%@ page import="fabrica.Fabrica" %>
<%@ page import="java.util.List" %>
<%@ page import="DataTypes.DtVideo" %>
<%@include file="getID.jsp"%>
<%@ page import="DataTypes.DtComentario" %>
<%@ page import="DataTypes.DtAuxiliar" %>
<%@ page import="interfaces.IControladorUsuario" %>
<%@ page import="DataTypes.DtUsuario" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %><%--
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
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous" id="bootstrap-css">
    <link rel="stylesheet" type="text/css" href="assets/css/index.css">
    <link rel="stylesheet" type="text/css" href="assets/css/Comentarios.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>

    <%
        String nomVideo = request.getParameter("video");
        String canal = request.getParameter("canal");
        Fabrica fabrica = Fabrica.getInstance();
        IControladorCanal c = fabrica.getControladorCanal();
        DtVideo video = null;
        String url = null;
        if(!nomVideo.isEmpty() && !canal.isEmpty()) {
            video = c.obtenerVideo(nomVideo, canal);
            url = getID(video.getUrl());
            session.setAttribute("nomVideo", String.valueOf(nomVideo)); // guardo en la sesion el nombre video PA VO GIL!!
        }
    %>
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
                    <form class="form-horizontal needs-validation" method="post" action="NuevoComentarioServlet" id="formComentario">

                        <div class="form-group">
                             <div class="cols-sm-10">
                                 <iframe width="720" height="315" src="https://www.youtube.com/embed/<%=url%>?modestbranding=1" frameborder="0" allowfullscreen style="margin-left: 45px"></iframe>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="descripcion" class="cols-sm-2 control-label"><strong>Descripcion:</strong></label>
                            <div class="cols-sm-10">
                                <div class="input-group" >
                                    <span class="input-group-addon"><i class="fa fa" aria-hidden="true"></i></span>
                                    <textarea class="form-control" rows="4" name="descripcion" id="descripcion" placeholder="<%=video.getDescripcion()%>" disabled></textarea>
                                </div>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="comentario" class="cols-sm-2 control-label"><strong>Comentario:</strong></label>
                            <div class="cols-sm-10">
                                <div class="input-group" >
                                    <span class="input-group-addon"><i class="fa fa" aria-hidden="true"></i></span>
                                    <textarea class="form-control" rows="2" name="comentario" id="comentario" placeholder="Agrega un comentario"></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="form-group" id="error" >
                            <button type="submit"  id="comenta" name="comenta" class="btn btn-success btn-lg btn-block login-button" style="margin-left: 650px; width: 130px">Comentar</button>
                        </div>
                    </form>
                    <div >
                        <h1>Comentarios</h1>
                        <%List lista = c.listaComentarios(video);
                        for(int x=0 ; x<lista.size(); x++){
                            DtAuxiliar com = (DtAuxiliar) lista.get(x);
                            if(com != null){
                                IControladorUsuario u = fabrica.getControladorUsuario();%>

                            <!-- Contenedor Principal -->
                            <div class="comments-container">
                                <ul id="comments-list" class="comments-list">
                                    <li>
                                        <%if (com.getPadre() == null) {%>
                                        <div class="comment-main-level">
                                            <!-- Avatar -->
                                            <%DtUsuario usuario = u.buscarUsuario(com.getNick());
                                            String ruta = "assets" + usuario.getImagen().toString();%>
                                            <div class="comment-avatar"><img src="<%=ruta%>" alt=""></div>
                                            <!-- Contenedor del Comentario -->
                                            <div class="comment-box">
                                                <form class="form-horizontal needs-validation" method="post" action="ResponderComentarioServlet" id="fromRespuesta">
                                                    <div class="comment-head">
                                                        <h6 class="comment-name"><a href="Canal de la persona?"><%=com.getNick()%></a></h6>
                                                        <span><%=com.getFecha()+" Hs"%></span>
                                                    </div>
                                                    <div class="comment-content">
                                                        <%=com.getComentario()%>
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="cols-sm-10">
                                                            <div class="input-group" >
                                                                <span class="input-group-addon"><i class="fa fa" aria-hidden="true"></i></span>
                                                                <textarea class="form-control" rows="2" name="respuesta" id="respuesta" placeholder="Agrega una respuesta"></textarea>
                                                                <input type="hidden"  name="referencia" value="<%=com.getReferencia()%>" >
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group" id="error1" >
                                                        <button type="submit"  id="resp" name="resp" class="btn" >responder</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                        <%}
                                        else {
                                            List lista2 = c.listaComentarios(video);
                                            for(int y=0; y<lista2.size(); y++){
                                                DtAuxiliar resp =(DtAuxiliar) lista2.get(y);

                                                if(com.getPadre().equals(resp.getReferencia().toString())){;%>

                                                    <!-- Respuestas de los comentarios -->
                                                    <ul class="comments-list reply-list">
                                                        <li>
                                                            <!-- Avatar -->
                                                            <%DtUsuario usuario = u.buscarUsuario(resp.getNick());
                                                            String ruta = "assets" + usuario.getImagen().toString();%>
                                                            <div class="comment-avatar"><img src="<%=ruta%>" alt=""></div>
                                                            <!-- Contenedor del Comentario -->
                                                            <div class="comment-box">
                                                                <form class="form-horizontal needs-validation" method="post" action="ResponderRespuestaServlet" id="fromRespuesta1">
                                                                    <div class="comment-head">
                                                                        <h6 class="comment-name"><a href="canal de la persona"><%=com.getNick()%></a></h6>
                                                                        <span><%=com.getFecha()+" Hs"%></span>
                                                                        <button type="submit" id="ref" name="ref" style="border: transparent" ></button>
                                                                    </div>
                                                                    <div class="comment-content">
                                                                        <%="@"+resp.getNick() +": "+com.getComentario()%>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <div class="cols-sm-10">
                                                                            <div class="input-group" >
                                                                                <span class="input-group-addon"><i class="fa fa" aria-hidden="true"></i></span>
                                                                                <textarea class="form-control" rows="2" name="respuesta1" id="respuesta1" placeholder="Agrega una respuesta"></textarea>
                                                                                <input type="hidden"  name="referencia1" value="<%=com.getReferencia()%>" >
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group" id="error2" >
                                                                        <button type="submit" id="resp1" name="resp" class="btn" >responder</button>
                                                                    </div>
                                                                </form>
                                                            </div>
                                                        </li>
                                                    </ul>
                                                </li>
                                                <%}
                                            }
                                        }
                                    }
                                    }%>

                                </ul>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script src="assets/js/verVideos.js" type="text/javascript"></script>
    <script src="assets/js/ResponderComentario.js" type="text/javascript"></script>
    <script src="assets/js/responderRespuesta.js" type="text/javascript"></script>
</body>
</html>




