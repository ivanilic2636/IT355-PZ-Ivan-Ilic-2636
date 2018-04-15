/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.it355.hibernatecrud.dao;

import com.it355.hibernatecrud.entity.Favourites;
import com.it355.hibernatecrud.entity.FavouritesSong;
import com.it355.hibernatecrud.entity.Genre;
import com.it355.hibernatecrud.entity.Marka;
import com.it355.hibernatecrud.entity.Playlist;
import com.it355.hibernatecrud.entity.Song;
import com.it355.hibernatecrud.entity.Telefon;
import com.it355.hibernatecrud.entity.User;
import java.util.List;

/**
 *
 * @author ivani
 */
public interface FavouritesDao {

    public Song getSongById(int id);

    public List<Genre> getGenres();

    public Genre getGenreById(int id);

    public void saveFav(Favourites fav);

    public List<Song> getSongsByGenre(Genre genre);

    public List<Favourites> getAllFav();

    public List<FavouritesSong> getItemsByFav(Favourites item);

    public void editGenre(Genre genre);

    public Genre addGenre(Genre genre);

    public void editSong(Song song);

    public Song addSong(Song song);

    public void editFav(Favourites fav);

    public Favourites getFavById(Integer id);

    public int getCountSongsInGenre(int genreId);

    public int getCountSongs();

    public void deleteSong(Song song);

    public void deleteGenre(Genre genre);

    public void deleteFavourites(Favourites fav);

    public void deleteItem(FavouritesSong item);

    public User addUser(User user);

    public User getUsersUsername(String username);
    
    public Playlist getSongFromPlaylistById(int id);
    
     public void deleteSongFromPlaylist(Playlist item);
     
  public List<Playlist> getPlaylistForUser(User username);

    public List<Song> getSongs();

    public List<User> getUsers();

    public Playlist addToPlaylist(Playlist p);
    
   
    
    public Marka addMarka(Marka marka);
    public void deleteMarka(Marka marka);
    public void editMarka(Marka marka);
    public Marka getMarkaById(int id);
    public List<Marka> getMarke();
    
    
      public Telefon addTelefon(Telefon telefon);
    public List<Telefon> getTelefoni();
    
}
