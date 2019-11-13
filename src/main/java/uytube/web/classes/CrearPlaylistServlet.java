/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uytube.web.classes;

import uytube.web.wsclients.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**
 *
 * @author isaac
 */
@MultipartConfig
@WebServlet(name = "CrearPlaylistServlet", urlPatterns = {"/CrearPlaylistServlet"})
public class CrearPlaylistServlet extends HttpServlet {

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
        PrintWriter out = response.getWriter();

        HttpSession s = request.getSession();
        DtUsuario user = (DtUsuario) s.getAttribute("usuario");

        String nombrePlaylist = request.getParameter("nombrePlaylist");
        Boolean estadoPlaylist = request.getParameter("group1").equals("privado");
        String categoria = request.getParameter("categorias");

        DtCanal canal = user.getCanal();

        DtCategoria cat = new DtCategoria();
        cat.setNombreCategoria(categoria);

        DtListaParticulares lista = new DtListaParticulares();
        lista.setPrivado(estadoPlaylist);
        lista.setNombreLista(nombrePlaylist);
        lista.setCategoria(cat);
        lista.setCanal(canal);


        ControladorCanalService c = new ControladorCanalService();
        IControladorCanal controladorCanal = c.getControladorCanalPort();

        controladorCanal.crearListaParticular(lista, user);

        out.println("<script src='assets/js/sweetalert2.all.min.js' type='text/javascript'></script>");
        out.println("<script type='text/javascript' src='assets/js/jquery-3.4.1.min.js'></script>");
        out.println("<script>");
        out.println("$(document).ready(function(){");
        out.println("Swal.fire('Excelente!','La playlist: "+ nombrePlaylist +" ha sido creada','success')");
        out.println("});");
        out.println("</script>");
        RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
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