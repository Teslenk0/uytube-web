<%@ page import="java.util.List" %>
<%@ page import="DataTypes.DtVideo" %><%--
  Created by IntelliJ IDEA.
  User: tesla
  Date: 15/10/19
  Time: 00:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Resultados de Busqueda</title>
</head>
<body>

<div class="barra_superior" style="background-color:black">
    <div class="d-inline">
        <a class="navbar-brand" href="index.jsp" style="margin-left: 45%"> <img src="assets/images/logo2.png"
                                                                                width="112" height="auto"></a>
    </div>
</div>
    <%
        List videos = (List) request.getAttribute("videos");
        System.out.println(videos);
        if(videos != null){
            DtVideo v;
            for (int i=0; i<videos.size();i++){
                v = (DtVideo) videos.get(i);
                %>
                    <h5><%=v.getNombre()%></h5>
                <%
            }
        }
    %>
</body>
</html>
