/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.it355.hibernatecrud.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 *
 * @author ivani
 */
@Entity
@Table(name = "favouritessongs")
public class FavouritesSong {
    
  @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    public Integer id;

    @Column(name = "quantity")
    public Integer quantity;

    
     @Column(name = "enabled")
    private Boolean enabled = Boolean.TRUE;

    @ManyToOne
    @JoinColumn(name = "SONG_ID", referencedColumnName = "ID")
    public Song song;

    @ManyToOne
    @JoinColumn(name = "FAVOURITES_ID", referencedColumnName = "ID")
    public Favourites favourites;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Boolean getEnabled() {
        return enabled;
    }

    public void setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }

    public Song getSong() {
        return song;
    }

    public void setSong(Song song) {
        this.song = song;
    }

    public Favourites getFavourites() {
        return favourites;
    }

    public void setFavourites(Favourites favourites) {
        this.favourites = favourites;
    }

    @Override
    public String toString() {
        return "FavouritesSong{" + "id=" + id + ", quantity=" + quantity + ", enabled=" + enabled + ", song=" + song + ", favourites=" + favourites + '}';
    }

    
    
    
}
