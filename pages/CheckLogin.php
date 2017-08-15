<?php
require_once('../includes/configure.php');
$_SESSION['login']=false;

$token_name = "login_csrf";
$csrf = new CSRF_Protect($token_name);

$email = $_POST["email"];
$password= md5($_POST["password"]);

if($csrf->isTokenValid($_POST[$token_name])) {
$db->where ("u_email", $email);
$row = $db->getOne ("users");

	if($row) {
	
		if(($row["u_email"]==$email)&&($row["u_pass"]==$password)){
			$_SESSION['login'] = true;
			$_SESSION['u_id'] = $row['u_id'];
			$_SESSION['u_email']= $_POST["email"];
			$_SESSION['u_pass']=$row["u_pass"];
			$_SESSION['u_role']=$row["u_role"];
		
		$data["lh_u_id"] = $row['u_id'];
		
	
		$lh_id = insertDataArrWithMsg($db, "login_history", $data,  "Unble to history !"
								, "New history Added successfully!", true, false);
			header("location:dashboard.php");
		}else{
		
			$_SESSION['error'] = true;
			header("location:login.php");
		}
	}else{

	$_SESSION['error'] = true;
	header("location:login.php");
	}
	
}  else {
	$_SESSION['error'] = true;
	header("location:login.php");
}