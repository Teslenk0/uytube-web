/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uytube.web.classes;

import uytube.web.wsclients.*;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.datatype.DatatypeConfigurationException;
import javax.xml.datatype.DatatypeFactory;
import javax.xml.datatype.XMLGregorianCalendar;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.GregorianCalendar;

/**
 *
 * @author tesla
 */
@WebServlet(name = "ModificarVideoServlet", urlPatterns = {"/ModificarVideoServlet"}, asyncSupported = true)
public class ModificarVideoServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ParseException, VideoRepetidoException_Exception, DatatypeConfigurationException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        HttpSession s = request.getSession();
        DtUsuario user = (DtUsuario) s.getAttribute("usuario");
        String oldV = (String) s.getAttribute("oldV");
        String nomV = request.getParameter("nomV").trim();
        String duracion = request.getParameter("duracion").trim();
        String url = request.getParameter("url").trim();
        String descripcion = request.getParameter("desc").trim();
        String fechaPub = request.getParameter("fechaPu").trim();
        boolean estado = request.getParameter("estado").equals("privado");
        String categoria = request.getParameter("categorias").trim();

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date fecha = sdf.parse(fechaPub);

        ControladorCanalService f = new ControladorCanalService();
        IControladorCanal c = f.getControladorCanalPort();
        DtVideo v = new DtVideo();
        v.setNombre(nomV);
        v.setCanal(user.getCanal());

        GregorianCalendar calendario = new GregorianCalendar();
        calendario.setTime(fecha);
        XMLGregorianCalendar xmlCalendario = DatatypeFactory.newInstance().newXMLGregorianCalendar(calendario);
        v.setFechaPublicacion(xmlCalendario);
        v.setUrl(url);
        v.setDescripcion(descripcion);
        v.setCategoria(categoria);
        v.setDuracion(duracion);
        v.setPrivado(estado);

        c.modificarVideo(v,oldV);
        s.removeAttribute("oldV");
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
        try {
            processRequest(request, response);
        } catch (ParseException | VideoRepetidoException_Exception | DatatypeConfigurationException e) {
            e.printStackTrace();
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
            throws IOException {
        try {
            processRequest(request, response);
        } catch (ParseException | VideoRepetidoException_Exception | DatatypeConfigurationException e) {
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
