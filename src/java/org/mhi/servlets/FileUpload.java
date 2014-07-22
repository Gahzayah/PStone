/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.mhi.servlets;

import java.io.IOException;
import javax.persistence.EntityManager;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;
import org.mhi.persistence.DBUtil;
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
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        final String reqOfElement = "files";
        Images img = null;
        Boolean multipart = ServletFileUpload.isMultipartContent(request);

        if (multipart) {
            EntityManager em = DBUtil.getEnitityManagerFactory().createEntityManager();
            Part filePart = request.getPart(reqOfElement);

            img = new Images();
            img.setFileName(filePart.getSubmittedFileName());
            img.setName(request.getParameter("name"));
            img.setDescription(request.getParameter("desc"));
            img.setFile(IOUtils.toByteArray(filePart.getInputStream()));
            img.setFilesize("" + filePart.getSize());
            img.setcTyp(filePart.getContentType());

            ImgService service = new ImgService();
            String[] result = request.getParameterValues("category");
            if (result != null) {
                ImgCat cat = service.getCategoryByID(Long.valueOf(result[0]));
                img.setCategory(cat);
            }
            if(service.getImageCategories()==null){
                img.setThumbCat(1);
            }else{
                img.setThumbCat(0); 
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
