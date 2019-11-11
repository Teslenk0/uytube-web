/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uytube.web.classes;


import uytube.web.wsclients.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.xml.datatype.DatatypeConfigurationException;
import javax.xml.datatype.DatatypeFactory;
import javax.xml.datatype.XMLGregorianCalendar;
import java.io.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.GregorianCalendar;

@MultipartConfig
@WebServlet(name = "ModificoUserServlet", urlPatterns = {"/ModificoUserServlet"})
public class ModificoUserServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException, DatatypeConfigurationException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        HttpSession s = request.getSession();
        PrintWriter out = response.getWriter();

        DtUsuario user = (DtUsuario) s.getAttribute("usuario");
        String nick = user.getNickname();
        String email = user.getEmail();

        String nombre = request.getParameter("nombre").trim();
        String apellido = request.getParameter("apellido").trim();
        String fechaNac = request.getParameter("fechaNac").trim();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date fecha = sdf.parse(fechaNac);
        String pass = request.getParameter("password").trim();
        String nomCanal = request.getParameter("nomCanal").trim();
        String descripcion = request.getParameter("descripcion").trim();
        Boolean estadoCanal = request.getParameter("group1").equals("privado");
        Part part = request.getPart("image");
        String img;
        String filename = part.getSubmittedFileName();
        String path = System.getProperty("user.dir");
        path = path.substring(0,path.length()-3) + "webapps/assets/imagenesUsuarios/";
        File file = new File(path);
        if(!file.exists()){
            if(file.mkdirs())
                System.out.println("Directorios creados");
        }



        if(filename.isEmpty() && user.getImagen().equals("/imagenesUsuarios/Defecto.png")){
            img = "/imagenesUsuarios/Defecto.png";
        }
        else{
            file = new File(path + nick + ".png");
            if(file.delete())
                System.out.println("Imagen borrada");

            part.write(path + nick + ".png");
            img = "/imagenesUsuarios/"+ nick +".png";
        }

        DtCanal canal = new DtCanal();
        canal.setNombreCanal(nomCanal);
        canal.setDescripcion(descripcion);
        canal.setPrivado(estadoCanal);

        DtUsuario userMod = new DtUsuario();
        userMod.setNickname(nick);
        userMod.setContrasenia(pass);
        userMod.setNombre(nombre);
        userMod.setApellido(apellido);
        userMod.setEmail(email);

        GregorianCalendar calendario = new GregorianCalendar();
        calendario.setTime(fecha);
        XMLGregorianCalendar xmlCalendario = DatatypeFactory.newInstance().newXMLGregorianCalendar(calendario);
        userMod.setFechaNac(xmlCalendario);
        userMod.setImagen(img);
        userMod.setCanal(user.getCanal());

        ControladorUsuarioService f = new ControladorUsuarioService();
        IControladorUsuario controladorUsuario = f.getControladorUsuarioPort();
        try{
            controladorUsuario.modificarUsuario(userMod,canal,null,false);
        }catch (Exception e){
            System.out.println(e.getMessage());
        }
        userMod.setCanal(canal);

        //PARA CUANDO NO SEA POR DEFECTO
        if(!filename.isEmpty()) {
            String fileName = nick + ".png";

            String filePath = path + fileName;
            File imagen = new File(filePath);

            // PARA SUBIR UNA IMAGEN DESDE LA CARPETA DE TOMCAT
            try {
                FileInputStream fis = new FileInputStream(imagen);
                BufferedInputStream inputStream = new BufferedInputStream(fis);
                byte[] imageBytes = new byte[(int) imagen.length()];
                inputStream.read(imageBytes);

                controladorUsuario.uploadImage(imagen.getName(), imageBytes);

                inputStream.close();
                System.out.println("File uploaded: " + filePath);
            } catch (IOException ex) {
                System.err.println(ex);
            }
        }
        s.setAttribute("usuario", userMod);


        out.println("<script src='assets/js/sweetalert2.all.min.js' type='text/javascript'></script>");
        out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js'></script>\n");
        out.println("<script>");
        out.println("$(document).ready(function(){");
        out.println("Swal.fire('Excelente!','Su usuario ha sido modificado con éxito','success')");
        out.println("});");
        out.println("</script>");
        RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
        rd.include(request,response);

    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        try{
            processRequest(request, response);
        }
        catch (Exception e){
            System.out.println("Error");
        }

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParseException | DatatypeConfigurationException e) {
            e.printStackTrace();
        }


    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}