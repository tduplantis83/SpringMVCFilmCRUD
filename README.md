# Spring MVC FilmQuery Project

### Fourth week homework for Skill Distillery
Course Began: 9/9/19

Assigned: 11/1/19

Completed: 11/3/19


## Overview
This program is a paired programming project. The purpose of this program is to read data from an SQL database through java. The user is prompted with several bootstrap buttons to either search for a film from the database by film ID or keyword then given the option to add, update, and delete existing films.(Full CRUD) This is all on a dynamic frontend built from Spring MVC.

### DatabaseAccessorObject
This class declares the connection to the database, starts a transaction, and either commits or rollback the transaction based on if the CRUD was successful.

setUp(): method which is called in each of the filtering methods. The setUp() method logs into the database with the username and password so this code is not repeated.

findFilmByIdComplete():  This method returns every field from table film by the film ID.

findActorById(): This method returns the ID, first  name, and last name of the actor by actor ID.

findFilmsByActorId(): This method returns every field of the film table by actor ID.

findActorsByFilmId(): This method returns all actors from a list that played in a film, by film ID.

findFilmById(): This method returns the title, release year, rating, description, and language of a film by its ID.

findFilmByKeyWord(): This method returns a  list of films if the title or description matches the keyword entered by the user.

findInventoryConditionCountByFilmId(): This method returns the item condition and number of films per condition.

createFilm(): This method allows the user to add a film to the database using the INSERT SQL command, by entering each data field of a film.

deleteFilm(): This method allows the user to delete a film from the database using the Delete SQL command, by entering the ID of the film.

updateFilm(): This method allows the user to update an existing film in the database using the UPDATE SQL command, by entering each data field of a film.

### Controllers

There are controller methods for mapping each aspect of the program to their appropriate pages and methods.
The following are each page of the program:

filmCrate.jsp: filmCrate page displays a form for each of the films attributes. The user is required to enter all data in crating a film so the database does not have incomplete data. The film is then added to the database.

filmDelete.jsp: filmDelete removes a film from the database. Only films created by the user have the option to delete.

filmLookup.jsp: The filmLookup page contains buttons for findFilmById.jsp(Lookup By ID) findFilmByKeyWord.jsp(Lookup By keyword(s)) and a link to return to homepage.

filmLookupById.jsp: This page prompts the user to enter a film ID then displays that films data if it exists in the database.

filmLookupByKeyword.jsp: This page prompts the user to enter a keyword for displaying a list of films based on keyword searched through title and description.

filmResult.jsp: This page displays all information about a film in a table. If the film does not exist, a proper message will be displayed.

filmUpdate.jsp: filmUpdate allows the user to change any field they choose for a film.

home.jsp: The homepage contains two bootstrap buttons which map to filmLookup.jsp(Film Lookup) and filmCrate.jsp(Add a Film).
