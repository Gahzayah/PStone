/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.mhi.servlets;

import java.io.IOException;
import java.io.InputStream;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.apache.commons.io.IOUtils;
import org.mhi.database.ServiceQuery;
import org.mhi.database.ServiceUpdate;
import org.mhi.persistence.Images;
import org.mhi.persistence.ImgCat;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,   // 2MB
        maxFileSize = 1024 * 1024 * 10,                 // 10MB
        maxRequestSize = 1024 * 1024 * 50)              // 50MB

public class ImageUpload extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        // Service Class for DB - Actions
        ServiceQuery query = new ServiceQuery();
        ServiceUpdate update = new ServiceUpdate();

        String imgName = request.getParameter("name");
        String imgDesc = request.getParameter("desc");
        String imgCat  = request.getParameter("category");
        String fileSize = null;
        String fileName = null;
        String contentType = null;
        String[] parts = null;

        InputStream inputStream = null; // input stream of the upload file

        // obtains the upload file part in this multipart request
        Part filePart = request.getPart("files");
        
        if (filePart != null) {
            // Fill up Information extract from File
            fileSize = "" + filePart.getSize();
            parts = filePart.getSubmittedFileName().split("\\.");
            contentType = filePart.getContentType();

            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();

            // new Image
            Images img = new Images();
            // Set Parameters
            img.setFileName(imgName + "." + parts[1]);
            img.setName(imgName);
            img.setDescription(imgDesc);
            img.setFileBlob(IOUtils.toByteArray(inputStream));
            img.setFileSize(fileSize);
            img.setcTyp(contentType);
            // Relationship to Category
            ImgCat cat = query.getCategoryByID(Long.valueOf(imgCat));
            img.setCategory(cat);
            // Persist to Database
            update.insertImage(img);
        }
        response.sendRedirect(request.getServletContext().getContextPath() + "/admin/upload");

    }

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws org.apache.commons.fileupload.FileUploadException
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
