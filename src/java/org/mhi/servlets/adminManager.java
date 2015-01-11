/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.mhi.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileUploadException;
import org.mhi.database.ServiceDelete;
import org.mhi.database.ServiceQuery;
import org.mhi.database.ServiceUpdate;
import org.mhi.imageutilities.FileHandler;
import org.mhi.persistence.ArtCat;
import org.mhi.persistence.ArtMain;
import org.mhi.persistence.Article;

@WebServlet("/admin/*")
public class adminManager extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, FileUploadException {

        ServiceQuery query = new ServiceQuery();
        ServiceUpdate update = new ServiceUpdate();
        ServiceDelete delete = new ServiceDelete();

        String sDelete = request.getParameter("delete");
        String sCreate = request.getParameter("create");
        String sUri = request.getRequestURI();

        if (sCreate != null) {
            FileHandler fh = new FileHandler(request);
            switch (sCreate) {
                case "group":
                    ArtMain main = new ArtMain();
                    main.setName(fh.getParameter("group"));
                    update.newGroup(main);
                    break;
                case "ugroup":
                    ArtMain artma = query.getGroupByID(Long.valueOf(fh.getParameter("mainGroup")));
                    ArtCat artcat = new ArtCat();
                    artcat.setMain(artma);
                    artcat.setName(fh.getParameter("ugroup"));
                    update.newCatGroup(artcat);
                    break;
                case "article":
                    Article article = new Article();
                    article.setTitel("Title 1");
                    article.setText(fh.getParameter("article"));
                    article.setTimeStmp(new Date());
                    update.newArticle(article);
                    break;
                default:            /* Fehlermeldung */

            }
            request.getRequestDispatcher("/admin/creategroup.jsp").forward(request, response);
        }

        /**
         * For All Group Interactions
         */
        if (sUri.endsWith("/action")) {
            // Delete Group     
            if (sDelete != null) {
                if(request.getParameter("ugrp")!=null){
                    delete.removeCatAList(query.getCatAListByID(Long.valueOf(sDelete)));
                }else{
                    //delete.removeGroup(new ArtMain());
                    delete.removeGroup(query.getGroupByID(Long.valueOf(sDelete)));
                }

                request.getRequestDispatcher("/admin/creategroup.jsp").forward(request, response);
            } else {

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
        try {
            processRequest(request, response);
        } catch (FileUploadException ex) {
            System.out.println("ERROR");
            Logger.getLogger(adminManager.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(adminManager.class.getName()).log(Level.SEVERE, null, ex);
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
