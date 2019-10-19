/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uytube.web.classes;

import DataTypes.DtCanal;
import DataTypes.DtListaParticulares;
import fabrica.Fabrica;
import interfaces.IControladorCanal;
import DataTypes.DtVideo;

import java.io.IOException;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author tesla
 */
@WebServlet(name = "BuscarServlet", urlPatterns = {"/BuscarServlet"})
public class BuscarServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");

        response.setContentType("text/html;charset=UTF-8");
        String texto = request.getParameter("buscador").trim();

        Fabrica fabrica = Fabrica.getInstance();
        IControladorCanal controladorCanal = fabrica.getControladorCanal();

        //VER SI SACAR LOS RESULTADOS EN EL MISMO ARBOL O EN DIFERENTES
        List canales = controladorCanal.busquedaArborescenteCanales(texto);
        List listas = controladorCanal.busquedaArborescenteListasParticulares(texto);
        List videos = controladorCanal.busquedaArborescenteVideos(texto);

        if(request.getParameter("ordFecha") != null){
            if (request.getParameter("ordFecha").equals("1")){
                if(videos != null) {
                    Collections.sort(videos, new Comparator() {
                        public int compare(Object o1, Object o2) {
                            DtVideo aux;
                            DtVideo tmp;
                            aux = (DtVideo) o1;
                            tmp = (DtVideo) o2;
                            return tmp.getFechaPublicacion().compareTo(aux.getFechaPublicacion());
                        }
                    });
                }
                if(canales != null) {

                    /*Collections.sort(canales, Comparator.comparing(DtCanal::get)
                            .thenComparing(Report::getStudentNumber)
                            .thenComparing(Report::getSchool));*/
                    /*Collections.sort(canales, new Comparator<DtCanal>() {
                        public int compare(DtCanal o1, DtCanal o2) {
                            //hay que crear una funcion en el controladorcanal que busque el video mas nuevo en un canal y lo devuelva
                            /*DtCanal aux;
                            DtCanal tmp;
                            aux = (DtCanal) o1;
                            tmp = (DtCanal) o2;

                            DtVideo auxV = controladorCanal.buscoVideoMasRecienteCanal(aux.getNombre_canal());

                            DtVideo tmpV = controladorCanal.buscoVideoMasRecienteCanal(tmp.getNombre_canal());
                            if (auxV != null && tmpV != null) {
                                System.out.println("Canal: " + aux.getNombre_canal() + "Video: "+auxV.getNombre());

                                System.out.println("Canal: " + tmp.getNombre_canal() + "Video: "+tmpV.getNombre());
                                return tmpV.getFechaPublicacion().compareTo(auxV.getFechaPublicacion());
                            }
                            return 0;
                        }
                    });*/
                }
                /*if(listas != null) {
                    Collections.sort(listas, new Comparator() {
                        public int compare(Object o1, Object o2) {

                            //hay que crear una funcion en el controladorcanal que busque el video mas nuevo en una lista y lo devuelva
                            DtListaParticulares aux;
                            DtListaParticulares tmp;
                            aux = (DtListaParticulares) o1;
                            tmp = (DtListaParticulares) o2;

                            //HAY QUE SACAR LAS PRIVADAS TAMBIEN YA QUE SINO SE PIERDE EL ORDEN
                            DtVideo auxV = controladorCanal.buscoVideoMasRecienteListaParticular(aux.getNombreLista(), aux.getCanal().getNombre_canal());
                            if(auxV != null){
                                System.out.println("Lista:" + aux.getNombreLista() + " Video: " + auxV.getNombre());
                            }
                            DtVideo tmpV = controladorCanal.buscoVideoMasRecienteListaParticular(tmp.getNombreLista(), tmp.getCanal().getNombre_canal());
                            if(tmpV != null) {
                                System.out.println("Lista:" + tmp.getNombreLista() + " Video: " + tmpV.getNombre());
                            }
                            if (auxV != null && tmpV != null) {
                                return tmpV.getFechaPublicacion().compareTo(auxV.getFechaPublicacion());
                            }
                            return 0;
                        }*/
                    }
                    System.out.println(listas);
                }


        request.setAttribute("canales", canales);
        request.setAttribute("videos", videos);
        request.setAttribute("listas", listas);
        request.setAttribute("ultimaBusqueda",texto);

        request.getRequestDispatcher("index.jsp").forward(request, response);

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
