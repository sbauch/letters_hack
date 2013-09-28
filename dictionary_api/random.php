<?php
//error_reporting(-1);
$apiKey = "api_key=f694037871d8204071d5402842b0ffbebef64847a9cbfc7ff";
$mainLink = "http://api.wordnik.com/v4/words.json/randomWord?";

$hasDicDef = "hasDictionaryDef=false&";

$exclude = "excludePartOfSpeech=abbreviation&";

$minCorpusCount = "minCorpusCount=0&";
$maxCorpusCount = "maxCorpusCount=-1&";

$dictionaryCounts = "minDictionaryCount=1&maxDictionaryCount=-1&";


////////
$minLength = "minLength=2&";
$maxLength = "maxLength=4&";

$url = $mainLink . $hasDicDef . $exclude . $minCorpusCount . $maxCorpusCount . $dictionaryCounts . $minLength . $maxLength . $apiKey;
$json = null;
$json2 = null;
//echo $url . "<br /><br />";
$found = false;

$returnArr = array();
$word = "";
while($found == false) {
	$string = file_get_contents($url);
	$json = json_decode($string, true);
	$url2 = "http://http://ec2-23-23-23-199.compute-1.amazonaws.com/api.php?word=" . $json[word];
	$string2 = file_get_contents($url2);
	$json2 = json_decode($string22, true);
	//echo $string2 . "<br /><br />";
	if(!($json2[status_code] === "ERROR")) {
		$found = true;
		$word = $json[word];
		//echo $word;
	}
}
//echo "<br /><br />";
$url2 = "http://ec2-23-23-23-199.compute-1.amazonaws.com/api.php?word=" . $word;
//echo $url2;
$string2 = file_get_contents($url2);
//echo $url
echo $string2;
//print "<br /><br />";
//echo json_encode($returnArr);
?>
