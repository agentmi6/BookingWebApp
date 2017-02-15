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
	
	
<link rel="stylesheet" href="<c:url value='/static/css/datepicker.css' />" ></link>		
	

<script type="text/javascript" src="<c:url value='/static/js/jquery-3.1.1.min.js' />"></script>

<script type="text/javascript" src="<c:url value='/static/js/bootstrap-datepicker.js' />"></script>




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

		<h3 class="pageHeader">Book a room from the layout</h3>

		<div class="col-md-12" style="margin: 20px 0 15px 0;">
				<h5 class="text-danger"> <span class="glyphicon glyphicon-info-sign"></span> Unavailable rooms = Booked!</h5>						
		</div>	
		
		<!--  room button layout -->
		
		<div class="col-md-12">		
			<div class="row">
				<div class="roomTable col-md-12 col-sm-12">
				<h4><span><img src="<c:url value='/static/images/single.png' />" width="40px" height="40px"></span> Single rooms</h4>		
					<c:forEach var="room" items="${rooms}">
						<c:choose>
							<c:when test="${room.roomType.roomTypeId==1}">
								<c:choose>
								<c:when test="${room.roomAvailable==true}">							
									<div class="col-md-2 col-sm-4 col-xs-5">
										<button id="${room.roomId}" data-price="${room.roomType.roomTypePrice}" class="btn btn-lg btn-default roomBtn">
											Room ${room.roomId}
										</button>
									</div>									
								</c:when>
															
								<c:otherwise>
									<div class="col-md-2 col-sm-4 col-xs-5">
										<button id="${room.roomId}"	class="btn btn-lg roomBtn btn-danger disabled" disabled="disabled">											
											Booked!
										</button>
									</div>
								</c:otherwise>	
								</c:choose>			
							</c:when>									
						</c:choose>
					</c:forEach>
				</div>
			</div>	
			</div>
			
				<hr class="col-md-12" />
				
			<div class="col-md-12">		
			<div class="row">	
				<div class="roomTable col-md-12 col-sm-12">
					<h4><span><img src="<c:url value='/static/images/double.png' />" width="40px" height="40px"></span> Double rooms</h4>		
					<c:forEach var="room" items="${rooms}">
						<c:choose>
							<c:when test="${room.roomType.roomTypeId==2}">
								<c:choose>
								<c:when test="${room.roomAvailable==true}">							
									<div class="col-md-2 col-sm-4 col-xs-5">
										<button id="${room.roomId}" data-price="${room.roomType.roomTypePrice}" class="btn btn-lg btn-default roomBtn">
											Room ${room.roomId}
										</button>
									</div>									
								</c:when>
															
								<c:otherwise>
									<div class="col-md-2 col-sm-4 col-xs-5">
										<button id="${room.roomId}" class="btn btn-lg roomBtn btn-danger disabled" disabled="disabled">
											Booked!
										</button>
									</div>
								</c:otherwise>	
								</c:choose>			
							</c:when>									
						</c:choose>
					</c:forEach>
				</div>	
			</div>
			</div>
			
				<hr class="col-md-12" />
				
			<div class="col-md-12">
				
			<div class="row">	
				<div class="roomTable col-md-12 col-sm-12">
					<h4><span><img src="<c:url value='/static/images/apartment.png' />" width="40px" height="40px"></span> Apartments</h4>		
					<c:forEach var="room" items="${rooms}">
						<c:choose>
							<c:when test="${room.roomType.roomTypeId==3}">
								<c:choose>
								<c:when test="${room.roomAvailable==true}">							
									<div class="col-md-2 col-sm-4 col-xs-5">
										<button id="${room.roomId}" data-price="${room.roomType.roomTypePrice}" class="btn btn-lg btn-default roomBtn">
											Room ${room.roomId}
										</button>
									</div>									
								</c:when>
															
								<c:otherwise>
									<div class="col-md-2 col-sm-4 col-xs-5">
										<button id="${room.roomId}"	class="btn btn-lg roomBtn btn-danger disabled" disabled="disabled">
										Booked!
										</button>
									</div>
								</c:otherwise>	
								</c:choose>			
							</c:when>									
						</c:choose>
					</c:forEach>
				</div>
			</div>
			</div>
			
			<div class="col-md-12" style="margin-top:30px;">			
				<form:form action="saveBooking" modelAttribute="booking" method="POST">
									
				
					<div class='col-sm-6'>
						<label for="dpd1">Check-in date</label> 
						<div class="form-group">
							<div class='input-group date'>
								<form:input path="checkInDate" id="dpd1" type='text' class="form-control" />
							 	<span
									class="input-group-addon"> <span class="glyphicon glyphicon-calendar"></span>
								</span>
							</div>
							<form:errors path="checkInDate" class="text-danger"></form:errors>							
						</div>
					</div>
					
					<div class='col-sm-6'>
						<label for="dpd2">Check-out date</label> 
						<div class="form-group">
							<div class='input-group date'>
								<form:input path="checkOutDate" id="dpd2" type='text' class="form-control" /> <span
									class="input-group-addon"> <span class="glyphicon glyphicon-calendar"></span>																	
								</span>
							</div>
							<form:errors path="checkOutDate" class="text-danger"></form:errors>														
						</div>
					</div>									
									
																		
				<!--  readonly input for booked room -->

					<div class="form-group col-md-8">
						<label for="roomNumber">Booked room #</label>
						<form:input type="text" path="room.roomId" id="roomNumber" class="form-control rNumber" readonly="true"/>
						<%-- <form:errors path="booking.room.roomId" class="text-danger"></form:errors> --%>
					</div>
					
						<!--  readonly input for room price -->

					<div class="form-group col-md-8">
						<label for="roomNumber">Room price</label>
						<form:input type="text" path="room.roomType.roomTypePrice" id="roomPrice" class="form-control rNumber" readonly="true"/>
					</div>


					<!-- booking to be made by the current logged in user ...-->
					
					<div class="form-group col-md-8 userInput">
						<label for="currentUser">Booking with username:</label>
						<form:input type="text" path="user.id" id="currentUser" class="form-control" readonly="true" value="${currentUserId}"/>
					</div>				
								
					<div class="col-md-10 col-xs-10 bookBtns">
						<button type="submit" class="btn btn-primary" style='margin-top:10px;'>Save</button>
					</div>
				</form:form>
				<div class="col-md-10 col-xs-10" style="margin-top:50px;">
					<p>
						<a href="${pageContext.request.contextPath}/booking/bookings">Back to List</a>
					</p>
				</div>							
			</div>			
	</div>

	<script type="text/javascript">
	 $(document).ready(function(){
		 
	 	$(function(){
	 		
	 		var nowTemp = new Date();
	 		var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);
	 		 
	 		var checkin = $('#dpd1').datepicker({
	 		  	format: 'dd-mm-yyyy',
	 			onRender: function(date) {
	 		    return date.valueOf() < now.valueOf() ? 'disabled' : '';
	 		  }
	 		}).on('changeDate', function(ev) {
	 		  if (ev.date.valueOf() > checkout.date.valueOf()) {
	 		    var newDate = new Date(ev.date)
	 		    newDate.setDate(newDate.getDate() + 1);
	 		    checkout.setValue(newDate);
	 		  }
	 		  checkin.hide();
	 		  $('#dpd2')[0].focus();
	 		}).data('datepicker');
	 		var checkout = $('#dpd2').datepicker({
	 			format: 'dd-mm-yyyy',
	 			onRender: function(date) {
	 		    return date.valueOf() <= checkin.date.valueOf() ? 'disabled' : '';
	 		  }
	 		}).on('changeDate', function(ev) {
	 		  checkout.hide();
	 		}).data('datepicker');
         	         	
		});	
		 
		 $(".roomBtn").on("click", function(){
			 	var $selected = $(this);
			    var roomID = $(this).attr("id");
			    var roomPrice = $(this).attr("class")
			    var room_price = $(this).attr("data-price");
			    /*var room_price = parseInt(($(this).attr('class').split(' ').pop()));*/
			    $(this).removeClass("btn-default").addClass("btn-warning disabled").attr("disabled",true).text("Room " + roomID);
			    $(".roomBtn").attr("disabled", true);
			    $("#roomNumber").attr("value",roomID);
			    $("#roomPrice").attr("value", room_price);
			    
			    var $reset = "<button type='button' class='btn btn-danger resetBtn' style='margin:10px 0px 0px 20px;'>Cancel</button>";
			    $(".bookBtns").append($reset);
		 		 
		 		$(".resetBtn").on("click", function(){		 		
			    	if($(".roomTable > div").find("button.btn-warning").length != 0){
			 			 $(".bookBtns").children(".resetBtn").remove();
			 			 $(".roomBtn").not(".btn-danger").removeClass("btn-warning disabled").addClass("btn-default").attr("disabled", false);
			 			 $("#roomNumber").attr("value",0);
						 $("#roomPrice").attr("value", 0);
			 		}			 		
		 		});		    			    		 		 		 
		 });				
     });
		
	</script>
</body>
</html>