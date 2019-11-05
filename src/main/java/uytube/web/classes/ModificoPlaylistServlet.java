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

@MultipartConfig
@WebServlet(name = "ModificoPlaylistServlet", urlPatterns = {"/ModificoPlaylistServlet"})
public class ModificoPlaylistServlet extends HttpServlet {

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
            throws IOException {
        response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");
        HttpSession s = request.getSession();

        DtUsuario user = (DtUsuario) s.getAttribute("usuario");
        Boolean estadoPlaylist = request.getParameter("group1").equals("privado");

        DtListaParticulares lista = (DtListaParticulares) s.getAttribute("lista");

        DtListaParticulares listaMod = new DtListaParticulares();
        listaMod.setPrivado(estadoPlaylist);
        listaMod.setCategoria(lista.getCategoria());
        listaMod.setNombreLista(lista.getNombreLista());

        ControladorCanalService c = new ControladorCanalService();
        IControladorCanal controladorCanal = c.getControladorCanalPort();

        try{
            controladorCanal.modificarListaParticular(listaMod,user);
        }catch (Exception e){
            System.out.println(e.getMessage());
        }
        s.removeAttribute("lista");
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
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
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