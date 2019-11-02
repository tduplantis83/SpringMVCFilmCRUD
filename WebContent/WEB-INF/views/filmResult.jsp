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
			<div class="table-responsive">
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
								<td><fmt:formatNumber value="${f.getRentalRate()}"
										type="currency" /></td>
								<td>${f.getLength()}</td>
								<td><fmt:formatNumber value="${f.getReplacementCost()}"
										type="currency" /></td>
								<td>${f.getRating()}</td>
								<td>${f.getSpecialFeatures()}</td>
								<td>${f.getFilmCategory()}</td>
								<td>${f.getDescription()}</td>
							</tr>
							<tr>
								<td colspan="3"><button type="button"
										class="btn btn-outline-info btn-block" data-toggle="modal"
										data-target="#filmCastModal">View Film Cast</button></td>
								<td colspan="3"><button type="button"
										class="btn btn-outline-info btn-block" data-toggle="modal"
										data-target="#conditionInventoryModal">View Film
										Condition & Inventory</button></td>
								<td colspan="3"><a href="filmCreate.do">
										<button type="button"
											class="btn btn-outline-warning btn-block">Update
											this Film</button>
								</a></td>
								<td colspan="3"><a href="filmCreate.do">
										<button type="button" class="btn btn-outline-danger btn-block">Delete
											this Film</button>
								</a></td>
							</tr>
						</tbody>
					</c:forEach>
				</table>
			</div>



			<!-- Modal -->
			<div class="modal fade" id="filmCastModal" tabindex="-1"
				role="dialog" aria-labelledby="FilmCast" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="filmCastModal">Film Cast</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<table>
								<thead>
									<tr>
										<td><strong>First Name</strong></td>
										<td><strong>Last Name</strong></td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<%-- <c:forEach var="fn" items="cast">
											<td>${fn.getFirstName()}</td>
										</c:forEach>
										
										<c:forEach var="ln" items="cast">
											<td>${ln.getLastName()}</td>
										</c:forEach> --%>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>

			<!-- Modal -->
			<div class="modal fade" id="conditionInventoryModal" tabindex="-1"
				role="dialog" aria-labelledby="FilmCast" aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="conditionInventoryModal">Film
								Condition & Inventory</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<table>
								<thead>
									<tr>
										<td><strong>Condition</strong></td>
										<td><strong>Inventory</strong></td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<c:forEach var="fn" items="${f.getConditionCount()}">
											<td>${fn.key}</td>
										</c:forEach>

										<c:forEach var="ln" items="${f.getCast()}">
											<td>${ln.value()}</td>
										</c:forEach>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div>
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