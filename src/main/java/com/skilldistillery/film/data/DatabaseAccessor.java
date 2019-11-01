package com.skilldistillery.film.data;

import java.util.*;

import com.skilldistillery.film.entities.*;

public interface DatabaseAccessor {
  public Film findFilmById(int filmId);
  public Actor findActorById(int actorId);
  public List<Actor> findActorsByFilmId(int filmId);
  public List<Film> findFilmsbyActorId(int actorID);
  public List<Film> findFilmsByKeyword(String keyword);
  public Map<String, Integer>  findInventoryConditionCountByFilmId(int filmId);
  public Film createFilm(Film f);
  public boolean deleteFilm(Film f);
  public boolean updateFilm(Film f);
}
