/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.mhi.database;

import javax.persistence.EntityManager;
import static org.mhi.database.DBUtil.getEnitityManagerFactory;
import org.mhi.persistence.ArtCat;
import org.mhi.persistence.ArtMain;
import org.mhi.persistence.Article;
import org.mhi.persistence.Images;
import org.mhi.persistence.ImgCat;
import org.mhi.persistence.ImgGallery;

/**
 *
 * @author MaHi
 */
public class ServiceUpdate {

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

    public void newGroup(ArtMain main) {
        EntityManager em = getEnitityManagerFactory().createEntityManager();

        try {
            em.getTransaction().begin();
            // persist object - add to entity manager
            em.persist(main);
            // flush em - save to DB
            em.flush();
        } catch (Exception ex) {
            em.getTransaction().rollback();
            System.out.println("SQL-Exception: Transaction failed." + ex);
        } finally {
            em.close();

        }
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

    public void insertImage(Images img) {
        EntityManager em = DBUtil.getEnitityManagerFactory().createEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(img);
            em.getTransaction().commit();
        } catch (Exception ex) {
            em.getTransaction().rollback();
            System.out.println("SQL-Exception: Transaction failed." + ex);
        } finally {
            em.close();
        }
    }

    public void newArticle(Article article) {
        EntityManager em = DBUtil.getEnitityManagerFactory().createEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(article);
            em.flush();
        } catch (Exception ex) {
            em.getTransaction().rollback();
            System.out.println("SQL-Exception: Transaction failed." + ex);
        } finally {
            em.close();
        }
    }

    public void newCatGroup(ArtCat artcat) {
        EntityManager em = DBUtil.getEnitityManagerFactory().createEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(artcat);
            em.flush();
        } catch (Exception ex) {
            em.getTransaction().rollback();
            System.out.println("SQL-Exception: Transaction failed." + ex);
        } finally {
            em.close();
        }
    }

    public void updateArticle(Article article) {
        EntityManager em = DBUtil.getEnitityManagerFactory().createEntityManager();
        try {
            em.getTransaction().begin();
            em.merge(article);
            em.getTransaction().commit();
        } catch (Exception ex) {
            em.getTransaction().rollback();
            System.out.println("SQL-Exception: Transaction failed." + ex);
        } finally {
            em.close();
        }
    }

}
