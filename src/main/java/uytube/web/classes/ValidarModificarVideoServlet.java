/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uytube.web.classes;

import DataTypes.DtUsuario;
import fabrica.Fabrica;
import interfaces.IControladorCanal;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**
 *
 * @author tesla
 */
@WebServlet(name = "ValidarModificarVideoServlet", urlPatterns = {"/ValidarModificarVideoServlet"}, asyncSupported = true)
public class ValidarModificarVideoServlet extends HttpServlet {

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

        Fabrica f = Fabrica.getInstance();
        HttpSession s = request.getSession();

        String nomO = (String) s.getAttribute("video");
        String nomVN = request.getParameter("nombre");
        DtUsuario u = (DtUsuario) s.getAttribute("usuario");

        System.out.println(nomO);
        System.out.println(nomVN);
        IControladorCanal c = f.getControladorCanal();
        String respuesta = "{\"existe\":false}";
        if(!nomVN.equals(nomO)) {
            System.out.println("Entra");
            if (c.obtenerVideo(nomVN, u.getCanal().getNombre_canal()) != null) {
                respuesta = "{\"existe\":true}";
            } else {
                respuesta = "{\"existe\":false}";
            }
        }

        s.removeAttribute("video");
        System.out.println(respuesta);
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
