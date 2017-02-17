$(function(){
		var inputTextArea = $("#reviewContent");
		
		inputTextArea.on("focus", function(){
		    $(this).css("background-color","#fcf8e3");
		  })
		    .focusout(function(){
		      if(inputTextArea.val().length == 0){
		         $(this).css("background-color","#ffffff");
		       }    
		  });
		
		var counter = $(".charNum");
		var maxStringLength = inputTextArea.attr("maxlength");
		
		inputTextArea.keyup(function(){
			var strinLength = inputTextArea.val().length;
			var charsLeft = maxStringLength - strinLength;
			
			counter.html(charsLeft);
		}).keyup();
});