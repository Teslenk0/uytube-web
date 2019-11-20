/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uytube.web.classes;
import org.json.JSONObject;
import uytube.web.wsclients.ControladorCanalService;
import uytube.web.wsclients.DtUsuario;
import uytube.web.wsclients.DtVideo;
import uytube.web.wsclients.IControladorCanal;

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
        request.setCharacterEncoding("utf-8");

        ControladorCanalService controller = new ControladorCanalService();
        HttpSession s = request.getSession();

        String nomO = (String) s.getAttribute("oldV");
        DtUsuario u = (DtUsuario) s.getAttribute("usuario");

        String strJson = request.getParameter("datos");
        JSONObject json = new JSONObject(strJson);
        String nomVN = (String) json.get("nomV");
        String fechaPu = (String) json.get("fechaPu");
        String url = (String) json.get("url");
        String desc = (String) json.get("desc");
        String categoria = (String) json.get("categoria");
        String privado = (String) json.get("privado");

        Boolean isPrivate = false;
        if(privado.equals("privado"))
            isPrivate = true;

        IControladorCanal c = controller.getControladorCanalPort();
        String existe = "\"existe\":false";
        if(!nomVN.equals(nomO)) {
            if (c.obtenerVideo(nomVN, u.getCanal().getNombreCanal()) != null) {
                existe = "\"existe\":true";
            }
        }

        DtVideo vi = c.obtenerVideo(nomO, u.getCanal().getNombreCanal());
        Date date = vi.getFechaPublicacion().toGregorianCalendar().getTime();
        DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        String fechaU  = formatter.format(date);

        String cambios = "\"cambios\":false";
        if(vi.getNombre().equals(nomVN) && fechaPu.equals(fechaU) && vi.getUrl().equals(url) && vi.getDescripcion().equals(desc) && vi.getCategoria().equals(categoria) && isPrivate.equals(vi.isPrivado()))
            cambios = "\"cambios\":true";

        String respuesta = "{"+cambios+","+existe+"}";
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
