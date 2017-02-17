<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Reviews</title>
        
    <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

	<script type="text/javascript" src="<c:url value='/static/js/jquery-3.1.1.min.js' />"></script>

	<!-- Latest compiled and minified JavaScript -->
	<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
			integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
			crossorigin="anonymous">
	</script>

	<link href="<c:url value='/static/css/style.css' />" rel="stylesheet"></link>
</head>
<body>

<jsp:include page="../fragments/header.jsp"></jsp:include>

	<div class="container pageContent">
		<div class="row">
			<h3 class="pageHeader">Reviews</h3>
			
			<c:choose>
				<c:when test="${not empty reviews}">				
					<div class="col-md-12">			
						<c:forEach var="review" items="${reviews}">
							<div class="col-md-12 review">
								<div class="panel panel-primary">
									<div class="panel-heading">							
										<span>
											<span class="glyphicon glyphicon-user pull-left"></span>														
								 			<span style="margin-left:5px;"> ${review.user.firstName} ${review.user.lastName}</span>	
										</span>							 								
										<span class="pull-right">
											<i class="glyphicon glyphicon-time"></i>
											<span>
												<fmt:formatDate type="date" pattern="dd MMM, yyyy" value="${review.dateCreated}" />
											</span>	
										</span>	
									</div>
									<div class="panel-footer">
										<p class="reviewContent">
											${review.reviewContent}
										</p>
										<span class="starRating">
											<c:forEach begin="1" end="${review.starRating }" varStatus="rating">
												<span class="glyphicon glyphicon-star"></span>
											</c:forEach>
										</span>
									</div>
								</div>
							</div>
						</c:forEach>								
					</div>				
				</c:when>
				<c:otherwise>
					<div class="noItems well">
						<h2 style="margin-bottom:30px;" class="text-center">No reviews so far.</h2>
						
						<h4>Be the first one to add a review</h4>						
						<a href="${pageContext.request.contextPath}/r/addReview" class="btn btn-primary addBtn">Add your review</a>
					</div>
				</c:otherwise>
			</c:choose>
			
			
		</div>	
	</div>

<jsp:include page="../fragments/footer.jsp"></jsp:include>


</body>
</html>



