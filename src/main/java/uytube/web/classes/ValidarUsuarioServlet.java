/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uytube.web.classes;

import DataTypes.DtUsuario;
import fabrica.Fabrica;
import interfaces.IControladorUsuario;
import org.json.JSONObject;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 *
 * @author tesla
 */
@WebServlet(name = "ValidarUsuarioServlet", urlPatterns = {"/ValidarUsuarioServlet"}, asyncSupported = true)
public class ValidarUsuarioServlet extends HttpServlet {

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
        request.setCharacterEncoding("utf-8");

        String strJson = request.getParameter("datos");
        JSONObject json = new JSONObject(strJson);
        String nickname = (String) json.get("nickname");
        String password = (String) json.get("password");

        Fabrica f = Fabrica.getInstance();
        IControladorUsuario user = f.getControladorUsuario();
        DtUsuario u = user.buscarUsuario(nickname);

        String respuesta;

        if (u != null) {
            if (u.getContrasenia().equals(password)) {
                respuesta = "{\"nickname\":\""+nickname+"\", \"existe\":true, \"passOk\":true}";
            } else {
                respuesta = "{\"nickname\":\"" + nickname + "\", \"existe\":true, \"passOk\":false}";
            }
        } else {
            respuesta = "{\"nickname\":\"" + nickname + "\", \"existe\":false, \"passOk\":false}";
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
