<?php 

if (!isset($_SESSION["loggedin"]) OR $_SESSION["loggedin"] != "1" OR $_SESSION["author"] != "ADM"){
	die('You are not authorized to view this page, please click <a href="index.php"> here </a> to login');
}
elseif ($_SESSION["author"] == "ADM"){

?>


<h1>System Admin Page</h1>

<button id="user_admin" onclick="javascript:window.location.href='user_admin.php'" style="width: 150px;">User Admin</button>
<br />
<br />
<button id="doctor_admin" onclick="javascript:window.location.href='doctor_admin.php'" style="width: 150px;">Doctor Admin</button>
<br />
<br />
<button id="question_admin" onclick="javascript:window.location.href='question_admin.php'" style="width: 150px;">Question Admin</button>
<br />
<br />
<button id="condition_admin" onclick="javascript:window.location.href='condition_admin.php'" style="width: 150px;">Condition Admin</button>
<br />
<br />
<button id="create_user" onclick="javascript:window.location.href='create_user.php'" style="width: 150px;">Create User</button>


<?php 

}
?>