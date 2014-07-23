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
import javax.servlet.http.Part;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;
import org.mhi.persistence.ImgGallery;
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
        final String reqOfElement = "files";
 //       Boolean multipart = ServletFileUpload.isMultipartContent(request);

        String c_category = request.getParameter("newCategory");
        String g_gallery = request.getParameter("newGallery");
        String c_description = request.getParameter("newCDescription");
        String g_description = request.getParameter("newGDescription");
        String[] s_id = request.getParameterValues("gallery");
        Long id = null;

        ImgService service = new ImgService();

        if (c_category != null) {
            id = Long.valueOf(s_id[0]);
            ImgGallery gal = service.getGalleryByID(id);
          
            service.newCategory(c_category, c_description, gal);
            response.sendRedirect(request.getServletContext().getContextPath() + "/admin/category");
        } /* Update and create new Category */ 
        else if (g_gallery != null) {
            // Create
            service.newGallery(g_gallery, g_description);
            response.sendRedirect(request.getServletContext().getContextPath() + "/admin/gallery");
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
