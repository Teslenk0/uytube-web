/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uytube.web.classes;

import uytube.web.wsclients.ControladorCanalService;
import uytube.web.wsclients.IControladorCanal;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 *
 * @author caste
 */
@WebServlet(name = "ValidarPlaylistServlet", urlPatterns = {"/ValidarPlaylistServlet"}, asyncSupported = true)
public class ValidarPlaylistServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        PrintWriter out = response.getWriter();
        response.setContentType("application/json");
        response.setCharacterEncoding("utf-8");

        String nomPlaylist = request.getParameter("nombre");

        ControladorCanalService c = new ControladorCanalService();
        HttpSession s = request.getSession();
        uytube.web.wsclients.DtUsuario u = (uytube.web.wsclients.DtUsuario) s.getAttribute("usuario");

        IControladorCanal icanal = c.getControladorCanalPort();
        List listas = icanal.getListasReproduccion(u.getNickname());
        String respuesta = "{\"existe\":false}";
        for (int i=0;i<listas.size();i++) {
            uytube.web.wsclients.DtListaParticulares lista = (uytube.web.wsclients.DtListaParticulares) listas.get(i);
            if (lista!=null) {
                if(lista.getNombreLista().equals(nomPlaylist)){
                    respuesta = "{\"existe\":true}";
                }
            }
        }
        out.print(respuesta);
        out.flush();
        out.close();
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
        processRequest(request, response);
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
        processRequest(request, response);
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
