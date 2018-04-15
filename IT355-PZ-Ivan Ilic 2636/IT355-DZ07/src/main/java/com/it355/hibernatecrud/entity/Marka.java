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
import javax.persistence.Table;

/**
 *
 * @author ivani
 */
@Entity
@Table(name = "markatelefona")
public class Marka {
    
      @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MARKAID")
    private Integer markaid;

    @Column(name = "MARKANAZIV")
    private String markanaziv;

    @Column(name = "MARKAOPIS")
    private String markaopis;

    public Integer getMarkaid() {
        return markaid;
    }

    public void setMarkaid(Integer markaid) {
        this.markaid = markaid;
    }

    public String getMarkanaziv() {
        return markanaziv;
    }

    public void setMarkanaziv(String markanaziv) {
        this.markanaziv = markanaziv;
    }

    public String getMarkaopis() {
        return markaopis;
    }

    public void setMarkaopis(String markaopis) {
        this.markaopis = markaopis;
    }

    @Override
    public String toString() {
        return markanaziv;
    }

   
    
    
}
