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
import javax.xml.datatype.DatatypeFactory;
import javax.xml.datatype.XMLGregorianCalendar;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

/**
 *
 * @author isaac
 */
@MultipartConfig
@WebServlet(name = "ResponderRespuestaServlet", urlPatterns = {"/ResponderRespuestaServlet"})
public class ResponderRespuestaServlet extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        HttpSession s = request.getSession();
        DtUsuario user = (DtUsuario) s.getAttribute("usuario");
        String comentario = request.getParameter("respuesta1");
        String padre = request.getParameter("referencia1");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date fecha = new Date();
        sdf.format(fecha);

        String nomVid = (String) s.getAttribute("nomVideo"); // obtengo nombre video por medio de la sesion de verVideo.jsp
        String canal = (String) s.getAttribute("canal");

        ControladorCanalService cont = new ControladorCanalService();
        IControladorCanal controladorCanal = cont.getControladorCanalPort();

        DtVideo v = controladorCanal.obtenerVideo(nomVid, canal);
        List lista = controladorCanal.listaComentariosTodos();
        Integer ref = lista.size() + 1;

        if(!comentario.isEmpty()){
            DtComentario c = new DtComentario();
            c.setNick(user.getNickname());
            c.setComentario(comentario);

            GregorianCalendar calendario = new GregorianCalendar();
            calendario.setTime(fecha);
            XMLGregorianCalendar xmlCalendario = DatatypeFactory.newInstance().newXMLGregorianCalendar(calendario);
            c.setFecha(xmlCalendario);

            c.setVideo(v);
            c.setPadre(padre);
            c.setRef(ref);
            c.setCanal(canal);

            controladorCanal.agregarComentario(c);

            out.println("<script src='assets/js/sweetalert2.all.min.js' type='text/javascript'></script>");
            out.println("<script type='text/javascript' src='assets/js/jquery-3.4.1.min.js'></script>");
            out.println("<script>");
            out.println("$(document).ready(function(){");
            out.println("Swal.fire('Excelente!','Comentario agregado','success')");
            out.println("});");
            out.println("</script>");
        }
        else{
            out.println("<script src='assets/js/sweetalert2.all.min.js' type='text/javascript'></script>");
            out.println("<script type='text/javascript' src='assets/js/jquery-3.4.1.min.js'></script>");
            out.println("<script>");
            out.println("$(document).ready(function(){");
            out.println("Swal.fire('Error!','Comentario vacio','error')");
            out.println("});");
            out.println("</script>");
        }
        RequestDispatcher rd = request.getRequestDispatcher("verVideos.jsp?video="+ nomVid+"&canal="+canal);
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