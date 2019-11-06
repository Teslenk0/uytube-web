/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uytube.web.classes;


import uytube.web.wsclients.*;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 *
 * @author isaac
 */
@MultipartConfig
@WebServlet(name = "NomeGustaVideoServlet", urlPatterns = {"/NomeGustaVideoServlet"})
public class NomeGustaVideoServlet extends HttpServlet {

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
        response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");

        HttpSession s = request.getSession();
        DtUsuario userLog = (DtUsuario) s.getAttribute("usuario");
        String nomVid = (String) s.getAttribute("nomVideo");
        String canal = (String) s.getAttribute("canal");

        ControladorUsuarioService ff = new ControladorUsuarioService();
        IControladorUsuario controladorUsuario = ff.getControladorUsuarioPort();
        ControladorCanalService f = new ControladorCanalService();
        IControladorCanal controladorCanal = f.getControladorCanalPort();
        DtVideo v = controladorCanal.obtenerVideo(nomVid,canal);
        DtUsuario usuarioDuenio = controladorUsuario.buscarUsuarioCanal(canal);

        if(v != null && usuarioDuenio != null){
            controladorUsuario.valorarVideo(usuarioDuenio.getNickname(),nomVid,userLog.getNickname(),"No me gusta");
        }
        request.getRequestDispatcher("verVideos.jsp?video="+ nomVid+"&canal="+canal).forward(request, response);
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