package com.skilldistillery.film.entities;

import java.util.*;

public class Actor {
	private int id;
	private String firstName;
	private String lastName;
	private List<Film> films = new ArrayList<>();

	public Actor() {

	}

	public Actor(int id, String firstName, String lastName, List<Film> films) {
		super();
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.films = films;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public List<Film> getFilms() {
		return films;
	}

	public void setFilms(List<Film> films) {
		this.films = films;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((firstName == null) ? 0 : firstName.hashCode());
		result = prime * result + id;
		result = prime * result + ((lastName == null) ? 0 : lastName.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Actor other = (Actor) obj;
		if (firstName == null) {
			if (other.firstName != null)
				return false;
		} else if (!firstName.equals(other.firstName))
			return false;
		if (id != other.id)
			return false;
		if (lastName == null) {
			if (other.lastName != null)
				return false;
		} else if (!lastName.equals(other.lastName))
			return false;
		return true;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("First Name: \t");
		builder.append(getFirstName());
		builder.append("\nLast Name: \t");
		builder.append(getLastName());
		builder.append("\nFilms Starring this Actor: ");
		for (Film film : films) {
			builder.append("\n" + film.getTitle());
		}
		return builder.toString();
	}

}
