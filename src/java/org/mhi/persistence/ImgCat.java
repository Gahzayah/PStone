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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author MaHi
 */
@Entity
public class ImgCat implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long imgCatID;  
    @OneToMany(mappedBy = "category", orphanRemoval=true )
    private List<Images> images = new ArrayList() ;  
    @ManyToOne
    private ImgGallery gallery;
    private String name;
    private String description;
    @Temporal(TemporalType.TIMESTAMP)
    private Date timeStmp = new Date();
    
    public Long getImgCatID() {
        return imgCatID;
    }

    public void setImgCatID(Long idCat) {
        this.imgCatID = idCat;
    }

    public List<Images> getImages() {
        return images;
    }

    public void setImages(List<Images> images) {
        this.images = images;
    }
    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public ImgGallery getGallery() {
        return gallery;
    }

    public void setGallery(ImgGallery gallery) {
        this.gallery = gallery;
    }
    
    public String getDescription() {
        return description;
    }

    public void setDescription(String desc) {
        this.description = desc;
    }

    public Date getTimeStmp() {
        return timeStmp;
    }

    public void setTimeStmp(Date timestamp) {
        this.timeStmp = timestamp;
    }
    
    
}
