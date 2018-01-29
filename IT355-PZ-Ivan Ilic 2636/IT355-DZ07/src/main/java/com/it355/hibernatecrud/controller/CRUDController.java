/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.it355.hibernatecrud.controller;

import com.it355.hibernatecrud.dao.FavouritesDao;
import com.it355.hibernatecrud.entity.Genre;
import com.it355.hibernatecrud.entity.Playlist;
import com.it355.hibernatecrud.entity.Song;
import com.it355.hibernatecrud.entity.User;
import java.security.Principal;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author ivani
 */
@Controller
public class CRUDController {

    @Autowired
    FavouritesDao favouritesDao;

    @RequestMapping(value = {"/"}, method = RequestMethod.GET)
    public ModelAndView defaultPage() {
        ModelAndView model = new ModelAndView();
        model.addObject("message", "Listen to music whenever you want!");
        model.setViewName("glavna");
        return model;
    }

    @RequestMapping(value = "/admin**", method = RequestMethod.GET)
    public ModelAndView adminPage() {
        ModelAndView model = new ModelAndView();
        model.addObject("message", "This is a page for admin!");
        model.setViewName("admin");
        return model;
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView login(@RequestParam(value = "error", required = false) String error,
            @RequestParam(value = "logout", required = false) String logout) {
        ModelAndView model = new ModelAndView();
        if (error != null) {
            model.addObject("error", "Invalid login information!");
        }
        if (logout != null) {
            model.addObject("msg", "You are logged out");
        }
        model.setViewName("login");
        return model;
    }

    @RequestMapping(value = "/403", method = RequestMethod.GET)
    public ModelAndView accesssDenied() {
        ModelAndView model = new ModelAndView();
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        if (!(auth instanceof AnonymousAuthenticationToken)) {
            UserDetails userDetail = (UserDetails) auth.getPrincipal();
            System.out.println(userDetail);
            model.addObject("username", userDetail.getUsername());
        }
        model.setViewName("403");
        return model;
    }

    @RequestMapping(value = "/deleteSong/{id}", method = RequestMethod.GET)
    public String deleteSong(@PathVariable("id") int id, HttpServletRequest request) {
        System.out.println("Fetching & Deleting song with id " + id);
        Song s = favouritesDao.getSongById(id);
        if (s == null) {
            System.out.println("Unable to delete. Song with id " + id + " not found");
            String referer = request.getHeader("Referer");
            return "redirect:" + referer;
        }

        favouritesDao.deleteSong(s);
        String referer = request.getHeader("Referer");
        return "redirect:" + referer;
    }

    @RequestMapping(value = "/deleteSongFromPlaylist/{id}", method = RequestMethod.GET)
    public String deleteSongFromPlaylist(@PathVariable("id") int id, HttpServletRequest request) {
        System.out.println("Fetching & Deleting song from playlist with id " + id);
        Playlist s = favouritesDao.getSongFromPlaylistById(id);
        if (s == null) {
            System.out.println("Unable to delete. Song with id " + id + " not found");
            String referer = request.getHeader("Referer");
            return "redirect:" + referer;
        }

        favouritesDao.deleteSongFromPlaylist(s);
        String referer = request.getHeader("Referer");
        return "redirect:" + referer;
    }

    @RequestMapping(value = "/addToPlaylist/{id}", method = RequestMethod.GET)
    public String addToPlaylist(@PathVariable("id") int id, HttpServletRequest request, ModelAndView model) {
        int provera = 0;
        Song s = favouritesDao.getSongById(id);
        Principal principal = request.getUserPrincipal();
        User u = favouritesDao.getUsersUsername(principal.getName());
        Playlist p = new Playlist();
        p.setUser(u);
        p.setSong(s);

        List<Playlist> playlist = favouritesDao.getPlaylistForUser(u);
        for (int i = 0; i < playlist.size(); i++) {
            if (s.getId() == playlist.get(i).getSong().getId()) {
                provera= provera + 1;
                 break;
            } else {
                provera = 0;

            }

        }
        if (provera > 0) {
            
          
        } else if (provera==0) {
            favouritesDao.addToPlaylist(p);
             
        }
        String referer = request.getHeader("Referer");

        return "redirect:" + referer;
    }

    @RequestMapping(value = "/addSong", method = RequestMethod.GET)
    public String addSong(Model model) {
        model.addAttribute("song", new Song());
        model.addAttribute("genres", favouritesDao.getGenres());
        return "addSong";
    }

    @RequestMapping(value = "/addSong", method = RequestMethod.POST)
    public ModelAndView addSong(@ModelAttribute("song") Song p, ModelAndView model) {
        p.setEnabled(Boolean.TRUE);
        p = favouritesDao.addSong(p);
        model.addObject("genres", favouritesDao.getGenres());
        model.addObject("successMsg", "Song successfully added");
        model.addObject("song", p);
        return model;
    }

    @RequestMapping(value = "/editSong/{id}", method = RequestMethod.GET)
    public String addSong(@PathVariable("id") int id, Model model) {
        Song song = favouritesDao.getSongById(id);
        model.addAttribute("song", song);
        model.addAttribute("genres", favouritesDao.getGenres());
        return "addSong";
    }

    @RequestMapping(value = "/addGenre", method = RequestMethod.GET)
    public String addGenre(Model model) {
        model.addAttribute("genre", new Genre());
        return "addGenre";
    }

    @RequestMapping(value = "/addGenre", method = RequestMethod.POST)
    public ModelAndView addGenre(@ModelAttribute("genre") Genre p, ModelAndView model) {
        p.setEnabled(Boolean.TRUE);
        favouritesDao.addGenre(p);
        model.addObject("successMsg", "Genre successfully added");
        return model;
    }

    @RequestMapping(value = "/seeSongs", method = RequestMethod.GET)
    public ModelAndView getProducts(ModelAndView model) {
        model.addObject("songs", favouritesDao.getSongs());
        model.addObject("song", new Song());
        return model;
    }

    @RequestMapping(value = "/seePlaylist", method = RequestMethod.GET)
    public ModelAndView seePlaylist(ModelAndView model, HttpServletRequest request) {
        Principal principal = request.getUserPrincipal();
        User u = favouritesDao.getUsersUsername(principal.getName());
        List<Playlist> playlist = favouritesDao.getPlaylistForUser(u);
        model.addObject("list", playlist);

        return model;
    }

    @RequestMapping(value = "/adduser", method = RequestMethod.GET)
    public String addUser(Model model) {
        model.addAttribute("user", new User());
        return "adduser";
    }

    @RequestMapping(value = "/adduser", method = RequestMethod.POST)
    public ModelAndView addUser(@ModelAttribute("user") User p,
            ModelAndView model) {
        model.addObject("object", p);
        User usr = favouritesDao.getUsersUsername(p.getUsername());
        if (usr != null) {
            model.addObject("error", "Username already exists!");
        } else if(p.getUsername().isEmpty()){
             model.addObject("error", "Unesi username");
        }else if(p.getPassword().isEmpty()){
                model.addObject("error", "Unesi password");
        }
        else{
            favouritesDao.addUser(p);
            model.addObject("successMsg", "Registration successfull");

        }
        return model;
    }

}
