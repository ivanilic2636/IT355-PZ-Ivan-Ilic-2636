/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.it355.hibernatecrud.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author ivani
 */
@Entity
@Table(name = "favourites")
public class Favourites {
    
     @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;
    
     @Column(name = "addDate")
    @Temporal(TemporalType.DATE)
    private Date addDate;

    @Column(name = "enabled")
    private Boolean enabled;
    
    @OneToMany(mappedBy = "favourites", cascade = CascadeType.ALL)
    private List<FavouritesSong> items;

    public Favourites() {
        this.items = new ArrayList<FavouritesSong>();
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getAddDate() {
        return addDate;
    }

    public void setAddDate(Date addDate) {
        this.addDate = addDate;
    }

    public Boolean getEnabled() {
        return enabled;
    }

    public void setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }

    public List<FavouritesSong> getItems() {
        return items;
    }

    public void setItems(List<FavouritesSong> items) {
        this.items = items;
    }
    
     public FavouritesSong findItemBySongId(int songId) {
        for (FavouritesSong favouritesSong : this.items) {
            if (favouritesSong.getSong().getId() == songId) {
                return favouritesSong;
            }
        }
        return null;
    }

    @Override
    public String toString() {
        return "Favourites{" + "id=" + id + ", addDate=" + addDate + ", enabled=" + enabled + ", items=" + items + '}';
    }
     
     
}
