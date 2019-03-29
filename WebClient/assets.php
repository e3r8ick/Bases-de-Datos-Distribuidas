<?php
// se incluye el header de la pagina
include 'topmenu.php';
?>

<!DOCTYPE html>

<link href='https://fonts.googleapis.com/css?family=Open+Sans:700,600' rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="css/login.css">


<form method="post" action="index.html">
<div class="box">
<h1>Advance Inc</h1>

<input type="text" name="email" placeholder="User" class="user" />
  
<input type="password" name="password" placeholder="Password" class="user" />
  
<a href="topmenu.php"><div class="btn">Sign In</div></a> <!-- End Btn -->

<a href="#"><div id="btn2">Sign Up</div></a> <!-- End Btn2 -->
  
</div> <!-- End Box -->
  
</form>
  
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js" type="text/javascript"></script>