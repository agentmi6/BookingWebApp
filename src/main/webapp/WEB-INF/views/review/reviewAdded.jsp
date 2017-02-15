<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>User Registration Form</title>
    
    
    <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">


<script type="text/javascript"
	src="<c:url value='/static/js/jquery-3.1.1.min.js' />"></script>

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>

<link href="<c:url value='/static/css/style.css' />" rel="stylesheet"></link>
    
    <!-- color code #225849 -->
</head>
<body>

<div class="modal fade in" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h3 class="modal-title text-center" id="myModalLabel" style="font-weight: 600;">Booking WebApp</h3>
				</div>
				<div class="modal-body">
					<h1 class="text-center" style="margin-top: 0px; margin-bottom: 0px; color: #eee9e9; font-weight: 900;">
						REVIEW ADDED!
					</h1>
				</div>
				<div class="modal-footer m-footer">
					<p style="text-align: left; display: inline-block;">
						<span>${currentUser.firstName}, Thank you for your feedback</span> 
					</p>
					<a href="${pageContext.request.contextPath}/r/reviews"
						class="btn btn-default pull-right" style="text-align: right;">Close</a>
				</div>
			</div>
		</div>
	</div>


	<script type="text/javascript">
       $(document).ready(function(){    	     		
         	$('#myModal').modal('show');    	
       });
	</script>
</body>
</html>