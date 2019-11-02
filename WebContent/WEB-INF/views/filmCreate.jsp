<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<title>Create New Film</title>
</head>
<body>
			
<form:form action="filmCreate.do" method="POST">
  <div class="form-group">
    <label for="title">Title</label>
    <input type="text" name="title" class="form-control" placeholder="Title">
 	<br>
    <label for="desc">Description</label>
    <input type="text" name="description" class="form-control" placeholder="Description">
 	<br>
    <label for="releaseYear">Release Year</label>
    <input type="text" name="releaseYear" class="form-control" placeholder="Release Year">
 	<br>
    <label for="languageId">Language ID (1-6)</label>
    <input type="text" name="languageId" class="form-control" placeholder="Language ID Number (1-6)">
 	<br>
    <label for="rentalDuration">Rental Duration</label>
    <input type="text" name="rentalDuration" class="form-control" placeholder="Rental Duration">
 	<br>
    <label for="rentalRate">Rental Rate</label>
    <input type="text" name="rentalRate" class="form-control" placeholder="Rental Rate">
 	<br>
    <label for="length">Length</label>
    <input type="text" name="length" class="form-control" placeholder="Length">
 	<br>
    <label for="replacementCost">Replacement Cost</label>
    <input type="text" name="replacementCost" class="form-control" placeholder="Replacement Cost">
 	<br>
    <label for="rating">Rating</label>
    <input type="text" name="rating" class="form-control" placeholder="Rating">
 	<br>
    <label for="specialFeatures">Special Features</label>
    <input type="text" name="specialFeatures" class="form-control" placeholder="Special Features">
  </div>
  <button type="submit" class="btn btn-primary">Create</button>
</form:form>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
</body>
</html>