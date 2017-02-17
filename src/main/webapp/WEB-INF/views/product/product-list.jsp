<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome page</title>

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
		<h3 class="pageHeader">Products by <span class="bg-success">${currentUser}</span></h3>
		<br />
	<a href="${pageContext.request.contextPath}/p/addProduct" class="btn btn-primary addBtn">Add product</a>
	<br />
		<table class="table">
			<thead>
				<tr>
					<th>product name</th>
					<th>product sn</th>
					<th>product user</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="product" items="${products}">
					<c:choose>
						<c:when test="${product.user.id == currentUserId}">
							<tr>
								<td>${product.productName}</td>
								<td>${product.productSN}</td>
								<td>${product.user.firstName}</td>
								<td>
									<c:url var="delete" value="/p/delete">
										<c:param name="productId" value="${product.productId}" />
									</c:url>
									
									<c:url var="update" value="/p/getProduct">
										<c:param name="productId" value="${product.productId}" />
									</c:url>
									
									<a class="actionLinks" href="${update}">
										<span class="glyphicon glyphicon-pencil"></span>										
									</a>						
									|									
									<a class="actionLinks" href="${delete}"	onclick="if (!(confirm('Are you sure you want to delete this product?'))) return false">
									<span class="glyphicon glyphicon-trash"></span>										
									</a>
								</td>
							</tr>
						</c:when>
					</c:choose>
				</c:forEach>
			</tbody>
		</table>

	</div>


	<jsp:include page="../fragments/footer.jsp" />
</body>
</html>