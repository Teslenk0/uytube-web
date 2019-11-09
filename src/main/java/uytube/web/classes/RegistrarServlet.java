/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uytube.web.classes;

import uytube.web.wsclients.ControladorUsuarioService;
import uytube.web.wsclients.DtCanal;
import uytube.web.wsclients.DtUsuario;
import uytube.web.wsclients.IControladorUsuario;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.xml.datatype.DatatypeFactory;
import javax.xml.datatype.XMLGregorianCalendar;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.GregorianCalendar;

/**
 *
 * @author isaac
 */
@MultipartConfig
@WebServlet(name = "RegistrarServlet", urlPatterns = {"/RegistrarServlet"})
public class RegistrarServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();

        String nick = request.getParameter("nickname").trim();
        String pass = request.getParameter("password").trim();
        String nombre = request.getParameter("nombre").trim();
        String apellido = request.getParameter("apellido").trim();
        String email = request.getParameter("email").trim();
        String fechaNac = request.getParameter("fechaNac");
        String nomCanal = request.getParameter("nomCanal").trim();
        String desc = request.getParameter("descripcion").trim();
        Boolean privado = request.getParameter("group1").equals("privado");
        Part part = request.getPart("image");

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date fecha = sdf.parse(fechaNac);

        String img;
        String filename = part.getSubmittedFileName();

        String path = System.getProperty("user.dir");
        path = path.substring(0,path.length()-3) + "webapps/assets/imagenesUsuarios/";
        File file = new File(path);
        if(!file.exists()) {
            if (file.mkdirs())
                System.out.println("Directorios creados");
        }

        if(!filename.isEmpty()){
            part.write(path + nick + ".png");
            img = "/imagenesUsuarios/"+ nick +".png";
        }
        else
            img = "/imagenesUsuarios/Defecto.png";

        DtCanal c = new DtCanal();
        if(nomCanal.isEmpty())
           c.setNombreCanal(nick);
        else
           c.setNombreCanal(nomCanal);
        c.setDescripcion(desc);
        c.setPrivado(privado);

        DtUsuario u = new DtUsuario();
        u.setNickname(nick);
        u.setContrasenia(pass);
        u.setNombre(nombre);
        u.setApellido(apellido);
        u.setEmail(email);

        GregorianCalendar calendario = new GregorianCalendar();
        calendario.setTime(fecha);
        XMLGregorianCalendar xmlCalendario = DatatypeFactory.newInstance().newXMLGregorianCalendar(calendario);
        u.setFechaNac(xmlCalendario);
        u.setImagen(img);
        u.setCanal(c);

        ControladorUsuarioService cc = new ControladorUsuarioService();
        IControladorUsuario cu = cc.getControladorUsuarioPort();
        cu.registrarUsuario(u,null);

        out.println("<script src='assets/js/sweetalert2.all.min.js' type='text/javascript'></script>");
        out.println("<script src='https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js'></script>\n");
        out.println("<script>");
        out.println("$(document).ready(function(){");
        out.println("Swal.fire('Bienvenido!','success')");
        out.println("});");
        out.println("</script>");
        RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
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
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        try {
            processRequest(request, response);
        } catch (Exception e) {
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