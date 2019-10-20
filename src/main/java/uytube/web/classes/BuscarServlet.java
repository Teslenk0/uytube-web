/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uytube.web.classes;

import DataTypes.*;
import fabrica.Fabrica;
import interfaces.IControladorCanal;

import java.io.IOException;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

        HttpSession s = request.getSession();
        DtUsuario user =(DtUsuario) s.getAttribute("usuario");

        response.setContentType("text/html;charset=UTF-8");
        String texto = request.getParameter("buscador").trim();

        Fabrica fabrica = Fabrica.getInstance();
        IControladorCanal controladorCanal = fabrica.getControladorCanal();

        //VER SI SACAR LOS RESULTADOS EN EL MISMO ARBOL O EN DIFERENTES
        List canales = controladorCanal.busquedaArborescenteCanales(texto);
        List listas = controladorCanal.busquedaArborescenteListasParticulares(texto);
        List videos = controladorCanal.busquedaArborescenteVideos(texto);

        if(request.getParameter("ordFecha") != null){
            if (request.getParameter("ordFecha").equals("1")) {
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
                    List<DtVideo> ultimosVideos = new LinkedList<DtVideo>();
                    List<DtCanal> canalesVacios = new LinkedList<DtCanal>();
                    DtCanal aux;
                    DtVideo tmp;
                    for (int i=0; i < canales.size();i++){
                        aux = (DtCanal)  canales.get(i);
                        tmp = controladorCanal.buscoVideoMasRecienteCanal(aux.getNombre_canal());
                        if(tmp != null) {
                            ultimosVideos.add(tmp);
                        }else{
                            canalesVacios.add(aux);
                        }
                    }
                    Collections.sort(ultimosVideos,  new Comparator<DtVideo>() {
                        public int compare(DtVideo m1, DtVideo m2) {
                            return (m1.getFechaPublicacion().compareTo(m2.getFechaPublicacion())*(-1));
                        }
                    });
                    aux = null;
                    canales = new LinkedList();
                    for(int i=0; i < ultimosVideos.size();i++){
                        tmp = (DtVideo) ultimosVideos.get(i);
                        canales.add(tmp.getCanal());
                    }
                    canales.addAll(canalesVacios);
                }

                if(listas != null) {

                    List ultimosVideos = new LinkedList<>();

                    //listas postas
                    List<DtListaParticulares> listasVacias = new LinkedList<DtListaParticulares>();
                    DtListaParticulares aux;

                    //listas por videos
                    DtListaParticularVideos vidxlist= null;
                    DtVideo tmp;
                    Object[] datos = new Object[2];
                    for (int i = 0; i < listas.size(); i++) {
                        aux = (DtListaParticulares) listas.get(i);
                        tmp = controladorCanal.buscoVideoMasRecienteListaParticular(aux.getNombreLista(),aux.getCanal().getNombre_canal());
                        if (tmp != null) {
                            //creo un array en el que guardo la lista y el video mas nuevo
                            //perteneciente a esta

                            datos[0] = aux;
                            datos[1] = tmp;
                            System.out.println(datos);
                            ultimosVideos.add(datos);
                            datos = new Object[2];
                        } else {
                            listasVacias.add(aux);
                        }
                    }

                    Collections.sort(ultimosVideos, new Comparator<Object[]>() {
                        public int compare(Object[] m1, Object[] m2) {
                            DtVideo v1 = (DtVideo) m1[1];
                            DtVideo v2 = (DtVideo) m2[1];
                            return (v1.getFechaPublicacion().compareTo(v2.getFechaPublicacion()) * (-1));
                        }
                    });

                    datos = null;
                    listas = new LinkedList();
                    for (int i = 0; i < ultimosVideos.size(); i++) {
                        datos = (Object[]) ultimosVideos.get(i);
                        listas.add(datos[0]);
                    }
                    listas.addAll(listasVacias);
                }

            }
        }

        if(user != null){
            if(canales != null){
                int ubicacion = -5;
                DtCanal canal = null;
                for(int i = 0; i < canales.size();i++){
                    canal = (DtCanal) canales.get(i);
                    if(canal.getNombre_canal().equals(user.getCanal().getNombre_canal())){
                        ubicacion = i;
                        break;
                    }
                }
                if(ubicacion != -5){
                    canales.remove(ubicacion);
                }
        }
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
