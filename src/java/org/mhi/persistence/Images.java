/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template fileBlob, choose Tools | Templates
 * and open the template in the editor.
 */

package org.mhi.persistence;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author MaHi
 */
@Entity
public class Images implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long imageID;
    @ManyToOne
    private ImgCat category;     
    private String name = null;
    private String fileName = null;
    private String fileSize = null;
    private String cTyp = null; 
    private String description = null;
    private byte[] fileBlob = null;
    private int thumbCat = 0;
    @Temporal(TemporalType.TIMESTAMP)
    private Date timeStmp = null;
  
    private static final long serialVersionUID = 1L;
    
    public Long getId() {
        return imageID;
    }

    public void setId(Long id) {
        this.imageID = id;
    }
    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getFilesize() {
        return fileSize;
    }

    public void setFilesize(String filesize) {
        this.fileSize = filesize;
    }

    public String getcTyp() {
        return cTyp;
    }

    public void setcTyp(String cTyp) {
        this.cTyp = cTyp;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public ImgCat getCategory() {
        return category;
    }

    public void setCategory(ImgCat category) {
        this.category = category;
    }

    public byte[] getFile() {
        return fileBlob;
    }

    public void setFile(byte[] file) {
        this.fileBlob = file;
    }

    public Date getTimeStmp() {
        return timeStmp;
    }

    public void setTimeStmp(Date timestamp) {
        this.timeStmp = timestamp;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }


    public int getThumbCat() {
        return thumbCat;
    }

    public void setThumbCat(int thumbCat) {
        this.thumbCat = thumbCat;
    }
    
    
    
    @Override
    public int hashCode() {
        int hash = 0;
        hash += (imageID != null ? imageID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the imageID fields are not set
        if (!(object instanceof Images)) {
            return false;
        }
        Images other = (Images) object;
        if ((this.imageID == null && other.imageID != null) || (this.imageID != null && !this.imageID.equals(other.imageID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "org.mhi.persistence.Images[ id=" + imageID + " ]";
    }
    
}
