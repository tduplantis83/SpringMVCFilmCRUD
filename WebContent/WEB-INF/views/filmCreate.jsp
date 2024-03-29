<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="forms.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<title>Create New Film</title>
</head>
<body style="background-color: lightgray">
	<div class="container">
		<div class="row">
			<div class="col-4"></div>
			<div class="col-4">
				<h1 style="color: red">Create a New Film</h1>
				<c:choose>
					<c:when test="${createStatus}">
						<h2>Film Creation Failed!</h2>
					</c:when>
				</c:choose>
				<div class="col-4"></div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-2"></div>
			<div class="col-8">
				<form:form action="filmCreate.do" method="POST">
					<div class="form-group">
						<label for="title">Title</label> <input type="text" name="title"
							class="form-control" placeholder="Title" required="required">
						<br> <label for="desc">Description</label> <input type="text"
							name="description" class="form-control" placeholder="Description"
							required="required"> <br> <label for="releaseYear">Release
							Year</label> <input type="text" name="releaseYear" class="form-control"
							placeholder="Release Year" required="required"> <br>
						<label for="languageId">Language Id</label> <select
							class="form-control" id="languageId" name="languageId" required="required">
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
							<option>5</option>
							<option>6</option>
						</select> <br> <label for="rentalDuration">Rental Duration</label> <input
							type="text" name="rentalDuration" class="form-control"
							placeholder="Rental Duration" required="required"> <br>
						<label for="rentalRate">Rental Rate</label> <input type="text"
							name="rentalRate" class="form-control" placeholder="Rental Rate"
							required="required"> <br> <label for="length">Length</label>

						<input type="text" name="length" class="form-control"
							placeholder="Length" required="required"> <br> <label
							for="replacementCost">Replacement Cost</label> <input type="text"
							name="replacementCost" class="form-control"
							placeholder="Replacement Cost" required="required"> <br>
						<label for="rating">Rating</label> <select
							class="form-control" id="rating" name="rating" required="required">
							<option>G</option>
							<option>PG</option>
							<option>PG13</option>
							<option>R</option>
							<option>NC17</option>
						</select> <br> <label
							for="specialFeatures">Special Features</label> <select multiple
							class="form-control" id="specialFeatures" name="specialFeatures"
							required="required">
							<option>Trailers</option>
							<option>Commentaries</option>
							<option>Deleted Scenes</option>
							<option>Behind the Scenes</option>
						</select>
					</div>
					<button type="submit" class="btn btn-primary btn-block btn-lg">Create</button>
				</form:form>
				<div class="col-2"></div>
			</div>
		</div>
	</div>
	<br>
	<div class="container">
		<div class="row">
			<div class="col-2"></div>
			<div class="col-8">
				<form action="welcomePage.do" method="get">
					<button class="btn btn-success btn-block btn-lg">Back to
						Home</button>
				</form>
			</div>
			<div class="col-2"></div>
		</div>
	</div>
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