<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to BookingWebApp</title>

<link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">

<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
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

	<!--  content -->
	<div class="container-fluid welcome">
		<div class="container">
			<div class="row">
				<div class="jumbotron">
					<div class="lead text-center">
						<h2 class="welcomeLead">Welcome to Booking WebApp</h2>
						<div class="lead">
							<p>Web application for hotel room booking, manage your bookings, adding review</p>
						</div>
					</div>
				</div>
			</div>
	 	</div>
	 </div>	
	 
	 <div class="container-fluid">
	 	<div class="container">
			<div class="row text-center">
				<c:choose>
					<c:when test="${pageContext.request.userPrincipal.name == null }">
						<div class="col-md-4 wElements">
							<i class="fa fa-user-plus fa-4x" aria-hidden="true"></i>						
							<h2>Accounts</h2>
							<p>To book a room you must be logged in, or sign up for a new account if you don`t have one</p>
							<p>
								<a href="${pageContext.request.contextPath}/login" class="btn btn-primary">Login</a>
								or  
								<a href="${pageContext.request.contextPath}/newUser">Register new account</a>
							</p>
						</div>				
					</c:when>
				</c:choose>
	
				<div class="col-md-3 wElements">
					<i class="fa fa-bed fa-4x" aria-hidden="true"></i>					
					<h2>Booking</h2>
					<p>Check our room layout and book a room</p>
					<p>
						<a href="${pageContext.request.contextPath}/booking/addBooking" class="btn btn-primary">Room Layout</a>
					</p>
				</div>

				<div class="col-md-3 wElements">
					<i class="fa fa-user-circle-o fa-4x" aria-hidden="true"></i>				
					<h2>Profile</h2>
					<p>Here you can manage your bookings(delete)</p>
					<p>
						<a href="${pageContext.request.contextPath}/booking/bookings" class="btn btn-primary">My Bookings</a>
					</p>
				</div>
				
				<c:choose>
					<c:when test="${pageContext.request.userPrincipal.name != null }">
						<div class="col-md-3 wElements">
							<i class="fa fa-pencil-square-o fa-4x" aria-hidden="true"></i>						
							<h2>Feedback</h2>
							<p>Did you like your stay with us or not? Give us a review below</p>
							<p>
								<a href="${pageContext.request.contextPath}/review/addReview" class="btn btn-primary">Review</a>							
							</p>
						</div>				
					</c:when>
				</c:choose>				
			</div>								
		</div>
		
			<sec:authorize access="hasRole('ADMIN')">
				<h3 style="margin-top:30px;">
					<span class="bg-success">If you see this, then you are an ADMIN</span>
				</h3>						
			</sec:authorize>		
	</div>

	<jsp:include page="../fragments/footer.jsp" />
		
</body>
</html>