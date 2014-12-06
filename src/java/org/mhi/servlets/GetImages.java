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
import org.mhi.database.ServiceQuery;
import org.mhi.imageutilities.ImageResizer;
import org.mhi.persistence.Images;
import org.mhi.persistence.ImgCat;

/**
 *
 * @author MaHi
 */
public class GetImages extends HttpServlet {

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
        ServiceQuery service = new ServiceQuery();

        String imgCatByID = request.getParameter("imgCat");
        String imgByID = request.getParameter("img");
        String imgListByID = request.getParameter("id");

        // IMAGE LIST
        if (imgListByID != null) {
            List<Images> list = service.getImageListbyID(imgListByID);
            if (list != null && !list.isEmpty()) {
                List<ImgCat> listB = service.getCategoryListByID(list.get(0).getCategory().getGallery().getImgGalleryID().toString());
                request.setAttribute("servxGallery", listB);
            }
            request.setAttribute("imagesByCat", list);
            request.getRequestDispatcher("/category.jsp").forward(request, response);
        }
        // IMAGE BY ID
        if (imgByID != null) {
            
            Images img = service.getImageByID(Long.valueOf(imgByID));
            // Images as ByteArray
            byte[] imageRaw = img.getFileBlob();

            response.setContentLength(imageRaw.length);
            response.getOutputStream().write(imageRaw);

        }
        // CAT-IMAGE BY ID
        if (imgCatByID != null) {

            ImageResizer ir = new ImageResizer();
            // Retrieve ImgCategory
            ImgCat cat = service.getCategoryByID(Long.valueOf(imgCatByID));

            byte[] imageRaw = cat.getFileBlob();
            // Resize Images to 50px
            imageRaw = ir.resize(imageRaw, 95, 95);

            response.setContentLength(imageRaw.length);
            response.getOutputStream().write(imageRaw);
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
