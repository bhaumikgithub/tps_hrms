$(document).ready(function() {
  if ($('#bill_gst_bill_true').is(':checked')){
  	$("#gst_uploaded").css("display", "block")
  }
  $('input[type="radio"][data-behavior="clickable"]').click(function(evt) {
  	if ($(this).val() == "true"){
  		$("#gst_uploaded").css("display", "block")
    	console.log("you chose the option: ", $(this).val());
  	} else {
  		$("#gst_uploaded").css("display", "none")
  	}
  });
});