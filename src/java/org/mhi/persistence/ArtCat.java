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
public class ArtCat implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long artCatID;
    @OneToMany(mappedBy = "category", orphanRemoval = true)
    private List<Article> artikel = new ArrayList();
    @ManyToOne
    private ArtMain main;
    private String name;
    @Temporal(TemporalType.TIMESTAMP)
    private Date timeStmp = new Date();

    public Long getArtCatID() {
        return artCatID;
    }

    public void setArtCatID(Long artCatID) {
        this.artCatID = artCatID;
    }

    public List<Article> getArtikel() {
        return artikel;
    }

    public void setArtikel(List<Article> artikel) {
        this.artikel = artikel;
    }

    public ArtMain getMain() {
        return main;
    }

    public void setMain(ArtMain main) {
        this.main = main;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getTimeStmp() {
        return timeStmp;
    }

    public void setTimeStmp(Date timeStmp) {
        this.timeStmp = timeStmp;
    }
    
    
}
