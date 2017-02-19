<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Review</title>

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
		
<script type="text/javascript" src="<c:url value='/static/js/jquery-3.1.1.min.js' />"></script>


<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
	
<link href="<c:url value='/static/css/style.css' />" rel="stylesheet"></link>	

</head>
<body>	


<jsp:include page="../fragments/header.jsp"></jsp:include>

	<div class="container pageContent">
		<div class="row">
		
			<div class="pageHeader">
				<h3>Add Review and rating</h3>
			</div>
			
			
			
			<c:choose>
				<c:when test="${empty reviews}">
				
					<div class="col-md-10 well">
						<form:form action="saveReview" modelAttribute="review" method="POST">
						
							<form:hidden path="reviewId" />

							<div class="form-group col-md-12">						
								<form:textarea rows="5" path="reviewContent" id="reviewContent" maxlength="200"	class="form-control" placeholder="Enter your review"></form:textarea>
								<p style="font-weight: 600; margin-top:5px;" class="pull-right text-primary"><span class="charNum"></span> characters left</p>
								<form:errors path="reviewContent" class="text-danger"></form:errors>
							</div>

							<div class="form-group col-md-8">
								<label class="radio-inline"><form:radiobutton path="starRating" value="1"/>1</label>
								<label class="radio-inline"><form:radiobutton path="starRating" value="2"/>2</label>
								<label class="radio-inline"><form:radiobutton path="starRating" value="3"/>3</label>
								<label class="radio-inline"><form:radiobutton path="starRating" value="4"/>4</label>
								<label class="radio-inline"><form:radiobutton path="starRating" value="5"/>5</label>
								<form:errors path="starRating" class="text-danger col-md-10 errorRadio"></form:errors>						
							</div>
					
							<!-- review by the current logged in user -->
					
							<div class="form-group col-md-8 userInput">
								<label for="currentUser">Booking with username:</label>
								<form:input type="text" path="user.id" id="currentUser" class="form-control" readonly="true" value="${currentUserId}"/>
							</div>	


							<div class="col-md-10">
								<button type="submit" class="btn btn-primary" style="margin-top: 10px;">Save</button>
							</div>
						</form:form>
					</div>
		
				</c:when>	
				
				<c:otherwise>
					<div class="noItems well">
						<h2 style="margin-bottom:30px;" class="text-center">Thanks for adding your review.</h2>
						
						<h4>Check other reviews below</h4>						
						<a href="${pageContext.request.contextPath}/review/reviews" class="btn btn-primary addBtn">Reviews</a>
					</div>
				</c:otherwise>		
			</c:choose>										
		</div>
	</div>

<jsp:include page="../fragments/footer.jsp"></jsp:include>

<script type="text/javascript" src="<c:url value='/static/js/reviewJS.js'/>"></script>

</body>
</html>