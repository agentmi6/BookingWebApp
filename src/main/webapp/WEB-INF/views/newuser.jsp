<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<html>
 
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>User Registration Form</title>
    
    
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

		<h1>New User Registration Form</h1>

		<form:form method="POST" modelAttribute="user" class="form-horizontal">

			<div class="form-group col-md-8">
				<label for="firstName">First Name</label>
				<form:input type="text" path="firstName" id="firstName"	class="form-control input-sm" />
				<div class="has-error">
					<form:errors path="firstName" class="help-inline text-danger" />
				</div>
			</div>

			<div class="form-group col-md-8">
				<label for="lastName">Last Name</label>
				<form:input type="text" path="lastName" id="lastName" class="form-control input-sm" />
				<div class="has-error">
					<form:errors path="lastName" class="help-inline text-danger" />
				</div>
			</div>

			<div class="form-group col-md-8">
				<label for="ssoId">SSO ID</label>
				<form:input type="text" path="ssoId" id="ssoId"	class="form-control input-sm" />
				<div class="has-error">
					<form:errors path="ssoId" class="help-inline text-danger" />
					<c:choose>
						<c:when test="${exception != null}">
							<span class="help-inline text-danger">${checkUserName}</span>
						</c:when>
					</c:choose>
				</div>
			</div>

			<div class="form-group col-md-8">
				<label for="password">Password</label>
				<form:input type="password" path="password" id="password" class="form-control input-sm" />
				<div class="has-error">
					<form:errors path="password" class="help-inline text-danger" />
				</div>
			</div>

			<div class="form-group col-md-8">
				<label for="email">Email</label>
				<form:input type="email" path="email" id="email" class="form-control input-sm" />
				<div class="has-error">
					<form:errors path="email" class="help-inline text-danger" />
				</div>
			</div>

		<%-- 	<div class="form-group col-md-8">
				<label for="userProfiles">Roles</label>
				<form:select path="userProfiles" items="${roles}" multiple="true"
					itemValue="id" itemLabel="type" class="form-control input-sm" />
				<div class="has-error">
					<form:errors path="userProfiles" class="help-inline text-danger" />
				</div>
			</div> --%>

			<div class="row col-md-12">
				<div class="form-actions floatRight">
					<input type="submit" value="Register"
						class="btn btn-primary btn-sm"> or <a
						href="<c:url value='/' />">Cancel</a>
				</div>
			</div>
		</form:form>
		
	</div>

	<jsp:include page="footer.jsp"></jsp:include>
    
</body>
</html>