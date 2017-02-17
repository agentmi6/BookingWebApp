<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bookings</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">

<script type="text/javascript"
	src="<c:url value='/static/js/jquery-3.1.1.min.js' />"></script>

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
	
<link href="<c:url value='/static/css/style.css' />" rel="stylesheet"></link>	

</head>
<body>	

	<jsp:include page="../fragments/header.jsp" />

<div class="container pageContent">
	<h3 class="pageHeader">Bookings by <span class="bg-success">${currentUser}</span></h3>
	<br />
	
	<div class="row">

	<c:choose>
		<c:when test="${not empty bookings}">
		<a href="${pageContext.request.contextPath}/booking/addBooking" class="btn btn-primary addBtn">Book a room</a>
		<br />
			<table class="table">
				<thead>
					<tr>
						<th>User</th>
						<th>Check-in date</th>
						<th>Check-out date</th>
						<th>Room Type</th>
						<th>Room #</th>
						<th>Room Price</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="booking" items="${bookings}">
						<tr>
							<td>${booking.user.username}</td>
							<td>
								<fmt:formatDate type="date" pattern="dd-MMM-yyyy" value="${booking.checkInDate}" />
							</td>							
							<td>
								<fmt:formatDate type="date" pattern="dd-MMM-yyyy" value="${booking.checkOutDate}" />								
							</td>
							<td>${booking.room.roomType.roomTypeName}</td>
							<td>${booking.room.roomId}</td>
							<td>${booking.room.roomType.roomTypePrice}</td>
							<td>
								<c:url var="delete" value="/booking/delete">
									<c:param name="bookingId" value="${booking.bookingId}" />
								</c:url>
																
								<a class="actionLinks" href="${delete}"	onclick="if (!(confirm('Are you sure you want to delete this booking?'))) return false">
									<span class="glyphicon glyphicon-trash"></span>
								</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</c:when>
		<c:otherwise>
			<div class="noItems well">
				<h2 class="text-center">You have no bookings at the moment...</h2>
				<a href="${pageContext.request.contextPath}/booking/addBooking" class="btn btn-primary addBtn" >Book now?</a>					
			</div>
		</c:otherwise>						
	</c:choose>
	
</div>
</div>

	<jsp:include page="../fragments/footer.jsp" />

</body>
</html>