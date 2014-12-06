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
@Entity
public class ArtMain implements Serializable{
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long artMainID;

    @OneToMany(mappedBy = "main",orphanRemoval=true )
    private List<ArtCat> category = new ArrayList();
    private String name;
    private String description;
    @Temporal(TemporalType.TIMESTAMP)
    private Date timestmp = new Date();

    public Long getArtMainID() {
        return artMainID;
    }

    public void setArtMainID(Long artMainID) {
        this.artMainID = artMainID;
    }

    public List<ArtCat> getCategory() {
        return category;
    }

    public void setCategory(List<ArtCat> category) {
        this.category = category;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getTimestmp() {
        return timestmp;
    }

    public void setTimestmp(Date timestmp) {
        this.timestmp = timestmp;
    }
    
    
    
}
