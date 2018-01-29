/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.it355.hibernatecrud.converter;

import com.it355.hibernatecrud.dao.FavouritesDao;
import com.it355.hibernatecrud.entity.Genre;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

/**
 *
 * @author ivani
 */
@Component
final class IntegerToGenre implements Converter<String, Genre>{

    @Autowired
    FavouritesDao favouritesDao;
    
    @Override
    public Genre convert(String s) {
    if (s.isEmpty()) {
            return null;
        }
        Integer valeu = Integer.valueOf(s);
        System.out.println("Konvertujem u zanr");
        Genre gen = favouritesDao.getGenreById(valeu);
        return gen;    
    }
    
}
