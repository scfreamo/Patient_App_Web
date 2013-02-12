<?php
session_start();
if (!isset($_SESSION["loggedin"]) OR $_SESSION["loggedin"] != "1" OR $_SESSION["author"] != "ADM"){
	die('You are not authorized to view this page, please click <a href="index.php"> here </a> to login');
}
elseif ($_SESSION["author"] == "ADM" OR $_SESSION["author"] == "DR"){
	$salt = "814G2a4dx14836a";
	include 'dbconnect.php';
	
	
	
	$username = $mysqli -> real_escape_string($_POST["username"]);
	$password = $mysqli -> real_escape_string($_POST["password"]);
	$firstname = $mysqli -> real_escape_string($_POST["firstname"]);
	$lastname = $mysqli -> real_escape_string($_POST["lastname"]);
	$phone = $mysqli -> real_escape_string($_POST["phone"]);
	$address = $mysqli -> real_escape_string($_POST["address"]);
	$email = $mysqli -> real_escape_string($_POST["email"]);
	$code = $mysqli -> real_escape_string($_POST["code"]);
	
	$salt .= $password;
	
	$password = $salt;
	
	$password = sha1($password);
	
	
    $query = "CALL uspCreateAccount('$username', '$password', '$firstname', '$lastname', '$phone', '$address', '$email', '$code')";

    $res = $mysqli->query($query);










 
}
?>