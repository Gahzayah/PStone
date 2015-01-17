/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.mhi.servlets;

import java.io.IOException;
import java.io.InputStream;
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
import org.apache.commons.io.IOUtils;
import org.mhi.database.ServiceDelete;
import org.mhi.database.ServiceQuery;
import org.mhi.database.ServiceUpdate;
import org.mhi.imageutilities.FileHandler;
import org.mhi.persistence.ArtCat;
import org.mhi.persistence.ArtMain;
import org.mhi.persistence.Article;
import org.mhi.persistence.ImgCat;
import org.mhi.persistence.ImgGallery;

@WebServlet("/admin/*")
public class adminManager extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, FileUploadException {

        ServiceQuery query = new ServiceQuery();
        ServiceUpdate update = new ServiceUpdate();
        ServiceDelete delete = new ServiceDelete();

        String sDelete = request.getParameter("delete");
        String sUpdate = request.getParameter("update");
        String sCreate = request.getParameter("create");
        String sUri = request.getRequestURI();

        boolean osp = false;
        boolean wsp = false;

        /* Create - Erstellen neuer Inhalte 
         ...................................
         */
        if (sCreate != null) {
            FileHandler fh = new FileHandler(request);

            /* Convert "on" "off" to boolean; */
            if (fh.getParameter("osp") != null) {
                if (fh.getParameter("osp").equals("on")) {
                    osp = true;
                }
            }

            if (fh.getParameter("wsp") != null) {
                if (fh.getParameter("wsp").equals("on")) {
                    wsp = true;
                }
            }
            switch (sCreate) {
                case "group":
                    ArtMain main = new ArtMain();
                    main.setName(fh.getParameter("group"));
                    update.newGroup(main);

                    request.getRequestDispatcher("/admin/creategroup.jsp").forward(request, response);
                    break;
                case "ugroup":
                    ArtMain artma = query.getGroupByID(Long.parseLong(fh.getParameter("mainGroup")));
                    ArtCat artcat = new ArtCat();
                    artcat.setMain(artma);
                    artcat.setName(fh.getParameter("ugroup"));
                    update.newCatGroup(artcat);

                    request.getRequestDispatcher("/admin/creategroup.jsp").forward(request, response);
                    break;
                case "article":
                    ArtCat cat = query.getCatAListByID(Long.parseLong(fh.getParameter("selectCategory")));
                    Article article = new Article();
                    article.setCategory(cat);
                    article.setTitel("Title 1");
                    article.setText(fh.getParameter("article"));
                    article.setOnlyStartPage(osp);
                    article.setWithStartPage(wsp);
                    article.setTimeStmp(new Date());
                    update.newArticle(article);
                    request.getRequestDispatcher("/admin/article").forward(request, response);
                    break;
                case "gallery":
                    ImgGallery gal = new ImgGallery();
                    gal.setName(fh.getParameter("xs_gallery"));
                    //gal.setDescription(fh.getParameter("xs_desc"));
                    update.newGallery(gal);

                    response.sendRedirect(request.getServletContext().getContextPath() + "/admin/gallery");
                    break;
                case "category":
                    if (fh.getParameter("gallery") != null && fh.getParameter("xs_category")!= null && fh.getFile("files") != null) {
                        ImgGallery c_gal = query.getGalleryByID(Long.parseLong(fh.getParameter("gallery")));
                        ImgCat c_cat = new ImgCat();
                        c_cat.setName(fh.getParameter("xs_category"));
                        //c_cat.setDescription(fh.getParameter("newDescription"));
                        c_cat.setFileBlob(IOUtils.toByteArray(fh.getFile("files")));
                        c_cat.setGallery(c_gal);
                        update.newCategory(c_cat);
                    }

                    response.sendRedirect(request.getServletContext().getContextPath() + "/admin/category");
                    break;
                default:            /* Fehlermeldung */

            }
        }

        /**
         * For All Group Interactions
         */
        if (sUri.endsWith("/action")) {
            // Delete Group / Untergroup     
            if (sDelete != null) {
                if (request.getParameter("ugrp") != null) {
                    delete.removeCatAList(query.getCatAListByID(Long.parseLong(sDelete)));
                } else {
                    delete.removeGroup(query.getGroupByID(Long.valueOf(sDelete)));
                }
                request.getRequestDispatcher("/admin/creategroup.jsp").forward(request, response);
            }
            if (sUpdate != null) {
                FileHandler fh = new FileHandler(request);
                Article article = query.getArticleByID(Long.parseLong(sUpdate));
                article.setText(fh.getParameter("article"));
                update.updateArticle(article);
                response.sendRedirect("/z1/about");
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
