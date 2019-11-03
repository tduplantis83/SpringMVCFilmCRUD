<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="master.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<title>Film Lookup by ID</title>
</head>
<body>
	<h1>Film Lookup by ID</h1>

	<div class="container">
		<div class="row">
			<div class="col-3"></div>
			<div class="col-6">
				<form:form action="filmByID.do" method="GET">
					<div class="form-group">
						<label for="filmID">Film ID</label> <input type="text" name="id"
							class="form-control" placeholder="Enter FilmID">
					</div>
					<button type="submit" class="btn btn-primary btn-block btn-lg">Search</button>
				</form:form>
			</div>
			<div class="col-3"></div>
		</div>
		<div class="container">
			<br>
			<div class="row">
				<div class="col-3"></div>
				<div class="col-6">
					<form action="welcomePage.do" method="get">
						<button class="btn btn-success btn-block btn-lg">Back to
							Home</button>
					</form>
				</div>
				<div class="col-3"></div>
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