/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uytube.web.classes;

import DataTypes.DtUsuario;
import DataTypes.DtVideo;
import excepciones.VideoRepetidoException;
import fabrica.Fabrica;
import interfaces.IControladorCanal;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author tesla
 */
@WebServlet(name = "ModificarVideoServlet", urlPatterns = {"/ModificarVideoServlet"}, asyncSupported = true)
public class ModificarVideoServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ParseException, VideoRepetidoException {

        HttpSession s = request.getSession();
        DtUsuario user = (DtUsuario) s.getAttribute("usuario");
        String nomV = request.getParameter("nomV");
        String duracion = request.getParameter("duracion").trim();
        String url = request.getParameter("url").trim();
        String descripcion = request.getParameter("desc");
        String fechaPub = request.getParameter("fechaPu");
        Boolean estado = request.getParameter("estado").equals("privado");
        String categoria = request.getParameter("categorias");

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date fecha = sdf.parse(fechaPub);

        Fabrica fabrica = Fabrica.getInstance();
        IControladorCanal c = fabrica.getControladorCanal();
        DtVideo v = new DtVideo(nomV, user.getCanal(), fecha, url, descripcion, categoria,duracion,estado);
        /*System.out.println(fecha);
        System.out.println(url);
        System.out.println(descripcion);
        System.out.println(categoria);
        System.out.println(duracion);
        System.out.println(estado);
        System.out.println(user.getCanal().getNombre_canal());
        System.out.println(nomV);*/
        c.modificarVideo(v,"Recoba 20 mejores goles");
        s.removeAttribute("oldV");
        response.sendRedirect("index.jsp");
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        try {
            processRequest(request, response);
        } catch (ParseException | VideoRepetidoException e) {
            e.printStackTrace();
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        try {
            processRequest(request, response);
        } catch (ParseException | VideoRepetidoException e) {
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
