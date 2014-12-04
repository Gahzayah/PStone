/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.mhi.dataquery;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import org.mhi.persistence.Image;
import org.mhi.persistence.ImgCat;
import org.mhi.persistence.ImgGallery;
import static org.mhi.persistence.DBUtil.getEnitityManagerFactory;

/**
 *
 * @author MaHi
 */
public class Service {

    private List<ImgGallery> galleryList = null;
    private List<ImgCat> categoryList = null;
    private List<ImgCat> categoryByGalleryID = null;
    private List<Image> imageList = null;

    ImgGallery gallery = null;
    ImgCat category = null;
    Image image = null;

    /**
     * @return the galleryList
     */
    public List<ImgGallery> getGalleryList() {
        EntityManager em = getEnitityManagerFactory().createEntityManager();
        TypedQuery<ImgGallery> query = em.createQuery("Select q from ImgGallery q", ImgGallery.class);
        galleryList = query.getResultList();
        em.close();
        return galleryList;
    }

    /**
     * @param galleryList the galleryList to set
     */
    public void setGalleryList(List<ImgGallery> galleryList) {
        this.galleryList = galleryList;
    }

    /**
     * @return the categoryList
     */
    public List<ImgCat> getCategoryList() {
        EntityManager em = getEnitityManagerFactory().createEntityManager();
        TypedQuery<ImgCat> query = em.createQuery("Select q from ImgCat q", ImgCat.class);
        categoryList = query.getResultList();
        em.close();
        return categoryList;
    }

    /**
     * @param categoryList the categoryList to set
     */
    public void setCategoryList(List<ImgCat> categoryList) {
        this.categoryList = categoryList;
    }
    
        /**
     * @return the categoryByGalleryID
     */
    public List<ImgCat> getCategoryByGalleryID(String ID) {
        EntityManager em = getEnitityManagerFactory().createEntityManager();
        TypedQuery<ImgCat> query = em.createQuery("Select q from ImgCat q where q.gallery.imgGalleryID = " + ID, ImgCat.class);
        categoryByGalleryID = query.getResultList();
        em.close();
        return categoryByGalleryID;
    }

    /**
     * @param categoryByGalleryID the categoryByGalleryID to set
     */
    public void setCategoryGalleryID(List<ImgCat> categoryByGalleryID) {
        this.categoryByGalleryID = categoryByGalleryID;
    }

    /**
     * @return the imageList
     */
    public List<Image> getImageList() {
        EntityManager em = getEnitityManagerFactory().createEntityManager();
        TypedQuery<Image> query = em.createQuery("", Image.class);
        imageList = query.getResultList();
        em.close();
        return imageList;
    }

    /**
     * @param ID
     * @return the imageList
     */
    public List<Image> getImageListbyID(String ID) {
        EntityManager em = getEnitityManagerFactory().createEntityManager();
        TypedQuery<Image> query = em.createQuery("Select q from Images q where q.category.imgCatID = " + ID, Image.class);
        imageList = query.getResultList();
        em.close();
        return imageList;
    }

    /**
     * @param imageList the imageList to set
     */
    public void setImageList(List<Image> imageList) {
        this.imageList = imageList;
    }



}
