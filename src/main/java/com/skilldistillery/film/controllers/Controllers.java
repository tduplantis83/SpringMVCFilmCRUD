package com.skilldistillery.film.controllers;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.film.data.DatabaseAccessorObject;
import com.skilldistillery.film.entities.Film;

@Controller
public class Controllers {
	@Autowired
	private DatabaseAccessorObject dao;
	
	public void setDatabaseAccessorObject(DatabaseAccessorObject dao) {
		this.dao = dao;
	}
	
	@RequestMapping(path="welcomePage.do")
	public ModelAndView welcomePage() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("WEB-INF/views/home.jsp");
		return mv;
	}
	
	@RequestMapping(path="filmLookup.do")
	public ModelAndView filmLookup() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("WEB-INF/views/filmLookup.jsp");
		return mv;
	}
	
	@RequestMapping(path="filmLookupByID.do")
	public ModelAndView filmLookupByID() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("WEB-INF/views/filmLookupByID.jsp");
		return mv;
	}
	
	@RequestMapping(path="filmByID.do", method=RequestMethod.GET)
	public ModelAndView filmResultByID(int id) { 
		ModelAndView mv = new ModelAndView();
		List<Film> f = new ArrayList<>();
		f.add(dao.findFilmById(id));
		mv.addObject("film", f);
		mv.setViewName("WEB-INF/views/filmResult.jsp");
		return mv;
	}
	
	@RequestMapping(path="filmLookupByKeyword.do")
	public ModelAndView filmLookupByKeyword() { 
		ModelAndView mv = new ModelAndView();
		mv.setViewName("WEB-INF/views/filmLookupByKeyword.jsp");
		return mv;
	}

	@RequestMapping(path="filmCreate.do")
	public ModelAndView filmCreate() { 
		ModelAndView mv = new ModelAndView();
		mv.setViewName("WEB-INF/views/filmCreate.jsp");
		return mv;
	}
	
	@RequestMapping(path="filmCreate.do", method=RequestMethod.POST)
	public ModelAndView filmResultByKeyword(Film film) { 
	ModelAndView mv = new ModelAndView();
	List<Film> f = new ArrayList<>();
	f.add(dao.createFilm(film));
	mv.addObject("film", f);
	mv.setViewName("WEB-INF/views/filmResult.jsp");
	return mv;
	}
	
	@RequestMapping(path="filmByKeyword.do", method=RequestMethod.GET)
	public ModelAndView filmResultByKeyword(String keyword) { 
	ModelAndView mv = new ModelAndView();
	List<Film> f = dao.findFilmsByKeyword(keyword);
	mv.addObject("film", f);
	mv.setViewName("WEB-INF/views/filmResult.jsp");
	return mv;
	}
	
	@RequestMapping(path="filmUpdate.do")
	public ModelAndView filmUpdate() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("WEB-INF/views/filmUpdate.jsp");
		return mv;
	}
	
	@RequestMapping(path="filmUpdate.do", method=RequestMethod.POST)
	public ModelAndView filmUpdate(Film film) { 
	ModelAndView mv = new ModelAndView();
	Boolean updateComplete = false;
	updateComplete = dao.updateFilm(film);
	mv.addObject("film", film);
	mv.addObject("updateComplete", updateComplete);
	mv.setViewName("WEB-INF/views/filmResult.jsp");
	return mv;
	}
}
