<?php
session_start();
include 'dbconnect.php';
$salt = "814G2a4dx14836a";


$username = $mysqli -> real_escape_string($_POST["username"]);
$password = $mysqli ->  real_escape_string($_POST["password"]);

$salt .= $password;

$password = $salt;

$password = sha1($password);


//$res = $mysqli->query("SELECT * FROM patient");



$query = "CALL uspUserAuth('$username')";

$res = $mysqli->query($query);



while ($row = $res->fetch_assoc()) {
	
	$srvpassword = $row["password"];
}

if ($password == $srvpassword){
	$_SESSION["username"] = $username;
	$_SESSION["loggedin"] = "1";
	header('Location: main.php');
	
}
else {
	echo "Fail!";	
}

?>