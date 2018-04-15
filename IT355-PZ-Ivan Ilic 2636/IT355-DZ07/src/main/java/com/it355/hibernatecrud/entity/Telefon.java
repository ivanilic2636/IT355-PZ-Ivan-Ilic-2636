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
 */@Entity
@Table(name = "telefon")
public class Telefon {
     
      @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "TELEFONID")
    private Integer telefonid;

    @Column(name = "TELEFONNAZIV")
    private String telefonnaziv;
    
     @Column(name = "KORISNIKUSERNAME")
    private String korisnikusername;
    

    @Column(name = "TELEFONOPIS")
    private String telefonopis;

    @Column(name = "TELEFONMEMORIJA")
    private String telefonmemorija;
     
    @Column(name = "TELEFONBRZINAPROCESORA")
    private String telefonbrzinaprocesora;
    
     @Column(name = "TELEFONJACINAKAMERE")
    private Integer telefonjacinakamere;
     
      @Column(name = "TELEFONVODOOTPORAN")
    private boolean telefonvodootporan;
     
    
       @ManyToOne
    @JoinColumn(name = "MARKAID", referencedColumnName = "MARKAID")
    private Marka marka;

    public Integer getTelefonid() {
        return telefonid;
    }

    public void setTelefonid(Integer telefonid) {
        this.telefonid = telefonid;
    }

    public String getTelefonnaziv() {
        return telefonnaziv;
    }

    public void setTelefonnaziv(String telefonnaziv) {
        this.telefonnaziv = telefonnaziv;
    }

    public String getKorisnikusername() {
        return korisnikusername;
    }

    public void setKorisnikusername(String korisnikusername) {
        this.korisnikusername = korisnikusername;
    }

    public String getTelefonopis() {
        return telefonopis;
    }

    public void setTelefonopis(String telefonopis) {
        this.telefonopis = telefonopis;
    }

    public String getTelefonmemorija() {
        return telefonmemorija;
    }

    public void setTelefonmemorija(String telefonmemorija) {
        this.telefonmemorija = telefonmemorija;
    }

    public String getTelefonbrzinaprocesora() {
        return telefonbrzinaprocesora;
    }

    public void setTelefonbrzinaprocesora(String telefonbrzinaprocesora) {
        this.telefonbrzinaprocesora = telefonbrzinaprocesora;
    }

    public Integer getTelefonjacinakamere() {
        return telefonjacinakamere;
    }

    public void setTelefonjacinakamere(Integer telefonjacinakamere) {
        this.telefonjacinakamere = telefonjacinakamere;
    }

    public boolean isTelefonvodootporan() {
        return telefonvodootporan;
    }

    public void setTelefonvodootporan(boolean telefonvodootporan) {
        this.telefonvodootporan = telefonvodootporan;
    }

    public Marka getMarka() {
        return marka;
    }

    public void setMarka(Marka marka) {
        this.marka = marka;
    }

    @Override
    public String toString() {
        return "Telefon{" + "telefonid=" + telefonid + ", telefonnaziv=" + telefonnaziv + ", korisnikusername=" + korisnikusername + ", telefonopis=" + telefonopis + ", telefonmemorija=" + telefonmemorija + ", telefonbrzinaprocesora=" + telefonbrzinaprocesora + ", telefonjacinakamere=" + telefonjacinakamere + ", telefonvodootporan=" + telefonvodootporan + ", marka=" + marka + '}';
    }

       
       
       
}
