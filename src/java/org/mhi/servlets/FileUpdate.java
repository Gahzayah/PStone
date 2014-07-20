/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.mhi.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.mhi.persistence.ImgService;

/**
 *
 * @author MaHi
 */
public class FileUpdate extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String c_category    = request.getParameter("newCategory");
        String g_gallery     = request.getParameter("newGallery");
        String c_description = request.getParameter("newCDescription");
        String g_description = request.getParameter("newGDescription");
        /* Database Image-Service Class */
        ImgService service = new ImgService();

        /* Update and create new Gallery */
        if (c_category != null && c_category.equals("Neue Kategorie")==false && c_description.equals("Beschreibung")==false ) {
            // Create
            
            service.newCategory(c_category, c_description);
            response.sendRedirect(request.getServletContext().getContextPath() + "/admin/upload");
        } 
        /* Update and create new Category */ 
        else if (g_gallery != null && g_gallery.equals("Neue Gallery")==false && g_description.equals("Beschreibung")==false) {
            // Create
            service.newGallery(g_gallery, g_description);
            response.sendRedirect(request.getServletContext().getContextPath() + "/admin/upload");
        } 
        /* Anfrage konnte nicht bearbeitet werden */    
        else {
            response.sendRedirect(request.getServletContext().getContextPath() + "/admin/upload");
        }
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
