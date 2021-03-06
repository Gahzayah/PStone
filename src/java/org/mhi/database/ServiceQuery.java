/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.mhi.database;

import java.util.List;
import static javafx.scene.input.KeyCode.T;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import org.mhi.persistence.ImgCat;
import org.mhi.persistence.ImgGallery;
import static org.mhi.database.DBUtil.getEnitityManagerFactory;
import org.mhi.persistence.ArtCat;
import org.mhi.persistence.ArtMain;
import org.mhi.persistence.Article;
import org.mhi.persistence.Images;

/**
 *
 * @author MaHi
 */
public class ServiceQuery {

    // Objects for Gallerie
    private List<ImgGallery> galleryList = null;
    private List<ImgCat> categoryList = null;
    private List<ImgCat> categoryByGalleryID = null;
    private List<Images> imageList = null;

    // Objects for News/Article
    private List<ArtMain> groupList = null;
    private List<ArtCat> ugroupList = null;
    private List<Article> articleList = null;

    private ArtMain group = null;
    private ArtCat categoryA = null;
    private Article article = null;

    private ImgGallery gallery = null;
    private ImgCat category = null;
    private Images image = null;

    /**
     * @return the galleryList
     */
    public List<ImgGallery> getGalleryList() {
        EntityManager em = getEnitityManagerFactory().createEntityManager();
        
        TypedQuery<ImgGallery> query = em.createQuery("Select q from ImgGallery q Order by q.name", ImgGallery.class);
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

    /**
     *
     * @param gallery the gallery to set
     */
    public void setGalleryByID(ImgGallery gallery) {
        this.gallery = gallery;
    }

    /**
     * @return the categoryList
     */
    public List<ImgCat> getCategoryList() {
        EntityManager em = getEnitityManagerFactory().createEntityManager();
        TypedQuery<ImgCat> query = em.createQuery("Select q from ImgCat q Order by q.name", ImgCat.class);
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
        TypedQuery<ImgCat> query = em.createQuery("Select q from ImgCat q where q.gallery.imgGalleryID = " + ID + " Order by q.name", ImgCat.class);
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

    /**
     * @return the groupList
     */
    public List<ArtMain> getGroupList() {
        EntityManager em = getEnitityManagerFactory().createEntityManager();
        TypedQuery<ArtMain> query = em.createQuery("Select q from ArtMain q Order by q.name", ArtMain.class);
        groupList = query.getResultList();
        em.close();
        return groupList;
    }

    /**
     * @param groupList the groupList to set
     */
    public void setGroupList(List<ArtMain> groupList) {
        this.groupList = groupList;
    }

    /**
     *
     * @param ID
     * @return
     */
    public ArtMain getGroupByID(Long ID) {
        EntityManager em = getEnitityManagerFactory().createEntityManager();
        group = em.find(ArtMain.class, ID);
        em.close();

        return group;
    }

    /**
     * @param group the group to set
     */
    public void setGroupByID(ArtMain group) {
        this.group = group;
    }

    /**
     * @return the groupList
     */
    public List<ArtCat> getCatAList() {
        EntityManager em = getEnitityManagerFactory().createEntityManager();
        TypedQuery<ArtCat> query = em.createQuery("Select q from ArtCat q Order by q.name", ArtCat.class);
        ugroupList = query.getResultList();
        em.close();
        return ugroupList;
    }

    /**
     * @param ugroupList the groupList to set
     */
    public void setCatAList(List<ArtCat> ugroupList) {
        this.ugroupList = ugroupList;
    }

    public ArtCat getCatAListByID(Long ID) {
        EntityManager em = getEnitityManagerFactory().createEntityManager();
        categoryA = em.find(ArtCat.class, ID);
        em.close();
        return categoryA;
    }

    public void setCatAListByID(ArtCat artcat) {
        this.categoryA = artcat;
    }

    /**
     * @return the articleList
     */
    public List<Article> getArticleListByOSP() {
        EntityManager em = getEnitityManagerFactory().createEntityManager();
        TypedQuery<Article> query = em.createQuery("Select q from Article q where q.onlyStartPage = true", Article.class);
        articleList = query.getResultList();
        em.close();

        return articleList;
    }

    /**
     * @param articleList the articleList to set
     */
    public void setArticleListByOSP(List<Article> articleList) {
        this.articleList = articleList;
    }

    public List<Article> getArticleListByNonOSP() {
        EntityManager em = getEnitityManagerFactory().createEntityManager();
        TypedQuery<Article> query = em.createQuery("Select q from Article q where q.onlyStartPage = false", Article.class);
        articleList = query.getResultList();
        em.close();

        return articleList;
    }

    /**
     * @param articleList the articleList to set
     */
    public void setArticleListByNonOSP(List<Article> articleList) {
        this.articleList = articleList;
    }

    public Article getArticleByID(long ID) {
        EntityManager em = getEnitityManagerFactory().createEntityManager();
        article = em.find(Article.class, ID);
        em.close();

        return article;
    }

    public void setArticleByID(Article article) {
        this.article = article;
    }

    public Article getArticleByCatID(long ID) {
        EntityManager em = getEnitityManagerFactory().createEntityManager();
        TypedQuery<Article> query = em.createQuery("Select q from Article q where q.artCatID = " + ID, Article.class);
        em.close();

        return article;
    }

    public void setArticleByCatID(Article article) {
        this.article = article;
    }

    /**
     * @return the group
     */
    public ArtMain getGroup() {
        return group;
    }

    /**
     * @param group the group to set
     */
    public void setGroup(ArtMain group) {
        this.group = group;
    }

    /**
     * @return the categoryA
     */
    public ArtCat getCategoryA() {
        return categoryA;
    }

    /**
     * @param categoryA the categoryA to set
     */
    public void setCategoryA(ArtCat categoryA) {
        this.categoryA = categoryA;
    }

    /**
     * @return the article
     */
    public Article getArticle() {
        return article;
    }

    /**
     * @param article the article to set
     */
    public void setArticle(Article article) {
        this.article = article;
    }

}
