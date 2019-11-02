<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<title>Film Results</title>
</head>
<body>
	<c:choose>
		<c:when test="${fn: length(film) gt 0}">
			<div class="table-responsive">
				<table class="table table-striped table-bordered table-hover text-align: center">
					<thead class="table-dark text-center">
						<tr>
							<td><strong>Film ID</strong></td>
							<td><strong>Title</strong></td>
							<td><strong>Release Year</strong></td>
							<td><strong>Language</strong></td>
							<td><strong>Rental Duration</strong></td>
							<td><strong>Rental Rate</strong></td>
							<td><strong>Length</strong></td>
							<td><strong>Replacement Cost</strong></td>
							<td><strong>Rating</strong></td>
							<td><strong>Special Features</strong></td>
							<td><strong>Category</strong></td>
							<td><strong>Description</strong></td>
						</tr>
					</thead>
					<c:forEach var="f" items="${film}">
						<tbody>
							<tr>
								<td>${f.getId()}</td>
								<td>${f.getTitle()}</td>
								<td>${f.getReleaseYear()}</td>
								<td>${f.getLanguage()}</td>
								<td>${f.getRentalDuration()}</td>
								<td><fmt:formatNumber value="${f.getRentalRate()}" type = "currency"/></td>
								<td>${f.getLength()}</td>
								<td><fmt:formatNumber value="${f.getReplacementCost()}" type="currency"/></td>
								<td>${f.getRating()}</td>
								<td>${f.getSpecialFeatures()}</td>
								<td>${f.getFilmCategory()}</td>
								<td colspan="4">${f.getDescription()}</td>
							</tr>
						</tbody>
					</c:forEach>
				</table>
			</div>
			<%-- <table>
					<thead>
						<tr>
							<td><strong>Cast First Name</strong></td>
							<td><strong>Cast Last Name</strong></td>
							<td><strong>Condition</strong></td>
							<td><strong>Number In Inventory</strong></td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<c:forEach var="c" items="${f.getCast()}">
								<td>${c.getFirstName()}</td>
							</c:forEach>
							<c:forEach var="c" items="${f.getCast()}">
								<td>${c.getLastName()}</td>
							</c:forEach>
						</tr>
						<tr>
							<c:forEach var="cond" items="${f.getConditionCount()}">
								<td>${cond.key}</td>
							</c:forEach>
						</tr>
						<tr>
							<c:forEach var="inv" items="${f.getConditionCount()}">
								<td>${inv.value}</td>
							</c:forEach>
						</tr>
					</tbody>
				</table> --%>

		</c:when>
		<c:otherwise>
			<h2>No Matching Film</h2>
		</c:otherwise>

	</c:choose>

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