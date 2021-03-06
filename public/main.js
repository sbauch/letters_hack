var game = {};

$(document).ready(function(){
	$('#startGame').animate({top: "100px"},1000);
});
function closeGameDialog(){
	var gameCode = "e12fwre4";
	$.ajax("./api/games/init", {
		success: function(response){
			game = response;
			
			gameCode = response.short_code;
			var inHTML = '<div class="dialogBack"></div>'
			inHTML += gameCode;
			inHTML += "<br/>";
			inHTML += "Enter this code into your device"
			inHTML += "<br><br>"
			inHTML += "<button onclick='closeDialog()' class='btn btn-success'>Ready?</button>"
			$('#startGame').html(inHTML);
		}
	});
	
}
function closeDialog(){
	var id = game._id;
	$.ajax( './api/games/' + id + '/start', {
		success: function(response){
			var word = response.current_word;

			$('.letter-container').empty(); 
			for( var i = 0; i < word.length; i++ )
				$('.letter-container').append( '<p class="letters">' + word[i] + '</p>');

			$('.word_title').html(word);
			$('.def').html('');

			$('#startGame').fadeOut();
		}
	});
}


function parseMessage( m )
{
	var word = m.current_word;

	$('.letter-container').empty(); 
	for( var i = 0; i < word.length; i++ )
	{
		$('.letter-container').append( '<p class="letters">' + word[i] + '</p>');
	}
	$('.word_title').html(word);
	$('.def').html(m.current_def);
}