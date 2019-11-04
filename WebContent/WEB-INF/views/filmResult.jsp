<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
			<c:forEach var="f" items="${film}">
				<div class="table-responsive tableFixHead">
					<table
						class="table table-striped table-bordered table-hover text-align: center">
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
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>${f.getId()}</td>
								<td>${f.getTitle()}</td>
								<td>${f.getReleaseYear()}</td>
								<td>${f.getLanguage()}</td>
								<td>${f.getRentalDuration()}</td>
								<td><fmt:formatNumber value="${f.getRentalRate()}"
										type="currency" /></td>
								<td>${f.getLength()}</td>
								<td><fmt:formatNumber value="${f.getReplacementCost()}"
										type="currency" /></td>
								<td>${f.getRating()}</td>
								<td>${f.getSpecialFeatures()}</td>
								<td>${f.getFilmCategory()}</td>
							</tr>
							<tr>
								<td colspan="2"><strong>Description: </strong></td>
								<td colspan="10">${f.getDescription()}</td>
							</tr>
							<tr>
								<td colspan="2"><strong>Cast: </strong></td>
								<td colspan="10"><c:forEach var="c" items="${f.getCast() }">
									${c.getFirstName()} ${c.getLastName()},
								</c:forEach></td>
							</tr>
							<tr>
								<td colspan="2"><strong>Condition & Inventory: </strong></td>
								<td colspan="10"><c:forEach var="cond"
										items="${f.getConditionCount() }">
									${cond.key}: ${cond.value},
								</c:forEach></td>
							</tr>
						</tbody>
						<tfoot>
							<tr>
								<c:choose>
									<c:when test="${f.id < 1001 }">
										<td colspan="5"></td>
										<td colspan="3"><form action="filmUpdate.do" method="get">
												<button class="btn btn-outline-warning btn-block btn-lg" disabled>Update
													this Film</button>
												<input type="hidden" name="id" value="${f.id}">
											</form></td>
										<td colspan="3"><form action="filmDelete.do" method="get">
												<button class="btn btn-outline-danger btn-block btn-lg" disabled>Delete
													this Film</button>
												<input type="hidden" name="id" value="${f.id}">
											</form></td>
									</c:when>
									<c:otherwise>
										<td colspan="5"></td>
										<td colspan="3"><form action="filmUpdate.do" method="get">
												<button class="btn btn-outline-warning btn-block btn-lg">Update
													this Film</button>
												<input type="hidden" name="id" value="${f.id}">
											</form></td>
										<td colspan="3"><form action="filmDelete.do" method="get">
												<button class="btn btn-outline-danger btn-block btn-lg">Delete
													this Film</button>
												<input type="hidden" name="id" value="${f.id}">
											</form></td>
									</c:otherwise>
								</c:choose>
							</tr>
						</tfoot>
					</table>
				</div>
				<br>
			</c:forEach>
		</c:when>
		<c:when test="${deleteStatus}">
			<h2>Film Delete Successful!</h2>
		</c:when>
		<c:otherwise>
			<h2>No Matching Film Found</h2>
		</c:otherwise>
	</c:choose>

	<c:choose>
		<c:when test="${updateStatus}">
			<h2>Film Update Successful!</h2>
		</c:when>
	</c:choose>

	<form action="welcomePage.do" method="get">
		<button class="btn btn-success btn-lg">Back to Home</button>
	</form>

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