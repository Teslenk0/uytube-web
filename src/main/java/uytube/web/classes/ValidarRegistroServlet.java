/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uytube.web.classes;

import DataTypes.DtUsuario;
import fabrica.Fabrica;
import interfaces.IControladorCanal;
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
 * @author isaac
 */
@WebServlet(name = "ValidarRegistroServlet", urlPatterns = {"/ValidarRegistroServlet"}, asyncSupported = true)
public class ValidarRegistroServlet extends HttpServlet {

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
        String email = (String) json.get("email");
        String canal = (String) json.get("canal");

        Fabrica f = Fabrica.getInstance();
        IControladorUsuario u = f.getControladorUsuario();
        IControladorCanal c = f.getControladorCanal();
        String rnickname, remail, rcanal, respuesta;

        DtUsuario user = u.buscarUsuario(nickname);
        if(user!=null)
            rnickname = "\"nickname\":true";
        else
            rnickname = "\"nickname\":false";

        boolean esta = u.buscarEmail(email);
        if (esta)
            remail = "\"email\":true";
        else
            remail = "\"email\":false";

        if(canal.isEmpty()){
            if(c.buscarCanal(nickname))
                rcanal = "\"canal\":true";
            else
                rcanal = "\"canal\":false";
        }
        else{
            if(c.buscarCanal(canal))
                rcanal = "\"canal\":true";
            else
                rcanal = "\"canal\":false";
        }

        respuesta = "{"+rnickname+","+remail+","+rcanal+"}";
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
