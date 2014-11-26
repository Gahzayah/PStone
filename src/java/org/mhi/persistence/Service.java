/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.mhi.persistence;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import static org.mhi.persistence.DBUtil.getEnitityManagerFactory;

/**
 *
 * @author MaHi
 */
public class Service {

    private List<String> galleryNameList = null;
    private List<String> categoryNameList = null;
    private List<ImgGallery> galleryList = null;
    private List<ImgCat> categoryList = null;
    private List<Image> imageList = null;

    ImgGallery gallery = null;
    ImgCat category = null;
    Image image = null;

    /**
     * @return the galleryName
     */
    public List<String> getGalleryName() {
        EntityManager em = getEnitityManagerFactory().createEntityManager();
        TypedQuery<String> query = em.createQuery("Select NAME from IMGGALLERY", String.class);
        galleryNameList = query.getResultList();
        em.close();
        return galleryNameList;
    }
    
        /**
     * @return the galleryName
     */
    public List<String> getGalleryName(int id) {
        EntityManager em = getEnitityManagerFactory().createEntityManager();
        TypedQuery<String> query = em.createQuery("Select NAME from IMGGALLERY where IMGGALLERYID = " + id , String.class);
        galleryNameList = query.getResultList();
        em.close();
        return galleryNameList;
    }

    /**
     * @param galleryName the galleryName to set
     */
    public void setGalleryName(List<String> galleryName) {
        this.galleryNameList = galleryName;
    }

    /**
     * @return the categoryName
     */
    public List<String> getCategoryName() {
        EntityManager em = getEnitityManagerFactory().createEntityManager();
        TypedQuery<String> query = em.createQuery("Select NAME from IMGCAT", String.class);
        categoryNameList = query.getResultList();
        em.close();
        return categoryNameList;
    }
    
    /**
     * @return the categoryName
     */
    public List<String> getCategoryNameByID(int id) {
        EntityManager em = getEnitityManagerFactory().createEntityManager();
        TypedQuery<String> query = em.createQuery("Select NAME from IMGCAT where IMGCATID = " + id , String.class);
        categoryNameList = query.getResultList();
        em.close();
        return categoryNameList;
    }

    /**
     * @param categoryName the categoryName to set
     */
    public void setCategoryName(List<String> categoryName) {
        this.categoryNameList = categoryName;
    }

    /**
     * @return the galleryList
     */
    public List<ImgGallery> getGalleryList() {
        EntityManager em = getEnitityManagerFactory().createEntityManager();
        TypedQuery<ImgGallery> query = em.createQuery("", ImgGallery.class);
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
        TypedQuery<ImgCat> query = em.createQuery("", ImgCat.class);
        categoryList = query.getResultList();
        em.close();
        return categoryList;
    }
    
     /**
     * @return the categoryList
     */
    public List<ImgCat> getCategoryListbyID(int id) {
        EntityManager em = getEnitityManagerFactory().createEntityManager();
        TypedQuery<ImgCat> query = em.createQuery("", ImgCat.class);
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
     * @param id
     * @return the imageList
     */
    public List<Image> getImageListbyID(int id) {
        EntityManager em = getEnitityManagerFactory().createEntityManager();
        TypedQuery<Image> query = em.createQuery("" + id, Image.class);
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
