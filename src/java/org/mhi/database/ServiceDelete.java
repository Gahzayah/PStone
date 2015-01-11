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
import org.mhi.persistence.ImgCat;
import org.mhi.persistence.ImgGallery;

/**
 *
 * @author MaHi
 */
public class ServiceDelete {

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

    public void removeGroup(ArtMain artMain) {
        EntityManager em = getEnitityManagerFactory().createEntityManager();
        try {
            em.getTransaction().begin();
            em.remove(em.merge(artMain));
            em.flush();
        } catch (Exception ex) {
            em.getTransaction().rollback();
            System.out.println("SQL-Exception: Transaction failed." + ex);
        } finally {
            em.close();

        }
    }

    public void removeCatAList(ArtCat artcat) {
        EntityManager em = getEnitityManagerFactory().createEntityManager();
        try {
            em.getTransaction().begin();
            em.remove(em.merge(artcat));
            em.flush();
        } catch (Exception ex) {
            em.getTransaction().rollback();
            System.out.println("SQL-Exception: Transaction failed." + ex);
        } finally {
            em.close();
        }
    }
}
