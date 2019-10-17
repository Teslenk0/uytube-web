/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uytube.web.classes;

import fabrica.Fabrica;
import interfaces.IControladorCanal;

import java.io.IOException;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author tesla
 */
@WebServlet(name = "BuscarServlet", urlPatterns = {"/BuscarServlet"})
public class BuscarServlet extends HttpServlet {

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
            throws ServletException, IOException {
        response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");

        response.setContentType("text/html;charset=UTF-8");
        String texto = request.getParameter("buscador");

        Fabrica fabrica = Fabrica.getInstance();
        IControladorCanal controladorCanal = fabrica.getControladorCanal();

        //VER SI SACAR LOS RESULTADOS EN EL MISMO ARBOL O EN DIFERENTES
        List canales = controladorCanal.busquedaArborescenteCanales(texto);
        List listas = controladorCanal.busquedaArborescenteListasParticulares(texto);
        List videos = controladorCanal.busquedaArborescenteVideos(texto);

        request.setAttribute("canales",canales);
        request.setAttribute("videos",videos);
        request.setAttribute("listas",listas);

        /*System.out.println(canales);
        System.out.println(videos);
        System.out.println(listas);*/
        request.getRequestDispatcher("resultado.jsp").forward(request, response);
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
