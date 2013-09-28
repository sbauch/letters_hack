$(document).ready(function(){
	$('#startGame').animate({top: "100px"},1000);
});
function closeGameDialog(){
	var gameCode = "e12fwre4";
	$.ajax("http://lettershack.herokuapp.com/api/games/start", {
		success: function(response){
			gameCode = response;
		}
	});
	var inHTML = gameCode;
	inHTML += "<br/>";
	inHTML += "Enter this code into your device"
	inHTML += "<br><br>"
	inHTML += "<button onclick='closeDialog()' class='btn btn-success'>Ready?</button>"
	$('#startGame').html(inHTML);
}
function closeDialog(){
	$('#startGame').fadeOut();
}