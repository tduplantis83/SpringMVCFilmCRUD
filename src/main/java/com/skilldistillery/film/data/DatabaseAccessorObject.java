package com.skilldistillery.film.data;

import java.sql.*;
import java.util.*;

import com.skilldistillery.film.entities.*;

public class DatabaseAccessorObject implements DatabaseAccessor {

	// string to connect to the database
	private static final String URL = "jdbc:mysql://localhost:3306/sdvid?useSSL=false";
	private static final String userPass = "student";

	static {
		try {
			// finds the driver to use to connect to mysql
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			System.err.println(e);
		}
	}

	@Override
	public Film findFilmById(int filmId) {
		Film filmResult = null;
		List<Actor> cast = new ArrayList<>();

		// automatically closes connections
		try (Connection conn = DriverManager.getConnection(URL, userPass, userPass);
				PreparedStatement stmt = conn
						/*
						 * .prepareStatement("SELECT film.*, language.name, category.name as categoryName "
						 * + "from film " + "inner join language on film.language_id = language.id " +
						 * "inner join film_category fc on fc.film_id = film.id " +
						 * "inner join category on category.id = fc.category_id " + "where film.id = ?")
						 */
						.prepareStatement(
								"SELECT film.*, language.name, category.name as categoryName from film inner join language on film.language_id = language.id left join film_category fc on fc.film_id = film.id left join category on category.id = fc.category_id where film.id = ?");) {
			stmt.setInt(1, filmId);

			try (ResultSet rs = stmt.executeQuery();) {

				while (rs.next()) {
					filmResult = new Film();
					filmResult.setId(rs.getInt("id"));
					filmResult.setTitle(rs.getString("title"));
					filmResult.setDescription(rs.getString("description"));
					filmResult.setReleaseYear(rs.getInt("release_year"));
					filmResult.setLanguageId(rs.getInt("language_id"));
					filmResult.setRentalDuration(rs.getInt("rental_duration"));
					filmResult.setRentalRate(rs.getDouble("rental_rate"));
					filmResult.setLength(rs.getInt("length"));
					filmResult.setReplacementCost(rs.getDouble("replacement_cost"));
					filmResult.setRating(rs.getString("rating"));
					filmResult.setSpecialFeatures(rs.getString("special_features"));
					filmResult.setLanguage(rs.getString("name"));
					filmResult.setFilmCategory(rs.getString("categoryName"));
					filmResult.setConditionCount(findInventoryConditionCountByFilmId(filmResult.getId()));

				}
			}
		}

		catch (SQLException e) {
			System.err.println(e);
		}

		if (filmResult != null) {
			filmResult.setCast(findActorsByFilmId(filmId));
		}

		return filmResult;
	}

	@Override
	public Actor findActorById(int actorId) {
		Film filmResult = null;
		Actor actorResult = null;
		List<Film> films = new ArrayList<>();

		// automatically closes connections
		try (Connection conn = DriverManager.getConnection(URL, userPass, userPass);
				PreparedStatement stmt = conn.prepareStatement("SELECT actor.* " + "FROM actor where actor.id = ?");) {
			stmt.setInt(1, actorId);

			try (ResultSet rs = stmt.executeQuery();) {

				while (rs.next()) {
					actorResult = new Actor();

					actorResult.setId(rs.getInt("id"));
					actorResult.setFirstName(rs.getString("first_name"));
					actorResult.setLastName(rs.getString("last_name"));
				}
			}
		} catch (SQLException e) {
			System.err.println(e);
		}

		if (actorResult != null) {
			actorResult.setFilms(findFilmsbyActorId(actorId));
		}

		return actorResult;
	}

	@Override
	public List<Actor> findActorsByFilmId(int filmId) {
		Actor actorResult = null;
		List<Actor> actorsByFilmId = new ArrayList<>();

		// automatically closes connections
		try (Connection conn = DriverManager.getConnection(URL, userPass, userPass);
				PreparedStatement stmt = conn.prepareStatement(
						"SELECT actor.* FROM actor inner join film_actor fa on fa.actor_id = actor.id where fa.film_id = ?");) {
			stmt.setInt(1, filmId);

			try (ResultSet rs = stmt.executeQuery();) {

				while (rs.next()) {
					actorResult = new Actor();
					actorResult.setId(rs.getInt("id"));
					actorResult.setFirstName(rs.getString("first_name"));
					actorResult.setLastName(rs.getString("last_name"));

					actorsByFilmId.add(actorResult);
				}
			}
		} catch (SQLException e) {
			System.err.println(e);
		}

		return actorsByFilmId;
	}

	@Override
	public List<Film> findFilmsbyActorId(int actorID) {
		Film filmResult = null;
		List<Film> filmsByActorsList = new ArrayList<>();

		// automatically closes connections
		try (Connection conn = DriverManager.getConnection(URL, userPass, userPass);
				PreparedStatement stmt = conn
						.prepareStatement("SELECT film.*, location.name, category.name as categoryname" + "from film "
								+ "inner join location on location.id = film.location_id "
								+ "inner join film_actor fa on fa.film_id = film.id"
								+ "inner join actor on actor.id = fa.actor_id"
								+ "inner join film_category fc on fc.film_id = film.id "
								+ "inner join category on category.id = fc.category_id " + "where actor.id = ?");) {
			stmt.setInt(1, actorID);

			try (ResultSet rs = stmt.executeQuery();) {

				while (rs.next()) {
					filmResult = new Film();
					filmResult = new Film();
					filmResult.setId(rs.getInt("id"));
					filmResult.setTitle(rs.getString("title"));
					filmResult.setDescription(rs.getString("description"));
					filmResult.setReleaseYear(rs.getInt("release_year"));
					filmResult.setLanguageId(rs.getInt("language_id"));
					filmResult.setRentalDuration(rs.getInt("rental_duration"));
					filmResult.setRentalRate(rs.getDouble("rental_rate"));
					filmResult.setLength(rs.getInt("length"));
					filmResult.setReplacementCost(rs.getDouble("replacement_cost"));
					filmResult.setRating(rs.getString("rating"));
					filmResult.setSpecialFeatures(rs.getString("special_features"));
					filmResult.setLanguage(rs.getString("name"));
					filmResult.setFilmCategory(rs.getString("categoryname"));
					filmResult.setConditionCount(findInventoryConditionCountByFilmId(filmResult.getId()));

					filmsByActorsList.add(filmResult);
				}
			}
		} catch (SQLException e) {
			System.err.println(e);
		}

		return filmsByActorsList;
	}

	@Override
	public List<Film> findFilmsByKeyword(String keyword) {
		Film filmResult = null;
		Actor actorResult = null;
		List<Actor> cast = null;
		List<Film> films = new ArrayList<>();

		// automatically closes connections
		try (Connection conn = DriverManager.getConnection(URL, userPass, userPass);
				PreparedStatement stmt = conn
						.prepareStatement("SELECT film.*, language.name, category.name as categoryName " + "from film "
								+ "inner join language on film.language_id = language.id "
								+ "inner join film_category fc on fc.film_id = film.id "
								+ "inner join category on category.id = fc.category_id "
								+ "where film.title like ? or film.description like ?");) {
			stmt.setString(1, "%" + keyword + "%");
			stmt.setString(2, "%" + keyword + "%");

			try (ResultSet rs = stmt.executeQuery();) {

				while (rs.next()) {
					filmResult = new Film();
					filmResult.setId(rs.getInt("id"));
					filmResult.setTitle(rs.getString("title"));
					filmResult.setDescription(rs.getString("description"));
					filmResult.setReleaseYear(rs.getInt("release_year"));
					filmResult.setLanguageId(rs.getInt("language_id"));
					filmResult.setRentalDuration(rs.getInt("rental_duration"));
					filmResult.setRentalRate(rs.getDouble("rental_rate"));
					filmResult.setLength(rs.getInt("length"));
					filmResult.setReplacementCost(rs.getDouble("replacement_cost"));
					filmResult.setRating(rs.getString("rating"));
					filmResult.setSpecialFeatures(rs.getString("special_features"));
					filmResult.setLanguage(rs.getString("name"));
					filmResult.setFilmCategory(rs.getString("categoryname"));
					filmResult.setConditionCount(findInventoryConditionCountByFilmId(filmResult.getId()));

					films.add(filmResult);
				}
			}
		}

		catch (SQLException e) {
			System.err.println(e);
		}

		// get list of actors for any matching film
		for (int i = 0; i < films.size(); i++) {
			cast = new ArrayList<>();

			// add cast of actors for each film, to that film
			films.get(i).setCast(findActorsByFilmId(films.get(i).getId()));
			cast = null;
		}

		return films;
	}

	@Override
	public Map<String, Integer> findInventoryConditionCountByFilmId(int filmId) {
		Map<String, Integer> conditionCount = new HashMap<>();

		// automatically closes connections
		try (Connection conn = DriverManager.getConnection(URL, userPass, userPass);
				PreparedStatement stmt = conn.prepareStatement(
						"Select coalesce(i.media_condition, NULL, 'Unknown') as ItemCondition, count(IFNULL(i.media_condition, 1)) as NumInInventoryPerMediaCondition from film inner join language on film.language_id = language.id inner join film_category fc on fc.film_id = film.id inner join category on category.id = fc.category_id inner join inventory_item i on i.film_id = film.id where film.id = ? group by i.media_condition");) {
			stmt.setInt(1, filmId);

			try (ResultSet rs = stmt.executeQuery();) {

				while (rs.next()) {
					conditionCount.put(rs.getString("ItemCondition"), rs.getInt("NumInInventoryPerMediaCondition"));
				}
			}
		}

		catch (SQLException e) {
			System.err.println(e);
		}

		return conditionCount;

	}

	@Override
	public Film createFilm(Film f) {
		// ONLY CREATES FILM OBJECT, SO FIND BY ID WON'T WORK
		// LATER ADD FILM-CATEGORY, FILM_ACTOR, INVENTORY_ITEM
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		try {
			conn = DriverManager.getConnection(URL, userPass, userPass);
			conn.setAutoCommit(false); // start transaction
			stmt = conn.prepareStatement(
					"insert into film (title, description, release_year, language_id, rental_duration, rental_rate, length, replacement_cost, rating, special_features)"
							+ " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
					Statement.RETURN_GENERATED_KEYS);

			stmt.setString(1, f.getTitle());
			stmt.setString(2, f.getDescription());
			stmt.setInt(3, f.getReleaseYear());
			stmt.setInt(4, f.getLanguageId());
			stmt.setDouble(5, f.getRentalDuration());
			stmt.setDouble(6, f.getRentalRate());
			stmt.setInt(7, f.getLength());
			stmt.setDouble(8, f.getReplacementCost());
			stmt.setString(9, f.getRating());
			stmt.setString(10, f.getSpecialFeatures());

			int rowsCreated = stmt.executeUpdate();

			if (rowsCreated == 1) {
				rs = stmt.getGeneratedKeys();
				if (rs.next()) {
					int newFilmId = rs.getInt(1); // get the id of the film created
					f.setId(newFilmId); // set the new film id to the new film object to match the DB

//					//set film_category
//					stmt = conn.prepareStatement("insert into film_category (film_id, category_id) "
//							+ " values (?, ?)", Statement.RETURN_GENERATED_KEYS);
//					
//					stmt.setInt(1, newFilmId);
//					stmt.setInt(2, 7); //picked category_id 7
//					
//					rowsCreated = stmt.executeUpdate();
//					
//					if(rowsCreated == 1) {
//						
//					}
				}
			} else {
				f = null;
			}

			// commit transaction
			conn.commit();

			// close connections
			conn.close();
			stmt.close();
			rs.close();

		} catch (SQLException sqle) {
			sqle.printStackTrace();

			// if error, rollback transaction
			if (conn != null) {
				try {
					conn.rollback();
				} catch (SQLException sqle2) {
					System.err.println("\nError rolling back...\n");
				}
			}
			throw new RuntimeException("Error inserting film " + f);
		}

		return f;
	}

	@Override
	public boolean deleteFilm(Film f) {
		// ONLY DELETES FILM OBJECT,
		// LATER DELETE FILM-CATEGORY, FILM_ACTOR, INVENTORY_ITEM
		Connection conn = null;
		PreparedStatement stmt = null;

		try {
			conn = DriverManager.getConnection(URL, userPass, userPass);
			conn.setAutoCommit(false); // START TRANSACTION
			stmt = conn.prepareStatement("DELETE from film WHERE id = ?");

			stmt.setInt(1, f.getId());

			int rowsUpdated = stmt.executeUpdate();

			// commit transaction
			conn.commit();

			// close connections
			conn.close();
			stmt.close();

		} catch (SQLException sqle) {
			sqle.printStackTrace();

			// if error, rollback transaction
			if (conn != null) {
				try {
					conn.rollback();
				} catch (SQLException sqle2) {
					System.err.println("\nError rolling back...\n");
				}
			}
			return false;
		}
		return true;
	}

	@Override
	public boolean updateFilm(Film f) {
		// ONLY UPDATES FILM OBJECT,
		// LATER UPDATE FILM-CATEGORY, FILM_ACTOR, INVENTORY_ITEM
		Connection conn = null;
		PreparedStatement stmt = null;

		try {
			conn = DriverManager.getConnection(URL, userPass, userPass);
			conn.setAutoCommit(false); // START TRANSACTION
			stmt = conn.prepareStatement(
					"UPDATE film SET title = ?, description = ?, release_year = ?, language_id = ?, rental_duration = ?, rental_rate = ?, length = ?, replacement_cost = ?, rating = ?, special_features = ? "
							+ " WHERE id = ?");

			stmt.setString(1, f.getTitle());
			stmt.setString(2, f.getDescription());
			stmt.setInt(3, f.getReleaseYear());
			stmt.setInt(4, f.getLanguageId());
			stmt.setDouble(5, f.getRentalDuration());
			stmt.setDouble(6, f.getRentalRate());
			stmt.setInt(7, f.getLength());
			stmt.setDouble(8, f.getReplacementCost());
			stmt.setString(9, f.getRating());
			stmt.setString(10, f.getSpecialFeatures());
			stmt.setInt(11, f.getId());

			int rowsCreated = stmt.executeUpdate();

			// commit transaction
			conn.commit();

			// close connections
			conn.close();
			stmt.close();

		} catch (SQLException sqle) {
			sqle.printStackTrace();

			// if error, rollback transaction
			if (conn != null) {
				try {
					conn.rollback();
				} catch (SQLException sqle2) {
					System.err.println("\nError rolling back...\n");
				}
			}
			return false;
		}
		return true;
	}

}
