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

	@RequestMapping(path = "welcomePage.do")
	public ModelAndView welcomePage() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("WEB-INF/views/home.jsp");
		return mv;
	}

	@RequestMapping(path = "filmLookup.do")
	public ModelAndView filmLookup() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("WEB-INF/views/filmLookup.jsp");
		return mv;
	}

	@RequestMapping(path = "filmLookupByID.do")
	public ModelAndView filmLookupByID() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("WEB-INF/views/filmLookupByID.jsp");
		return mv;
	}

	@RequestMapping(path = "filmByID.do", method = RequestMethod.GET)
	public ModelAndView filmResultByID(int id) {
		ModelAndView mv = new ModelAndView();
		List<Film> f = new ArrayList<>();
		Film filmresult = new Film();
		filmresult = dao.findFilmById(id);
		if (filmresult != null) {
			f.add(dao.findFilmById(id));
		}
		mv.addObject("film", f);
		mv.addObject("deleteStatus", false);
		mv.addObject("updateStatus", false);
		mv.setViewName("WEB-INF/views/filmResult.jsp");
		return mv;
	}

	@RequestMapping(path = "filmLookupByKeyword.do")
	public ModelAndView filmLookupByKeyword() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("WEB-INF/views/filmLookupByKeyword.jsp");
		return mv;
	}

	@RequestMapping(path = "filmCreate.do")
	public ModelAndView filmCreate() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("WEB-INF/views/filmCreate.jsp");
		return mv;
	}

	@RequestMapping(path = "filmCreate.do", method = RequestMethod.POST)
	public ModelAndView filmResultByKeyword(Film film) {
		ModelAndView mv = new ModelAndView();
		System.out.println(film.allDetails());
		List<Film> f = new ArrayList<>();
		Film filmResult;
			filmResult = dao.createFilm(film);
		if (!filmResult.equals(null)) {
			System.out.println(filmResult.allDetails());
			f.add(filmResult);
			mv.addObject("film", f);
			mv.addObject("createStatus", false);
			mv.setViewName("WEB-INF/views/filmResult.jsp");
		} else {
			mv.addObject("createStatus", true);
			mv.setViewName("WEB-INF/views/filmCreate.jsp");
		}
		return mv;
	}

	@RequestMapping(path = "filmByKeyword.do", method = RequestMethod.GET)
	public ModelAndView filmResultByKeyword(String keyword) {
		ModelAndView mv = new ModelAndView();
		List<Film> f = dao.findFilmsByKeyword(keyword);
		mv.addObject("film", f);
		mv.addObject("deleteStatus", false);
		mv.addObject("updateStatus", false);
		mv.setViewName("WEB-INF/views/filmResult.jsp");
		return mv;
	}

	@RequestMapping(path = "filmUpdate.do", params = "id", method = RequestMethod.GET)
	public ModelAndView filmUpdate(int id) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("film", dao.findFilmById(id));
		mv.setViewName("WEB-INF/views/filmUpdate.jsp");
		return mv;
	}

	@RequestMapping(path = "filmUpdate.do", method = RequestMethod.POST)
	public ModelAndView filmUpdateResult(Film film) {
		ModelAndView mv = new ModelAndView();
		System.out.println(film.allDetails());
		List<Film> f = new ArrayList<>();
		if (dao.updateFilm(film)) {
			f.add(film);
			mv.addObject("film", f);
			mv.addObject("updateStatus", true);
			mv.setViewName("WEB-INF/views/filmResult.jsp");
		} else {
			f.add(film);
			mv.addObject("film", film);
			mv.addObject("updateStatus", true);
			mv.setViewName("WEB-INF/views/filmUpdate.jsp");
		}
		return mv;
	}

	@RequestMapping(path = "filmDelete.do", params = "id", method = RequestMethod.GET)
	public ModelAndView filmDelete(int id) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("film", dao.findFilmById(id));
		mv.setViewName("WEB-INF/views/filmDelete.jsp");
		return mv;
	}

	@RequestMapping(path = "filmDelete.do", method = RequestMethod.POST)
	public ModelAndView filmDeleteResult(Film film) {
		ModelAndView mv = new ModelAndView();
		System.out.println(film.allDetails());
		List<Film> f = new ArrayList<>();
		if (dao.deleteFilm(film)) {
			mv.addObject("film", f);
			mv.addObject("deleteStatus", true);
			mv.setViewName("WEB-INF/views/filmResult.jsp");
		} else {
			f.add(film);
			mv.addObject("film", film);
			mv.addObject("deleteStatus", true);
			mv.setViewName("WEB-INF/views/filmResult.jsp");
		}
		return mv;
	}

}
