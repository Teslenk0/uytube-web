<%-- 
    Document   : LoginSuccess
    Created on : 5 oct. 2019, 16:47:49
    Author     : tesla
--%>

<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            //allow access only if session exists
            String user = null;
            if (session.getAttribute("nickname") == null) {
                response.sendRedirect("login.jsp");
            } else {
                user = (String) session.getAttribute("nickname");
            }
            String userName = null;
            String sessionID = null;
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("nickname")) {
                        userName = cookie.getValue();
                    }
                    if (cookie.getName().equals("JSESSIONID")) {
                        sessionID = cookie.getValue();
                    }
                }
            }
        %>
        <h3>Hi <%=userName%>, Login successful. Your Session ID=<%=sessionID%></h3>
        <br>
        User=<%=user%>
        <br>
    </body>
</html>
