<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login page</title>

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
		<div class="row">
			<div class="well">		
			<div class="row">
			<h3 class="text-center">Login to book a room</h3>
				<div class="loginForm col-md-4 col-md-offset-4">
					<c:url var="loginUrl" value="/login" />
					<form:form action="${loginUrl}" method="post" modelAttribute="user" class="form-horizontal">
						<c:if test="${param.error != null}">
							<div class="alert alert-danger">
								<p>Invalid username and password.</p>
							</div>
						</c:if>
					
						<c:if test="${param.logout != null}">
							<div class="alert alert-success">
								<p>You have been logged out successfully.</p>
							</div>	
						</c:if>
					
						<div class="input-group input-sm">
							<label class="input-group-addon glyphsBg" for="username1">
								<span class="glyphicon glyphicon-user"></span>
							</label> 
							<form:input type="text" class="form-control" id="username1" path="username" placeholder="Enter Username" required="true"></form:input>
						</div>
					
						<div class="input-group input-sm">
							<label class="input-group-addon glyphsBg" for="password">
								<span class="glyphicon glyphicon-lock"></span>
							</label> 
							<form:input type="password"	class="form-control" id="password" path="password" placeholder="Enter Password" required="true"></form:input>
						</div>
					
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		
						<div class="form-actions">
							<input type="submit" class="btn btn-lg btn-block btn-primary" value="Log in" />
							<p class="newAccount"><a href="${pageContext.request.contextPath}/newUser">Sign up for account</a></p>
						</div>						
					</form:form>
				</div>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="../fragments/footer.jsp" />	

</body>
</html>