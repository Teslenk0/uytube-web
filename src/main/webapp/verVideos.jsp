
<%@include file="getID.jsp"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="uytube.web.wsclients.ControladorUsuarioService" %>
<%@ page import="uytube.web.wsclients.ControladorCanalService" %>
<%@ page import="uytube.web.wsclients.DtAuxiliarValorar" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
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
    <link rel="stylesheet" type="text/css" href="assets/css/meGusta.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
</head>
<body>
    <%
        response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");
        String nomVideo = request.getParameter("video"); // obtengo  parametros del href
        String canal = request.getParameter("canal");

        ControladorUsuarioService usuario = new ControladorUsuarioService();
        uytube.web.wsclients.IControladorUsuario u = usuario.getControladorUsuarioPort();
        ControladorCanalService controlador = new ControladorCanalService();
        uytube.web.wsclients.IControladorCanal c = controlador.getControladorCanalPort();


        uytube.web.wsclients.DtUsuario usuarioDuenio = u.buscarUsuarioCanal(canal);

        uytube.web.wsclients.DtVideo video = null;
        String url = null;
        if(!nomVideo.isEmpty() && !canal.isEmpty()) {
            video = c.obtenerVideo(nomVideo, canal);

            url = getID(video.getUrl());
            session.setAttribute("nomVideo", nomVideo);
            session.setAttribute("canal", canal);
        }
        uytube.web.wsclients.DtUsuario logeado = null;
        if (session.getAttribute("usuario") != null) {
            logeado = (uytube.web.wsclients.DtUsuario) session.getAttribute("usuario");
            c.agregarVideoHistorial(video, logeado.getCanal());
        }
    %>
    <!-- BARRA SUPERIOR -->
    <div class="barra_superior text-center" style="background-color:#343841">
        <div class="d-inline">
            <a class="navbar-brand" href="index.jsp"> <img src="assets/images/logo2.png" width="112" height="auto"></a>
        </div>
    </div>
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-body">
                    <form class="form-horizontal needs-validation" method="post" action="NuevoComentarioServlet" id="formComentario">

                        <div class="form-group">
                             <div class="cols-sm-10 iframe-container">
                                 <iframe src="https://www.youtube.com/embed/<%=url%>?modestbranding=1" frameborder="0" allowfullscreen></iframe>
                            </div>
                        </div>
                        <div class="form-group" >
                           <%List listaV = c.listaMeGustas(usuarioDuenio.getNickname());
                            uytube.web.wsclients.DtAuxiliarValorar dtaux;
                            int contMg = 0;
                            int contNmg = 0;
                            boolean esta = false;
                            boolean mg = false;
                            if(listaV != null){
                                for (Object o : listaV) {
                                    dtaux = (uytube.web.wsclients.DtAuxiliarValorar) o;
                                    if (o != null) {

                                        if (nomVideo.equals(dtaux.getVid()) && dtaux.getVal().equals("Me gusta")) {
                                            contMg++;
                                        }
                                        if (nomVideo.equals(dtaux.getVid()) && dtaux.getVal().equals("No me gusta")) {
                                            contNmg++;
                                        }
                                    }
                                    if (logeado != null) {
                                        if (nomVideo.equals(dtaux.getVid()) && logeado.getNickname().equals(dtaux.getUser())) {
                                            esta = true;
                                            if (dtaux.getVal().equals("Me gusta")) {
                                                mg = true;
                                            }
                                        }
                                    }
                                }
                           %>
                                <div class="btn-group float-right" role="group">
                                    <%if(contMg != 0) {%>
                                    <a><%=contMg%></a>
                                    <%}
                                    if (logeado != null) {
                                        if(!esta) {%>
                                            <a href="/uytube/MegustaVideoServlet" class="like" id="like" title="Me gusta" style="margin-left: 5px"> <i class="fa fa-thumbs-o-up" aria-hidden="true" ></i><br></a>
                                            <a href="/uytube/NomeGustaVideoServlet" class="dislike" id="dislike" title="No me gusta" style="margin-left: 15px"><i class="fa fa-thumbs-o-down" aria-hidden="true"></i><br></a>
                                        <%}
                                        else{
                                            if(mg) {%>
                                                <a href="/uytube/CambiarMegustaServlet" class="like" id="like" title="Te gusta" style="margin-left: 5px"> <i class="fa fa-thumbs-o-up" aria-hidden="true" style="color: red" ></i><br></a>
                                                <a href="#" class="dislike" id="dislike" title="No me gusta" style="margin-left: 15px"><i class="fa fa-thumbs-o-down" aria-hidden="true"></i><br></a>
                                            <%}
                                            else{%>
                                                <a href="#" class="like" id="like" title="Me gusta" style="margin-left: 5px"> <i class="fa fa-thumbs-o-up" aria-hidden="true" ></i><br></a>
                                                <a href="/uytube/CambiarNomegustaServlet" class="dislike" id="dislike" title="No te gusta" style="margin-left: 15px"><i class="fa fa-thumbs-o-down" aria-hidden="true" style="color: red"></i><br></a>
                                            <%}
                                        }
                                    }
                                    else{%>
                                        <a class="like" id="like" title="Me gusta" style="margin-left: 5px"> <i class="fa fa-thumbs-o-up" aria-hidden="true" ></i><br></a>
                                        <a class="dislike" id="dislike" title="No me gusta" style="margin-left: 15px"><i class="fa fa-thumbs-o-down" aria-hidden="true"></i><br></a>
                                    <%}
                                    if(contNmg != 0) {%>
                                        <a style="margin-left: 5px" ><%=contNmg%></a>
                                    <%}%>
                                </div>

                            <%}%>
                        </div>
                        <%if(logeado!=null) {
                            assert video != null;
                            if(logeado.getCanal().getNombreCanal().equals(video.getCanal().getNombreCanal())){%>
                                <br>
                                <div class="btn-group" role="group">
                                    <a href="modificarVideo.jsp?nombre=<%=video.getNombre()%>" class="btn btn-primary">Modificar<span class="badge"></span></a>
                                </div>

                                <div class="dropdown" style="margin-top: 20px">
                                    <button class="btn btn-success dropdown-toggle" type="button" id="dropdownMeGusta" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Likes
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="dropdownMeGusta">
                                <%
                                boolean entrarMg = false;
                                DtAuxiliarValorar auxi;
                                for(int i=0; i<listaV.size(); i++){
                                    auxi = (DtAuxiliarValorar) listaV.get(i);
                                    if(auxi != null){
                                        if(auxi.getVal().equals("Me gusta") && auxi.getVid().equals(nomVideo)){%>
                                            <a class="dropdown-item" href="#"><%=auxi.getUser()%></a>
                                        <%if(!entrarMg){
                                            entrarMg = true;
                                            }
                                        }
                                    }
                                }
                                if(!entrarMg){%>
                                    <a class="dropdown-item" href="#">No se valoró el vídeo aún</a>
                                <%}%>
                                    </div>
                                </div>
                            <div class="dropdown" style="margin-top: 5px; margin-bottom: 20px">
                                <button class="btn btn-success dropdown-toggle" type="button" id="dropdownNoGusta" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Dislikes
                                </button>
                             <div class="dropdown-menu" aria-labelledby="dropdownNoGusta">
                                <% boolean entrarNmg = false;
                                for(int i=0; i<listaV.size(); i++){
                                    auxi = (DtAuxiliarValorar) listaV.get(i);
                                    if(auxi != null){
                                        if(auxi.getVal().equals("No me gusta") && auxi.getVid().equals(nomVideo)){%>
                                            <a class="dropdown-item" href="#"><%=auxi.getUser()%></a>
                                        <%  if(!entrarNmg){
                                              entrarNmg = true;
                                            }
                                        }
                                     }
                                }
                                if(!entrarNmg){%>
                                    <a class="dropdown-item" href="#">No se valoró el vídeo aún</a>
                                <%}%>
                             </div>
                            </div>
                            <%}
                        }
                            assert video != null;
                        %>
                        <div class="form-group">
                            <label for="descripcion" class="cols-sm-2 control-label"><strong>Descripción:</strong></label>
                            <div class="cols-sm-10">
                                <div class="input-group" >
                                    <span class="input-group-addon"><i class="fa fa" aria-hidden="true"></i></span>
                                    <textarea class="form-control" rows="4" name="descripcion" id="descripcion" placeholder="<%=video.getDescripcion()%>" disabled></textarea>
                                </div>
                            </div>
                        </div>
                        <%if (logeado != null) {%>
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
                            <button type="submit"  id="comenta" name="comenta" class="btn btn-success btn-lg btn-block login-button">Comentar</button>
                        </div>
                    </form>
                    <%}
                    else {%>
                        <div class="form-group">
                            <label for="comentario" class="cols-sm-2 control-label"><strong>Comentario:</strong></label>
                            <div class="cols-sm-10">
                                <div class="input-group" >
                                    <span class="input-group-addon"><i class="fa fa" aria-hidden="true"></i></span>
                                    <textarea class="form-control" rows="2" name="comentario" id="" placeholder="Para poder realizar comentarios o valoraciones de un video, debes iniciar sesion." disabled></textarea>
                                </div>
                            </div>
                        </div>
                        <div class="form-group" id="error" >
                            <a href="login.jsp" class="btn btn-success btn-lg btn-block login-button" >Login</a>
                        </div>
                    </form>
                    <%}%>
                    <div >
                        <h1>Comentarios</h1>
                        <%List lista = c.listaComentarios(video);
                        for(int x=0 ; x<lista.size(); x++){
                            uytube.web.wsclients.DtAuxiliar com = (uytube.web.wsclients.DtAuxiliar) lista.get(x);
                            if(com != null){ %>

                                <!-- Contenedor Principal -->
                                <div class="comments-container">
                                    <ul id="comments-list" class="comments-list">
                                        <li>
                                            <%if (com.getPadre() == null) {%>
                                            <div class="comment-main-level">
                                            <!-- Avatar -->
                                            <%
                                                uytube.web.wsclients.DtUsuario usuarioComenta = u.buscarUsuario(com.getNick());
                                            String ruta = "http://uytube.com:8080/assets" + usuarioComenta.getImagen();%>
                                            <div class="comment-avatar"><img src="<%=ruta%>" alt=""></div>
                                            <!-- Contenedor del Comentario -->
                                            <div class="comment-box">
                                                <form class="form-horizontal needs-validation" method="post" action="ResponderComentarioServlet" id="fromRespuesta">
                                                    <div class="comment-head">
                                                        <%uytube.web.wsclients.DtUsuario us = u.buscarUsuario(com.getNick());
                                                            Date date = com.getFecha().toGregorianCalendar().getTime();
                                                            DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
                                                            String fecha  = formatter.format(date);%>
                                                        <h6 class="comment-name"><a href="verCanales.jsp?nomCanal=<%=us.getCanal().getNombreCanal()%>"><%=com.getNick()%></a></h6>
                                                        <span><%=fecha+"hs"%></span>
                                                    </div>
                                                    <div class="comment-content">
                                                        <%=com.getComentario()%>
                                                    </div>
                                                    <%if (logeado != null) {%>
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
                                                        <button type="submit"  id="resp" name="resp" class="btn btn-success btn-lg" >Responder</button>
                                                    </div>
                                                    <%}
                                                    else {%>
                                                    <div class="form-group">
                                                        <div class="cols-sm-10">
                                                            <div class="input-group" >
                                                                <span class="input-group-addon"><i class="fa fa" aria-hidden="true"></i></span>
                                                                <textarea class="form-control" rows="2" name="respuesta1" placeholder="Agrega una respuesta" disabled></textarea>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <%}%>
                                                </form>
                                            </div>
                                        </div>
                                        <%
                                        List lista2 = c.listaComentarios(video);
                                        for(int y=0; y<lista2.size(); y++){
                                            uytube.web.wsclients.DtAuxiliar resp =(uytube.web.wsclients.DtAuxiliar) lista2.get(y);
                                            if(resp != null){
                                                if(com.getReferencia().toString().equals(resp.getPadre())){%>
                                                <!-- Respuestas de los comentarios -->
                                                <ul class="comments-list reply-list">
                                                    <li>
                                                    <!-- Avatar -->
                                                    <%
                                                        uytube.web.wsclients.DtUsuario usuarioResp = u.buscarUsuario(resp.getNick());
                                                        uytube.web.wsclients.DtUsuario usRefe = u.buscarUsuario(com.getNick());
                                                        String ruta2 = "http://uytube.com:8080/assets" + usuarioResp.getImagen();%>
                                                    <div class="comment-avatar"><img src="<%=ruta2%>" alt=""></div>
                                                    <!-- Contenedor del Comentario -->
                                                    <div class="comment-box">
                                                        <form class="form-horizontal needs-validation" method="post" action="ResponderRespuestaServlet" id="fromRespuesta2">
                                                            <div class="comment-head">
                                                                <%uytube.web.wsclients.DtUsuario usR = u.buscarUsuario(com.getNick());
                                                                    date = resp.getFecha().toGregorianCalendar().getTime();
                                                                    fecha  = formatter.format(date);%>
                                                                <h6 class="comment-name"><a href="verCanales.jsp?nomCanal=<%=usR.getCanal().getNombreCanal()%>"><%=resp.getNick()%></a></h6>
                                                                <span><%=fecha+"hs"%></span>
                                                                <button type="submit" id="ref" name="ref" style="border: transparent" ></button>
                                                            </div>
                                                            <div class="comment-content">
                                                                <%="@"+usRefe.getNickname() +": "+resp.getComentario()%>
                                                            </div>
                                                            <%if (logeado != null) {%>
                                                            <div class="form-group">
                                                                <div class="cols-sm-10">
                                                                    <div class="input-group" >
                                                                        <span class="input-group-addon"><i class="fa fa" aria-hidden="true"></i></span>
                                                                        <textarea class="form-control" rows="2" name="respuesta1" id="respuesta1" placeholder="Agrega una respuesta"></textarea>
                                                                        <input type="hidden"  name="referencia1" value="<%=resp.getReferencia()%>" >
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="form-group" id="error2" >
                                                                <button type="submit" id="resp1" name="resp" class="btn btn-success btn-lg" >Responder</button>
                                                            </div>
                                                            <%}
                                                            else{ %>
                                                            <div class="form-group">
                                                                <div class="cols-sm-10">
                                                                    <div class="input-group" >
                                                                        <span class="input-group-addon"><i class="fa fa" aria-hidden="true"></i></span>
                                                                        <textarea class="form-control" rows="2" name="respuesta1" placeholder="Agrega una respuesta" disabled></textarea>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <%}%>
                                                        </form>
                                                    </div>
                                                </li>
                                            </ul>
                                        </li>
                                        <%List lista3 = c.listaComentarios(video);
                                            for(int z=0; z<lista3.size(); z++){
                                                uytube.web.wsclients.DtAuxiliar resp1 =(uytube.web.wsclients.DtAuxiliar) lista2.get(z);
                                                if(resp1 != null){
                                                    if(resp.getReferencia().toString().equals(resp1.getPadre())){%>
                                        <!-- Respuestas de los comentarios -->
                                        <ul class="comments-list reply-list">
                                            <li>
                                                <!-- Avatar -->
                                                <%
                                                    uytube.web.wsclients.DtUsuario usuarioResp1 = u.buscarUsuario(resp1.getNick());
                                                    String ruta3 = "http://uytube.com:8080/assets" + usuarioResp1.getImagen();%>
                                                <div class="comment-avatar"><img src="<%=ruta3%>" alt=""></div>
                                                <!-- Contenedor del Comentario -->
                                                <div class="comment-box">
                                                    <form class="form-horizontal needs-validation" method="post" action="ResponderRespuestaServlet" id="fromRespuesta1">
                                                        <div class="comment-head">
                                                            <%uytube.web.wsclients.DtUsuario usR1 = u.buscarUsuario(resp1.getNick());
                                                                uytube.web.wsclients.DtUsuario usRef = u.buscarUsuario(resp.getNick());
                                                                date = resp.getFecha().toGregorianCalendar().getTime();
                                                                fecha  = formatter.format(date);%>
                                                            <h6 class="comment-name"><a href="verCanales.jsp?nomCanal=<%=usR.getCanal().getNombreCanal()%>"><%=resp1.getNick()%></a></h6>
                                                            <span><%=fecha+"hs"%></span>
                                                            <button type="submit" id="ref" name="ref" style="border: transparent" ></button>
                                                        </div>
                                                        <div class="comment-content">
                                                            <%="@"+usRef.getNickname() +": "+resp1.getComentario()%>
                                                        </div>
                                                        <%if (logeado != null) {%>
                                                        <div class="form-group">
                                                            <div class="cols-sm-10">
                                                                <div class="input-group" >
                                                                    <span class="input-group-addon"><i class="fa fa" aria-hidden="true"></i></span>
                                                                    <textarea class="form-control" rows="2" name="respuesta1" id="respuesta2" placeholder="Agrega una respuesta"></textarea>
                                                                    <input type="hidden"  name="referencia1" value="<%=resp1.getReferencia()%>" >
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="form-group" id="error2" >
                                                            <button type="submit" id="resp2" name="resp" class="btn btn-success btn-lg" >Responder</button>
                                                        </div>
                                                        <%}
                                                        else{ %>
                                                        <div class="form-group">
                                                            <div class="cols-sm-10">
                                                                <div class="input-group" >
                                                                    <span class="input-group-addon"><i class="fa fa" aria-hidden="true"></i></span>
                                                                    <textarea class="form-control" rows="2" name="respuesta1" placeholder="Agrega una respuesta" disabled></textarea>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <%}%>
                                                    </form>
                                                </div>
                                            </li>
                                        </ul>
                                        </li>
                                        <%}
                                        }
                                        }
                                                }
                                        }
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
    <script src="assets/js/verMas.js" type="text/javascript"></script>
</body>
</html>




