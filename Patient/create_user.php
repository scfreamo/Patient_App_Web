<?php 
session_start();
if (!isset($_SESSION["loggedin"]) OR $_SESSION["loggedin"] != "1" OR $_SESSION["author"] == "P"){
	die('You are not authorized to view this page, please click <a href="index.php"> here </a> to login');
}
elseif ($_SESSION["author"] == "ADM" OR $_SESSION["author"] == "DR"){

?>


<h1>Create User</h1>

<form id="create" action="create_account.php" method="post" accept-charset="UTF-8">
Username:
<br />
<input id="username" name="username" type="text" />
<br />
Password:
<br />
<input id="password" name="password" type="password" />
<br />
Confirm Password:
<br />
<input id="password2" name="password2" type="password" />
<br />
User Type:
<br />

<?php 
if ($_SESSION["author"] == "ADM"){
    $options = "<option value='P'>Patient</option>"
		. "<option value ='DR'>Doctor</option>"
		. "<option value ='ADM'>Admin</option>";
}
elseif ($_SESSION["author"] == "DR"){
$options = "<option value='P'>Patient</option>";
	
}
echo "<select id='code' name='code' style='width: 150px;'>";

echo $options;

echo "</select>"
?>
<br />
First Name:
<br />
<input id="firstname" name="firstname" type="text" />
<br />
Last Name:
<br />
<input id="lastname" name="lastname" type="text" />
<br />
Address:
<br />
<textarea id="address" name="address"></textarea>
<br />
Email:
<br />
<input id="email" name="email" type="email" />
<br />
Phone Number:
<br />
<input id="phone" name="phone" type="tel" />
<br />


<br />
<input id="submit" type="submit" value="Submit" />





</form>

<?php 
}
?>
