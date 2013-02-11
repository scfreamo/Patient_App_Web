<?php
session_start();
if (!isset($_SESSION["loggedin"]) OR $_SESSION["loggedin"] != "1"){
	die('You are not authorized to view this page, please click <a href="index.php"> here </a> to login');
}
else {
	include 'dbconnect.php';
	$username = $mysqli -> real_escape_string($_SESSION["username"]);
	$query = "CALL uspUserAuthor('$username')";
	
	$res = $mysqli -> query($query);
	
	while ($row = $res->fetch_assoc()){
		if ($row["code"] == "ADM"){
			$_SESSION["author"] = "ADM";
			include 'admin.php';	
		}
		elseif ($row["code"] == "DR"){
			$_SESSION["author"] = "DR";
			include 'doctor.php';
		}
		elseif ($row["code"] == "P"){
			$_SESSION["author"] = "P";
			include 'patient.php';
		}
		
	}
}



?>