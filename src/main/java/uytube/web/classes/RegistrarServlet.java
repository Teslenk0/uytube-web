/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uytube.web.classes;

import DataTypes.DtCanal;
import DataTypes.DtUsuario;
import fabrica.Fabrica;
import interfaces.IControladorUsuario;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;

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
        HttpSession s = request.getSession();
        String nick = request.getParameter("nickname").trim();
        String pass = request.getParameter("password").trim();
        String nombre = request.getParameter("nombre").trim();
        String apellido = request.getParameter("apellido").trim();
        String email = request.getParameter("email").trim();
        String fechaNac = request.getParameter("fechaNac");
        String nomCanal = request.getParameter("nomCanal").trim();
        String desc = request.getParameter("descripcion").trim();
        Boolean privado = "on".equals(request.getParameter("privado"));
        Part part = request.getPart("image");

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date fecha = sdf.parse(fechaNac);

        String img;
        String filename = part.getSubmittedFileName();
        String path = getServletContext().getRealPath("/") + "assets/imagenesUsuarios/";

        if(!filename.isEmpty()){
            part.write(path + nick + ".png");
            img = "/imagenesUsuarios/"+ nick +".png";
        }
        else
            img = "/imagenesUsuarios/Defecto.png";

        DtCanal c;
        if(nomCanal.isEmpty())
            c = new DtCanal(nick,desc,privado);
        else
            c = new DtCanal(nomCanal,desc,privado);

        DtUsuario u = new DtUsuario(nick,pass,nombre,apellido,email,fecha,img,c);

        Fabrica fabrica = Fabrica.getInstance();
        IControladorUsuario cu = fabrica.getControladorUsuario();
        cu.registrarUsuario(u,null);

        response.sendRedirect("login.jsp");
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