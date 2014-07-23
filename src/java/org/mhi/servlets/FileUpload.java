/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.mhi.servlets;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;
import org.mhi.persistence.DBUtil;
import org.mhi.persistence.FileHandler;
import org.mhi.persistence.Images;
import org.mhi.persistence.ImgCat;
import org.mhi.persistence.ImgService;

@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)   // 50MB

public class FileUpload extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws org.apache.commons.fileupload.FileUploadException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, FileUploadException {
        response.setContentType("text/html;charset=UTF-8");
//       final String reqOfElement = "files";
        FileHandler fh = new FileHandler(request);

        Boolean multipart = ServletFileUpload.isMultipartContent(request);

        Part filePart = request.getPart("files");
        
        InputStream file = fh.getFile("files");
        byte[] blob = IOUtils.toByteArray(file);

        String imageName = fh.getParameter("name");
        String imageDesc = fh.getParameter("desc");
        String cType = fh.getContentType();
        String fileName = fh.getFileName();
        long fileSize = fh.getFileSize();

        if (multipart) {

            ImgService service = new ImgService();
            Images img = new Images();;
            EntityManager em = DBUtil.getEnitityManagerFactory().createEntityManager();

            String[] result = request.getParameterValues("category");

            img.setFileName(fileName);
            img.setName(imageName);
            img.setDescription(imageDesc);
            img.setFileBlob(blob);
            img.setFileSize("" + fileSize);
            img.setcTyp(cType);

            if (result != null) {
                ImgCat cat = service.getCategoryByID(Long.valueOf(result[0]));
                img.setCategory(cat);
            }

            try {
                em.getTransaction().begin();
                // persist object - add to entity manager
                em.persist(img);
                // flush em - save to DB
                em.flush();
            } catch (Exception ex) {
                em.getTransaction().rollback();
                System.out.println("SQL-Exception: Transaction failed." + ex);
            } finally {
                em.close();
            }
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
     * @throws org.apache.commons.fileupload.FileUploadException
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (FileUploadException ex) {
            Logger.getLogger(FileUpload.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (FileUploadException ex) {
            Logger.getLogger(FileUpload.class.getName()).log(Level.SEVERE, null, ex);
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
