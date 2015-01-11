/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.mhi.persistence;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


/**
 *
 * @author MaHi
 */
@Entity
public class Article implements Serializable{
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long imageID;
    @ManyToOne
    @JoinColumn(name="CATEGORY_ARTCATID")
    private ArtCat category;     
    private String titel = null;
    private String text = null;
//    @OneToMany(mappedBy = "category" , orphanRemoval=true )
//    private List<ArtCat> catList = null;  
    private boolean withStartPage = false;
    private boolean onlyStartPage = false;
    @Temporal(TemporalType.TIMESTAMP)
    private Date timeStmp = new Date();
  
    private static final long serialVersionUID = 1L;

    public Long getImageID() {
        return imageID;
    }

    public void setImageID(Long imageID) {
        this.imageID = imageID;
    }

    public ArtCat getCategory() {
        return category;
    }

    public void setCategory(ArtCat category) {
        this.category = category;
    }

    public String getTitel() {
        return titel;
    }

    public void setTitel(String titel) {
        this.titel = titel;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public boolean isWithStartPage() {
        return withStartPage;
    }

    public void setWithStartPage(boolean withStartPage) {
        this.withStartPage = withStartPage;
    }

    public boolean isOnlyStartPage() {
        return onlyStartPage;
    }

    public void setOnlyStartPage(boolean onlyStartPage) {
        this.onlyStartPage = onlyStartPage;
    }

    public Date getTimeStmp() {
        return timeStmp;
    }

    public void setTimeStmp(Date timeStmp) {
        this.timeStmp = timeStmp;
    }
    
    
}
