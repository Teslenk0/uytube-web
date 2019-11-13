/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uytube.web.classes;

import uytube.web.wsclients.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@MultipartConfig
@WebServlet(name = "EliminarVideoPlaylistDefectoServlet", urlPatterns = {"/EliminarVideoPlaylistDefectoServlet"})
public class EliminarVideoPlaylistDefectoServlet extends HttpServlet {

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
            throws IOException, ServletException {
        response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");
        HttpSession s = request.getSession();
        PrintWriter out = response.getWriter();

        DtUsuario user = (DtUsuario) s.getAttribute("usuario");

        String nomUser = user.getNickname();
        String nomLista = request.getParameter("nomPlaylist");
        String nomVideo = request.getParameter("nomVideo");
        String nomCanal = request.getParameter("nomCanal");

        ControladorUsuarioService u = new ControladorUsuarioService();
        IControladorUsuario controladorUser = u.getControladorUsuarioPort();

        ControladorCanalService c = new ControladorCanalService();
        IControladorCanal controladorCanal = c.getControladorCanalPort();

        DtUsuario destino = controladorUser.buscarUsuarioCanal(nomCanal);
        String userDestino = destino.getCanal().getNombreCanal();

        try{
            controladorCanal.sacarVideoLista(nomUser,nomLista,nomVideo,userDestino,false);
        }catch (Exception e){
            System.out.println(e.getMessage());
        }

        out.println("<script src='assets/js/sweetalert2.all.min.js' type='text/javascript'></script>");
        out.println("<script type='text/javascript' src='assets/js/jquery-3.4.1.min.js'></script>");
        out.println("<script>");
        out.println("$(document).ready(function(){");
        out.println("Swal.fire('Excelente!','Vídeo eliminado con éxito','success')");
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
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
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