/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uytube.web.classes;

import uytube.web.wsclients.*;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author isaac
 */
@MultipartConfig
@WebServlet(name = "CambiarMegustaServlet", urlPatterns = {"/CambiarMegustaServlet"})
public class CambiarMegustaServlet extends HttpServlet {

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
        DtUsuario userLog = (DtUsuario) s.getAttribute("usuario");
        String nomVid = (String) s.getAttribute("nomVideo"); // obtengo nombre video por medio de la sesio
        String canal = (String) s.getAttribute("canal"); // obtengo nombre canal por medio de la sesio


        ControladorUsuarioService u = new ControladorUsuarioService();
        IControladorUsuario controladorUser = u.getControladorUsuarioPort();

        ControladorCanalService c = new ControladorCanalService();
        IControladorCanal controladorCanal = c.getControladorCanalPort();

        DtVideo v = controladorCanal.obtenerVideo(nomVid,canal);
        DtUsuario usuarioDuenio = controladorUser.buscarUsuarioCanal(canal);

        if(v != null && usuarioDuenio != null){
            controladorUser.valorarVideoEliminar(usuarioDuenio.getNickname(),nomVid,userLog.getNickname(),"Me gusta");
        }
        response.sendRedirect("index.jsp");
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