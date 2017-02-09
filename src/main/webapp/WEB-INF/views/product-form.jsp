<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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

<jsp:include page="header.jsp"></jsp:include>


	<div class="container pageContent">

		<h3 class="pageHeader">Add new product</h3>
		
		<div class="col-md-10">
			<form:form action="saveProduct" modelAttribute="product"
				method="POST">

				<form:hidden path="productId" />

				<div class="form-group col-md-8">
					<label for="productName">Product Name</label>
					<form:input type="text" path="productName" id="productName"
						class="form-control" placeholder="Enter product name" />
					<form:errors path="productName" class="text-danger"></form:errors>
				</div>

				<div class="form-group col-md-8">
					<label for="productSN">Product Serial Number</label>
					<form:input type="text" path="productSN" id="productSN"
						class="form-control" placeholder="Enter product serial number" />
					<form:errors path="productSN" class="text-danger"></form:errors>

				</div>

				<div class="form-group col-md-8" hidden="true">
					<label for="productUser">Created by</label>
					<form:input type="text" path="user.id" id="productUser"
						class="form-control" value="${currentUserId}" />
				</div>


				<div class="col-md-10">
					<button type="submit" class="btn btn-primary" style="margin-top: 10px;">Save</button>
				</div>
			</form:form>
		</div>
	</div>


</body>
</html>