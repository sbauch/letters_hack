<?php
//error_reporting(-1);
$apiKey = "api_key=f694037871d8204071d5402842b0ffbebef64847a9cbfc7ff";
$mainLink = "http://api.wordnik.com/v4/word.json/";
$afterURL = "/definitions?";
$audioAfterURL = "/audio?";
$falseCanonical = "useCanonical=false&";
//$word = "Welcome"; //Just testing the API
$word = $_GET['word']; //Setting to a get variable
$includeRelated = "includeRelated=true&";
$sourceDictionaries = "sourceDictionaries=all&";
$includeTags = "includeTags=false&";
$useCanonical = "useCanonical=true&";
$limit = "limit=200&"; //Default value

$error = 0;

$url = $mainLink . $word . $afterURL . $limit . $includeRelated . $sourceDictionaries . $useCanonical . $includeTags . $apiKey;
$string = file_get_contents($url);
$json = json_decode($string,true);


if($json == null) {
        $error = 1;
}


$count = 0;
for($count = 0; $count < count($json); $count++)
{
	if(!($json[$count][sourceDictionary] === "wiktionary")) {
        	break;
	}
}
if($json[$count][sourceDictionary] === "wiktionary") {
        $error = 1;
}

if($json[$count][partOfSpeech] === "abbreviation") {
	$error = 2;
}

//echo "<br /><br />";
//echo $json[$count][word] . " : " . $json[$count][partOfSpeech] . " : " . $json[$count][text] . "<br /><br />";

//echo $json[$count][attributionText] . "<br /><br />";
//echo $url

//Start pronounce code

$urlP = $mainLink . $word . $audioAfterURL . $falseCanonical . $limit . $apiKey;

$response = file_get_contents($urlP);
$json2 = json_decode($response,true);

//echo "<br /><a href='" . $json2[0][fileUrl] . "'>Click here to hear pronounciation</a>";

$typeErr = "";

switch($error) {
	case 0:
		$typeErr = "OK";
		break;
	case 1:
		$typeErr = "ERROR";
		break;
	case 2:
		$typeErr = "ABBREVIATION";
}

$returnarr = array('status-code' => $typeErr, 'word' => $json[$count][word], 'def' => $json[$count][text], 'part-of-speech' => $json[$count][partOfSpeech], 'audio-url' => $json2[0][fileUrl]);

echo json_encode($returnarr);
?>
