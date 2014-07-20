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
    private List<ImgGallery> imgGallery = null;

    public List<ImgCat> getImageCategories() {
        EntityManager em = getEnitityManagerFactory().createEntityManager();
        TypedQuery<ImgCat> query = em.createQuery("Select q from ImgCat q", ImgCat.class);
        imgCat = query.getResultList();
        em.close();

        return imgCat;

    }

    public List<ImgGallery> getImageGalleries() {
        EntityManager em = getEnitityManagerFactory().createEntityManager();
        TypedQuery<ImgGallery> query = em.createQuery("Select q from ImgGallery q", ImgGallery.class);
        imgGallery = query.getResultList();
        em.close();

        return imgGallery;

    }

    public void setImgGallery(List<ImgGallery> imgGallery) {
        this.imgGallery = imgGallery;
    }
    

    public void setImgCat(List<ImgCat> imgCat) {
        this.imgCat = imgCat;
    }

    public ImgCat getCategoryByID(Long categorieID) {
        EntityManager em = getEnitityManagerFactory().createEntityManager();
        ImgCat categorie = em.find(ImgCat.class, categorieID);
        em.close();

        return categorie;

    }

    public void newCategory(String name, String desc) {
        EntityManager em = getEnitityManagerFactory().createEntityManager();

        ImgCat cat = new ImgCat();
        cat.setName(name);
        cat.setDescription(desc);
        //cat.setGallery(gallery);

        try {
            em.getTransaction().begin();
            // persist object - add to entity manager
            em.persist(cat);
            // flush em - save to DB
            em.flush();
        } catch (Exception ex) {
            em.getTransaction().rollback();
            System.out.println("SQL-Exception: Transaction failed." + ex);
        } finally {
            em.close();

        }

    }

    public void newGallery(String name, String desc) {
        EntityManager em = getEnitityManagerFactory().createEntityManager();

        ImgCat cat = new ImgCat();
        cat.setName(name);
        cat.setDescription(desc);

        try {
            em.getTransaction().begin();
            // persist object - add to entity manager
            em.persist(cat);
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
