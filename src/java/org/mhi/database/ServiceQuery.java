/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.mhi.database;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import org.mhi.persistence.ImgCat;
import org.mhi.persistence.ImgGallery;
import static org.mhi.database.DBUtil.getEnitityManagerFactory;
import org.mhi.persistence.Images;

/**
 *
 * @author MaHi
 */
public class ServiceQuery {

    private List<ImgGallery> galleryList = null;
    private List<ImgCat> categoryList = null;
    private List<ImgCat> categoryByGalleryID = null;
    private List<Images> imageList = null;

    ImgGallery gallery = null;
    ImgCat category = null;
    private Images image = null;

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

    public ImgGallery getGalleryByID(long ID) {
        EntityManager em = getEnitityManagerFactory().createEntityManager();
        gallery = em.find(ImgGallery.class, ID);
        em.close();

        return gallery;
    }

    public void setGalleryByID(ImgGallery gallery) {
        this.gallery = gallery;
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
     * 
     * @param ID
     * @return 
     */
    public ImgCat getCategoryByID(Long ID) {
        EntityManager em = getEnitityManagerFactory().createEntityManager();
        category = em.find(ImgCat.class, ID);
        em.close();

        return category;
    }
    
    /**
     * @param category the category to set
     */
    public void setCategoryByID(ImgCat category) {
        this.category = category;
    }
    
    /**
     * 
     * @param ID
     * @return 
     */
    public List<ImgCat> getCategoryListByID(String ID) {
        EntityManager em = getEnitityManagerFactory().createEntityManager();
        TypedQuery<ImgCat> query = em.createQuery("Select q from ImgCat q where q.gallery.imgGalleryID = " + ID, ImgCat.class);
        categoryByGalleryID = query.getResultList();
        em.close();
        return categoryByGalleryID;
    }

    /**
     * @param categoryByGalleryID the categoryByGalleryID to set
     */
    public void setCategoryListByID(List<ImgCat> categoryByGalleryID) {
        this.categoryByGalleryID = categoryByGalleryID;
    }

    /**
     * @param ID
     * @return the imageList
     */
    public List<Images> getImageListbyID(String ID) {
        EntityManager em = getEnitityManagerFactory().createEntityManager();
        TypedQuery<Images> query = em.createQuery("Select q from Images q where q.category.imgCatID = " + ID, Images.class);
        imageList = query.getResultList();
        em.close();
        return imageList;
    }

    /**
     * @param imageList the imageList to set
     */
    public void setImageList(List<Images> imageList) {
        this.imageList = imageList;
    }

    /**
     * @return the image
     */
    public Images getImageByID(long ID) {
        EntityManager em = getEnitityManagerFactory().createEntityManager();
        image = em.find(Images.class, ID);;
        return image;
    }

    /**
     * @param image the image to set
     */
    public void setImageByID(Images image) {
        this.image = image;
    }
    
    



}
