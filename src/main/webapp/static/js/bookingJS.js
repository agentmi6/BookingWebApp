$(document).ready(function(){
	
	//======== Datepicker ========//
	
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
		 
	//======== BOOKING RESET ========//

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