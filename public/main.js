$(document).ready(function(){
	$('#startGame').animate({top: "100px"},1000);
});
function closeGameDialog(){
	var gameCode = "e12fwre4";
	$.ajax("./api/games/init", {
		success: function(response){
			gameCode = response.short_code;
			var inHTML = gameCode;
			inHTML += "<br/>";
			inHTML += "Enter this code into your device"
			inHTML += "<br><br>"
			inHTML += "<button onclick='closeDialog()' class='btn btn-success'>Ready?</button>"
			$('#startGame').html(inHTML);
		}
	});
	
}
function closeDialog(){
	$('#startGame').fadeOut();
}