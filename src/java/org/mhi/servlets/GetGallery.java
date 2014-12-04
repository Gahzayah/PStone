/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.mhi.servlets;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.mhi.dataquery.Service;
import org.mhi.persistence.ImgGallery;

/**
 *
 * @author MaHi
 */
public class GetGallery extends HttpServlet {

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
        // Which Gallery Entry ?
        String galleryID = request.getParameter("id");
        String thumbCat = request.getParameter("imgCat");

        // Load Database Class
        Service service = new Service();

        // Gallery
        if (request.getRequestURI().endsWith("/gallery")) {
            if(galleryID != null){
                // A Specify Request for a Gallery
                request.setAttribute("servxGallery", service.getCategoryByGalleryID(request.getParameter("id")));
            } else {
                //First Visit set the first category in the first gallery
                List<ImgGallery> list = service.getGalleryList();
                galleryID = list.get(0).getImgGalleryID().toString();

                request.setAttribute("servxGallery", service.getCategoryByGalleryID(galleryID));
            }
            // Thumbnail from Category
            if(thumbCat != null){
                request.setAttribute("servxCategory", service.getImageListbyID(thumbCat));
            }
            request.getRequestDispatcher("/gallery.jsp").forward(request, response);
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
