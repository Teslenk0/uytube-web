/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uytube.web.classes;

import DataTypes.DtCanal;
import DataTypes.DtComentario;
import DataTypes.DtUsuario;
import DataTypes.DtVideo;
import fabrica.Fabrica;
import interfaces.IControladorCanal;
import interfaces.IControladorUsuario;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 *
 * @author isaac
 */
@MultipartConfig
@WebServlet(name = "NuevoComentarioServlet", urlPatterns = {"/NuevoComentarioServlet"})
public class NuevoComentarioServlet extends HttpServlet {

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
        DtUsuario user = (DtUsuario) s.getAttribute("usuario");
        String comentario = request.getParameter("comentario");
        java.util.Date fecha = new Date();

        String nomVid = (String) s.getAttribute("nomVideo"); // obtengo nombre video por medio de la sesion de verVideo.jsp

        Fabrica fabrica = Fabrica.getInstance();
        IControladorCanal controladorCanal = fabrica.getControladorCanal();

        DtCanal canal = user.getCanal();
        DtVideo v = controladorCanal.obtenerVideo(nomVid, canal.getNombre_canal());
        List lista = controladorCanal.listaComentariosTodos();
        Integer ref = lista.size() + 1;

        System.out.println(user.getNickname());
        System.out.println(comentario);
        System.out.println(fecha);
        System.out.println(ref);
        System.out.println(canal.getNombre_canal());
        if(!comentario.isEmpty()){
            DtComentario c = new DtComentario(user.getNickname(), comentario, fecha, v, null, ref, canal.getNombre_canal());
            controladorCanal.agregarComentario(c);
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