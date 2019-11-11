<%@ page import="uytube.web.wsclients.ControladorUsuarioService" %>
<%@ page import="uytube.web.wsclients.IControladorUsuario" %>
<%@ page import="java.io.*" %><%--
  Created by IntelliJ IDEA.
  User: tesla
  Date: 11/11/19
  Time: 16:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Prueba de imagenes</title>
</head>
<body>
    <%
        ControladorUsuarioService c = new ControladorUsuarioService();
        IControladorUsuario controladorUsuario = c.getControladorUsuarioPort();

        String fileName = "teslita.png";
        String filePath = "/home/tesla/tomcat/webapps/assets/imagenesUsuarios/" + fileName;
        File file = new File(filePath);

        // PARA SUBIR UNA IMAGEN DESDE LA CARPETA DE TOMCAT
        try {
            FileInputStream fis = new FileInputStream(file);
            BufferedInputStream inputStream = new BufferedInputStream(fis);
            byte[] imageBytes = new byte[(int) file.length()];
            inputStream.read(imageBytes);

            controladorUsuario.uploadImage(file.getName(), imageBytes);

            inputStream.close();
            System.out.println("File uploaded: " + filePath);
        } catch (IOException ex) {
            System.err.println(ex);
        }

        // PARA DESCARGAR LA IMAGEN A LA CARPETA PUBLICADA POR TOMCAT
        fileName = "imagen.png";
        filePath = "/home/tesla/tomcat/webapps/assets/imagenesUsuarios/" + fileName;
        byte[] fileBytes = controladorUsuario.downloadImage(fileName);

        try {
            FileOutputStream fos = new FileOutputStream(filePath);
            BufferedOutputStream outputStream = new BufferedOutputStream(fos);
            outputStream.write(fileBytes);
            outputStream.close();

            System.out.println("File downloaded: " + filePath);
        } catch (IOException ex) {
            System.err.println(ex);
        }
    %>

    <h1>PRUEBA</h1>
    <img src="/assets/imagenesUsuarios/imagen.png" alt="">
</body>
</html>
