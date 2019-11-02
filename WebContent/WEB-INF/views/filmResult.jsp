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
							<td><strong>Cast Name</strong></td>
							<td><strong>Condition & Inv</strong></td>
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
								<td><c:forEach var="fn" items="${f.getCast() }">
									${fn.getFirstName()} ${fn.getLastName()},
								</c:forEach></td>
								<td><c:forEach var="cond" items="${f.conditionCount }">
									${cond.key}: ${cond.value }
								</c:forEach></td>

							</tr>
							<tr>
								<td colspan="3"><button type="button"
										class="btn btn-outline-info btn-block" data-toggle="modal"
										data-target="#filmCastModal">View Film Cast</button></td>
								<td colspan="3"><button type="button"
										class="btn btn-outline-info btn-block" data-toggle="modal"
										data-target="#conditionInventoryModal">View Film
										Condition & Inventory</button></td>
								<c:choose>
									<c:when test="${f.id > 1000 }">
										<td colspan="3"><form action="filmUpdate.do" method="get">
												<button class="btn btn-outline-warning btn-block">Update
													this Film</button>
												<input type="hidden" name="id" value="${f.id}">
											</form></td>
										<td colspan="3"><form action="filmDelete.do" method="get">
												<button class="btn btn-outline-danger btn-block">Delete
													this Film</button>
												<input type="hidden" name="id" value="${f.id}">
											</form></td>
									</c:when>
								</c:choose>
							</tr>
						</tbody>
					</c:forEach>
				</table>
			</div>

			<!--Accordion wrapper-->
			<div class="accordion md-accordion accordion-3 z-depth-1-half"
				id="accordionEx194" role="tablist" aria-multiselectable="true">

				<ul
					class="list-unstyled d-flex justify-content-center pt-5 red-text">
					<li><i class="fas fa-anchor mr-3 fa-2x" aria-hidden="true"></i></li>
					<li><i class="far fa-life-ring mr-3 fa-2x" aria-hidden="true"></i></li>
					<li><i class="far fa-star fa-2x" aria-hidden="true"></i></li>
				</ul>

				<hr class="mb-0">

				<!-- Accordion card -->
				<div class="card">

					<!-- Card header -->
					<div class="card-header" role="tab" id="heading4">
						<a data-toggle="collapse" data-parent="#accordionEx194"
							href="#collapse4" aria-expanded="true" aria-controls="collapse4">
							<h3 class="mb-0 mt-3 red-text">
								View Film Cast <i class="fas fa-angle-down rotate-icon fa-2x"></i>
							</h3>
						</a>
					</div>

					<!-- Card body -->
					<div id="collapse4" class="collapse show" role="tabpanel"
						aria-labelledby="heading4" data-parent="#accordionEx194">
						<div class="card-body pt-0">
							<p>
								<c:forEach var="f" items="${film}">
									<c:forEach var="c" items="${f.getCast()}">
										${c.getFirstName()} ${c.getLastName()},
									</c:forEach>
								</c:forEach>
							</p>
						</div>
					</div>
				</div>
				<!-- Accordion card -->

				<!-- Accordion card -->
				<div class="card">

					<!-- Card header -->
					<div class="card-header" role="tab" id="heading5">
						<a class="collapsed" data-toggle="collapse"
							data-parent="#accordionEx194" href="#collapse5"
							aria-expanded="false" aria-controls="collapse5">
							<h3 class="mb-0 mt-3 red-text">
								Condition & Number In Inventory <i
									class="fas fa-angle-down rotate-icon fa-2x"></i>
							</h3>
						</a>
					</div>

					<!-- Card body -->
					<div id="collapse5" class="collapse" role="tabpanel"
						aria-labelledby="heading5" data-parent="#accordionEx194">
						<div class="card-body pt-0">
							<p>
								<c:forEach var="f" items="${film}">
									<c:forEach var="cond" items="${f.getConditionCount()}">
										${cond.key} ${cond.value}
									</c:forEach>
								</c:forEach>
							</p>
						</div>
					</div>
				</div>
				<!-- Accordion card -->
			</div>
			<!--/.Accordion wrapper-->


			<%-- <div class="modal fade" id="conditionInventoryModal" tabindex="-1"
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
							</table> --%>
			<!-- 	</div> -->
			<!-- <div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
						</div>
					</div>
				</div>
			</div> -->
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
	<%-- <c:choose>
		<c:when test="${deleteStatus}">
			<h2>Film Delete Successful!</h2>
		</c:when>
	</c:choose> --%>

	<form action="welcomePage.do" method="get">
		<button class="btn btn-success">Back to Home</button>
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