<%@ page import="uytube.web.wsclients.ControladorUsuarioService" %>
<%@ page import="uytube.web.wsclients.IControladorUsuario" %>
<%@ page import="uytube.web.wsclients.DtUsuario" %><%--
  Created by IntelliJ IDEA.
  User: tesla
  Date: 4/11/19
  Time: 23:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <%
        ControladorUsuarioService c = new ControladorUsuarioService();
        IControladorUsuario i = c.getControladorUsuarioPort();
        DtUsuario user = i.buscarUsuario("cachilas");
    %>

    <h4><%=user.getNickname()%></h4>
    <h4><%=user.getNombre()%></h4>
    <h4><%=user.getEmail()%></h4>
</body>
</html>
