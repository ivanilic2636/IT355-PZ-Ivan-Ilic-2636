/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.it355.hibernatecrud.dao.impl;

import com.it355.hibernatecrud.dao.FavouritesDao;
import com.it355.hibernatecrud.entity.Favourites;
import com.it355.hibernatecrud.entity.FavouritesSong;
import com.it355.hibernatecrud.entity.Genre;
import com.it355.hibernatecrud.entity.Marka;
import com.it355.hibernatecrud.entity.Playlist;
import com.it355.hibernatecrud.entity.Song;
import com.it355.hibernatecrud.entity.Telefon;
import com.it355.hibernatecrud.entity.User;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author ivani
 */
@Repository("favouritesDao")
@Service

public class FavouritesDaoImpl implements FavouritesDao{

    @Autowired
    private SessionFactory sessionFactory;

    // kreiramo seter za sesiju
    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    // kreiramo geter za sesiju
    public Session getSession() {
        return sessionFactory.getCurrentSession();
    }

    @SuppressWarnings("unchecked")
    
    
    @Override
    @Transactional
    public List<Song> getSongs() {
      List<Song> results = (List<Song>) getSession().createCriteria(Song.class).list();
        return results;    
    }

    @Override
    @Transactional
    public Song getSongById(int id) {
    Song song = (Song) getSession().createCriteria(Song.class).add(Restrictions.eq("id", id)).uniqueResult();
        return song;    
    }

    @Override
    @Transactional
    public List<Genre> getGenres() {
     List<Genre> results = (List<Genre>) getSession().createCriteria(Genre.class).list();
        return results;    
    }

    @Override
    @Transactional
    public Genre getGenreById(int id) {
    Genre genre = (Genre) getSession().createCriteria(Genre.class).add(Restrictions.eq("id", id)).uniqueResult();
        return genre;    
    }

    @Override
    @Transactional
    public void saveFav(Favourites fav) {
      fav.setAddDate(new java.util.Date());
        getSession().saveOrUpdate(fav);   
    }

    @Override
    @Transactional
    public List<Song> getSongsByGenre(Genre genre) {
  
        return (List<Song>) getSession().createCriteria(Song.class).add(Restrictions.eq("category", genre)).list();
        
    }

    @Override
    @Transactional
    public List<Favourites> getAllFav() {
      List<Favourites> favourites = (List<Favourites>) getSession().createCriteria(Favourites.class).list();
        return favourites;    
    }

    @Override
    @Transactional
    public List<FavouritesSong> getItemsByFav(Favourites item) {
    return (List<FavouritesSong>) getSession().createCriteria(FavouritesSong.class).add(Restrictions.eq("favourites", item)).list();   
    }

    @Override
    @Transactional
    public void editGenre(Genre genre) {
         getSession().saveOrUpdate(genre);
    }

    @Override
    @Transactional
    public Genre addGenre(Genre genre) {
     return (Genre) getSession().merge(genre);   
    }

    @Override
    @Transactional
    public void editSong(Song song) {
    getSession().saveOrUpdate(song);    
    }

    @Override
    @Transactional
    public Song addSong(Song song) {
     return (Song) getSession().merge(song);   
    }

    @Override
    @Transactional
    public void editFav(Favourites fav) {
     getSession().saveOrUpdate(fav);   
    }

    @Override
    @Transactional
    public Favourites getFavById(Integer id) {
       Favourites favourites = (Favourites) getSession().createCriteria(Favourites.class).add(Restrictions.eq("id", id)).uniqueResult();
        return favourites;
    }

    @Override
    @Transactional
    public int getCountSongsInGenre(int genreId) {
    String hql = "select count(*) from songs where genre_id = :id";
        Number result = (Number) getSession().createSQLQuery(hql).setInteger("id", genreId).uniqueResult();
        return Integer.parseInt(result.toString());    
    }

    @Override
    @Transactional
    public int getCountSongs() {
     Number result = (Number) getSession().createSQLQuery("select count(*) from songs").uniqueResult();
        return Integer.parseInt(result.toString());   
    }

    @Override
    @Transactional
    public void deleteSong(Song song) {
    getSession().delete(song);    
    }

    @Override
    @Transactional
    
    public void deleteGenre(Genre genre) {
    getSession().delete(genre);    
    }

    @Override
    @Transactional
    public void deleteFavourites(Favourites fav) {
     getSession().delete(fav);    
    }

    @Override
    @Transactional
    public void deleteItem(FavouritesSong item) {
     getSession().delete(item);    
    }

    @Override
    @Transactional
    public User addUser(User user) {
     return (User) getSession().merge(user);      
    }
    
    
    
    
    
    @Override
     @Transactional
    public List<User> getUsers() {
        List<User> results = (List<User>) getSession().createCriteria(User.class).list();
        return results;  
    }

   

   

    @Override
    @Transactional
    public Playlist addToPlaylist(Playlist p) {
        return (Playlist) getSession().merge(p); 
    }

    @Override
    @Transactional
    public User getUsersUsername(String username) {
        User user = (User) getSession().createCriteria(User.class).add(Restrictions.eq("username", username)).uniqueResult();
        return user;
    }

    
    
    
    @Override
    @Transactional
    public List<Playlist> getPlaylistForUser(User username) {
        
       
        
        List<Playlist> results = (List<Playlist>) getSession().createCriteria(Playlist.class).add(Restrictions.eq("user", username)).list();
        return results;    
        
    }

    
   @Override
    @Transactional
    public Playlist getSongFromPlaylistById(int id) {
    Playlist playlist = (Playlist) getSession().createCriteria(Playlist.class).add(Restrictions.eq("id", id)).uniqueResult();
        return playlist;      
    }
    
    
    @Override
    @Transactional
    public void deleteSongFromPlaylist(Playlist item) {
        getSession().delete(item);
    }

   
    
    
    @Override
    @Transactional
    public Marka addMarka(Marka marka) {
     return (Marka) getSession().merge(marka);   
    }
    
    @Override
    @Transactional
    public void deleteMarka(Marka marka) {
    getSession().delete(marka);    
    }

    @Override
    @Transactional
    public void editMarka(Marka marka) {
    getSession().saveOrUpdate(marka);    
    }

   @Override
    @Transactional
    public Marka getMarkaById(int id) {
    Marka marka = (Marka) getSession().createCriteria(Marka.class).add(Restrictions.eq("id", id)).uniqueResult();
        return marka;    
    }

   @Override
    @Transactional
    public List<Marka> getMarke() {
      List<Marka> results = (List<Marka>) getSession().createCriteria(Marka.class).list();
        return results;    
    }
    
    
    
    @Override
    @Transactional
    public Telefon addTelefon(Telefon telefon) {
     return (Telefon) getSession().merge(telefon);   
    }

     @Override
    @Transactional
    public List<Telefon> getTelefoni() {
      List<Telefon> results = (List<Telefon>) getSession().createCriteria(Telefon.class).list();
        return results;    
    }
    
}
