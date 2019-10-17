/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uytube.web.classes;

import DataTypes.DtCanal;
import DataTypes.DtUsuario;
import DataTypes.DtVideo;
import clases.Usuario;
import fabrica.Fabrica;
import interfaces.IControladorCanal;
import interfaces.IControladorUsuario;

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
@WebServlet(name = "CambiarNomegustaServlet", urlPatterns = {"/CambiarNomegustaServlet"})
public class CambiarNomegustaServlet extends HttpServlet {

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

        Fabrica fabrica = Fabrica.getInstance();
        IControladorUsuario controladorUsuario = fabrica.getControladorUsuario();
        IControladorCanal controladorCanal = fabrica.getControladorCanal();
        DtVideo v = controladorCanal.obtenerVideo(nomVid,canal);
        DtUsuario usuarioDuenio = controladorUsuario.buscarUsuarioCanal(canal);

        if(v != null && usuarioDuenio != null){
            controladorUsuario.valorarVideoEliminar(usuarioDuenio.getNickname(),nomVid,userLog.getNickname(),"No me gusta");
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