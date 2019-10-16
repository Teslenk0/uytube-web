/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uytube.web.classes;

import DataTypes.DtCanal;
import DataTypes.DtUsuario;
import DataTypes.DtVideo;
import fabrica.Fabrica;
import interfaces.IControladorCanal;
import interfaces.IControladorUsuario;
import javassist.Loader;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.GregorianCalendar;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

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
            throws ServletException, IOException, ParseException {
        HttpSession s = request.getSession();

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
        if(!file.exists())
            file.mkdirs();

        part.write(path + nick + ".png");
        img = "/imagenesUsuarios/"+ nick +".png";

        DtCanal canal = new DtCanal(nomCanal,descripcion,estadoCanal);

        DtUsuario userMod = new DtUsuario(nick,pass,nombre,apellido,email,fecha,img,user.getCanal());
        DtUsuario userModificado = new DtUsuario(nick,pass,nombre,apellido,email,fecha,img,canal);

        s.setAttribute("usuario", userModificado);

        Fabrica fabrica = Fabrica.getInstance();
        IControladorUsuario controladorUsuario = fabrica.getControladorUsuario();
        try{
            controladorUsuario.modificarUsuario(userMod,canal,null,false);
        }catch (Exception e){
            System.out.println(e.getMessage());
        }
        response.sendRedirect("index.jsp");

    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
        } catch (ParseException e) {
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