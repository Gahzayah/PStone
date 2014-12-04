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
public class ImgService {

    private List<ImgCat> imgCat = null;
    private List<ImgCat> categoriesbyid = null;
    private List<ImgGallery> imgGallery = null;
    private Images catThumbnail = null;
    private String byteStringArray = null;

    public String getByteStringArray() {
        return byteStringArray;
    }

    public Images getSingleImageByID(Long id) {
        EntityManager em = getEnitityManagerFactory().createEntityManager();
        Images img = em.find(Images.class, id);;
        return img;
    }

    public void setByteStringArray(String byteStringArray) {
        this.byteStringArray = byteStringArray;
    }
    
    public List<Images> getImagesByCatID(String parameter) {
        List<Images> result = null;
        EntityManager em = getEnitityManagerFactory().createEntityManager();
        TypedQuery<Images> query = em.createQuery("Select q from Images q where q.category.imgCatID = " + parameter, Images.class);
        result = query.getResultList();
        em.close();
        return result;
    }

    /**
     * Category List
     *
     * @return
     */
    public List<ImgCat> getImageCategories() {
        EntityManager em = getEnitityManagerFactory().createEntityManager();
        TypedQuery<ImgCat> query = em.createQuery("Select q from ImgCat q", ImgCat.class);
        imgCat = query.getResultList();
        em.close();

        return imgCat;
    }

    /**
     * Single Category by Primary Key
     *
     * @param categorieID
     * @return
     */
    public ImgCat getCategoryByID(Long categorieID) {
        EntityManager em = getEnitityManagerFactory().createEntityManager();
        ImgCat categorie = em.find(ImgCat.class, categorieID);
        em.close();

        return categorie;
    }

    public List<ImgCat> getCategoriesByID(String parameter) {
        List<ImgCat> result = null;
        EntityManager em = getEnitityManagerFactory().createEntityManager();
        TypedQuery<ImgCat> query = em.createQuery("Select q from ImgCat q where q.gallery.imgGalleryID = " + parameter, ImgCat.class);
        result = query.getResultList();
        em.close();
        return result;
    }

    /**
     * New Category
     *
     * @param cat
     */
    public void newCategory(ImgCat cat) {
        EntityManager em = getEnitityManagerFactory().createEntityManager();

        try {
            em.getTransaction().begin();
            em.persist(cat);
            em.flush();
        } catch (Exception ex) {
            em.getTransaction().rollback();
            System.out.println("SQL-Exception: Transaction failed." + ex);
        } finally {
            em.close();

        }

    }

    public void removeCategory(ImgCat cat) {
        EntityManager em = getEnitityManagerFactory().createEntityManager();

        try {
            em.getTransaction().begin();
            em.remove(em.merge(cat));
            em.flush();
        } catch (Exception ex) {
            em.getTransaction().rollback();
            System.out.println("SQL-Exception: Transaction failed." + ex);
        } finally {
            em.close();

        }

    }

    /**
     * Gallery List
     *
     * @return
     */
    public List<ImgGallery> getImageGalleries() {
        EntityManager em = getEnitityManagerFactory().createEntityManager();
        TypedQuery<ImgGallery> query = em.createQuery("Select q from ImgGallery q", ImgGallery.class);
        imgGallery = query.getResultList();
        em.close();

        return imgGallery;

    }

    /**
     * Single Gallery by Primary Key
     *
     * @param galleryID
     * @return
     */
    public ImgGallery getGalleryByID(Long galleryID) {
        EntityManager em = getEnitityManagerFactory().createEntityManager();
        ImgGallery gal = em.find(ImgGallery.class, galleryID);
        em.close();

        return gal;
    }

    /**
     * New Gallery
     *
     * @param gal
     */
    public void newGallery(ImgGallery gal) {
        EntityManager em = getEnitityManagerFactory().createEntityManager();

        try {
            em.getTransaction().begin();
            // persist object - add to entity manager
            em.persist(gal);
            // flush em - save to DB
            em.flush();
        } catch (Exception ex) {
            em.getTransaction().rollback();
            System.out.println("SQL-Exception: Transaction failed." + ex);
        } finally {
            em.close();

        }

    }

    public void removeGallery(ImgGallery gal) {
        EntityManager em = getEnitityManagerFactory().createEntityManager();

        try {
            em.getTransaction().begin();
            // persist object - add to entity manager
            em.remove(em.merge(gal));
            // flush em - save to DB
            em.flush();
        } catch (Exception ex) {
            em.getTransaction().rollback();
            System.out.println("SQL-Exception: Transaction failed." + ex);
        } finally {
            em.close();

        }

    }

    public void insertImage(Images img) {
        EntityManager em = DBUtil.getEnitityManagerFactory().createEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(img);
            em.flush();
        } catch (Exception ex) {
            em.getTransaction().rollback();
            System.out.println("SQL-Exception: Transaction failed." + ex);
        } finally {
            em.close();
        }
    }

    }
