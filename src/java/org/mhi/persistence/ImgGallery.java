/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package org.mhi.persistence;



import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


/**
 *
 * @author MaHi
 */

public class ImgGallery implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long imgGalleryID;
    //@OneToMany(mappedBy = "gallery")
   // private List<ImgCat> category = new ArrayList();
    private String name;
    @Temporal(TemporalType.TIMESTAMP)
    private Date timestmp;

    public Long getImgGalleryID() {
        return imgGalleryID;
    }

    public void setImgGalleryID(Long imgGalleryID) {
        this.imgGalleryID = imgGalleryID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getTimestmp() {
        return timestmp;
    }

    public void setTimestmp(Date timestmp) {
        this.timestmp = timestmp;
    }
    
    
    
}
