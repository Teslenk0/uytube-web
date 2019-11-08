/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uytube.web.classes;


import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.services.youtube.YouTube;
import com.google.api.services.youtube.model.Video;
import com.google.api.services.youtube.model.VideoListResponse;
import uytube.web.wsclients.*;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.datatype.DatatypeFactory;
import javax.xml.datatype.XMLGregorianCalendar;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
/**
 *
 * @author isaac
 */
@MultipartConfig
@WebServlet(name = "AltaVideoServlet", urlPatterns = {"/AltaVideoServlet"})
public class AltaVideoServlet extends HttpServlet {

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

        HttpSession s = request.getSession();
        DtUsuario user = (DtUsuario) s.getAttribute("usuario");
        String video = request.getParameter("nombreVideo").trim();
        String url = request.getParameter("url").trim();
        String descripcion = request.getParameter("descripcion").trim();
        boolean estado = request.getParameter("estado").equals("privado");
        String categoria = request.getParameter("categorias").trim();

        String date = LocalDate.now().toString();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date fecha = sdf.parse(date);

        YouTube youtube = new YouTube.Builder(new NetHttpTransport(), new JacksonFactory(),
                request1 -> {
                }).setApplicationName("video-test").build();

        YouTube.Videos.List videoRequest = youtube.videos().list("contentDetails");
        videoRequest.setId(getID(url));
        videoRequest.setKey("AIzaSyA3ufP6Bysq7K9xMv3BSXLlUGIC_oX3Lt8");
        VideoListResponse listResponse = videoRequest.execute();
        List<Video> videoList = listResponse.getItems();
        Video targetVideo = videoList.iterator().next();
        String duracion = convertYouTubeDuration(targetVideo.getContentDetails().getDuration());

        DtCanal canal = user.getCanal();
        DtVideo v = new DtVideo();
        v.setNombre(video);
        v.setCanal(canal);

        GregorianCalendar calendario = new GregorianCalendar();
        calendario.setTime(fecha);
        XMLGregorianCalendar xmlCalendario = DatatypeFactory.newInstance().newXMLGregorianCalendar(calendario);
        v.setFechaPublicacion(xmlCalendario);
        v.setUrl(url);
        v.setDescripcion(descripcion);
        v.setCategoria(categoria);
        v.setDuracion(duracion);
        v.setPrivado(estado);

        ControladorCanalService f = new ControladorCanalService();
        IControladorCanal controladorCanal = f.getControladorCanalPort();
        controladorCanal.registrarVideo(v);
        response.sendRedirect("index.jsp");
    }

    public String getID(String url){
        String id = null;
        String pattern = "(?<=watch\\?v=|/videos/|embed\\/|youtu.be\\/|\\/v\\/|\\/e\\/|watch\\?v%3D|watch\\?feature=player_embedded&v=|%2Fvideos%2F|embed%\u200C\u200B2F|youtu.be%2F|%2Fv%2F)[^#\\&\\?\\n]*";
        Pattern compiledPattern = Pattern.compile(pattern);
        if ( url != null) {
            Matcher matcher = compiledPattern.matcher(url);
            if (matcher.find()) {
                id = matcher.group();
            } else {
                id = null;
            }

        }
        return id;
    }

    public static String convertYouTubeDuration(String duration) {
        String youtubeDuration = duration;
        Calendar c = new GregorianCalendar();
        try {
            DateFormat df = new SimpleDateFormat("'PT'mm'M'ss'S'");
            Date d = df.parse(youtubeDuration);
            c.setTime(d);
        } catch (ParseException e) {
            try {
                DateFormat df = new SimpleDateFormat("'PT'hh'H'mm'M'ss'S'");
                Date d = df.parse(youtubeDuration);
                c.setTime(d);
            } catch (ParseException e1) {
                try {
                    DateFormat df = new SimpleDateFormat("'PT'ss'S'");
                    Date d = df.parse(youtubeDuration);
                    c.setTime(d);
                } catch (ParseException e2) {
                }
            }
        }
        c.setTimeZone(TimeZone.getDefault());

        String time = "";
        if ( c.get(Calendar.HOUR) > 0 ) {
            if ( String.valueOf(c.get(Calendar.HOUR)).length() == 1 ) {
                time += "0" + c.get(Calendar.HOUR);
            }
            else {
                time += c.get(Calendar.HOUR);
            }
            time += ":";
        }
        if ( String.valueOf(c.get(Calendar.MINUTE)).length() == 1 ) {
            time += "0" + c.get(Calendar.MINUTE);
        }
        else {
            time += c.get(Calendar.MINUTE);
        }
        time += ":";
        if ( String.valueOf(c.get(Calendar.SECOND)).length() == 1 ) {
            time += "0" + c.get(Calendar.SECOND);
        }
        else {
            time += c.get(Calendar.SECOND);
        }
        return time ;
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