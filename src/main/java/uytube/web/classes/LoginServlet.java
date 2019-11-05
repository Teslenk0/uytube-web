/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uytube.web.classes;

import uytube.web.wsclients.*;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

/**
 *
 * @author tesla
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

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

        String nickname = request.getParameter("inputUser").trim();

        ControladorUsuarioService controllerUser = new ControladorUsuarioService();
        IControladorUsuario iControllerUser = controllerUser.getControladorUsuarioPort();
        DtUsuario user = iControllerUser.buscarUsuario(nickname);

        HttpSession session = request.getSession();
        session.setAttribute("usuario", user);
        DtCanal c = user.getCanal();

        //setting session to expiry in 30 mins
        session.setMaxInactiveInterval(30 * 60);

        Cookie userName = new Cookie("usuario", user.getNickname());
        userName.setMaxAge(30 * 60);
        response.addCookie(userName);

        ControladorCanalService controllerCanal = new ControladorCanalService();
        IControladorCanal iControllerCanal = controllerCanal.getControladorCanalPort();
        DtCanal canal = user.getCanal();

        List videos = iControllerCanal.listaVideos(canal);
        //System.out.println(videos);

        session.setAttribute("videos", videos);
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
        processRequest(request, response);
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
