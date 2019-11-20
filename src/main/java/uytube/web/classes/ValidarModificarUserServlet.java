/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uytube.web.classes;

import org.json.JSONObject;
import uytube.web.wsclients.*;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author isaac
 */
@WebServlet(name = "ValidarModificarUserServlet", urlPatterns = {"/ValidarModificarUserServlet"}, asyncSupported = true)
public class ValidarModificarUserServlet extends HttpServlet {

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
        HttpSession s = request.getSession();

        String strJson = request.getParameter("datos");
        JSONObject json = new JSONObject(strJson);
        String nick = (String) json.get("nickname");
        String nombre = (String) json.get("nombre");
        String apellido = (String) json.get("apellido");
        String email = (String) json.get("email");
        String pass = (String) json.get("password");
        String canal = (String) json.get("nomCanal");
        String fechaNac = (String) json.get("fechaNac");
        String descripcion = (String) json.get("descripcion");
        String privado = (String) json.get("privado");

        String nomO = (String) s.getAttribute("oldN");

        Boolean isPrivate = false;
        if(privado.equals("privado"))
            isPrivate = true;

        ControladorCanalService i = new ControladorCanalService();
        IControladorCanal c = i.getControladorCanalPort();
        ControladorUsuarioService ii = new ControladorUsuarioService();
        IControladorUsuario u = ii.getControladorUsuarioPort();
        DtUsuario user = u.buscarUsuario(nick);

        Date date = user.getFechaNac().toGregorianCalendar().getTime();
        DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String fechaU  = formatter.format(date);

        String rcanal = "\"canal\":false";
        if(!nomO.equals(canal)) {
            if (c.buscarCanal(canal))
                rcanal = "\"canal\":true";
        }

        String cambios = "\"cambios\":false";
        if(nick.equals(user.getNickname()) && nombre.equals(user.getNombre()) && apellido.equals(user.getApellido()) && email.equals(user.getEmail()) && canal.equals(user.getCanal().getNombreCanal()) && pass.equals(user.getContrasenia()) && descripcion.equals(user.getCanal().getDescripcion()) && fechaNac.equals(fechaU) && isPrivate.equals(user.getCanal().isPrivado()))
            cambios = "\"cambios\":true";

        String respuesta = "{"+cambios+","+rcanal+"}";
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
