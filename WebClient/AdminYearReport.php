<?php
// se incluye el header de la pagina
include 'topmenu.php';
?>

<!DOCTYPE html>

<link href='https://fonts.googleapis.com/css?family=Open+Sans:700,600' rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="css/grid.css">


<form method="post" action="index.html">
<div class="box">
<h1>Reports of assigned assets by range of years</h1>
<div class="column">
  <div class="grid-item">
      <input type="text" id="user" name="purchaseDate" placeholder="Date of purchase" class="user" />
      <input type="text" id="user" name="UtilityYears" placeholder="Years of useful life" class="user" />
  </div>
</div>

</div> <!-- End Box -->

</form>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js" type="text/javascript"></script>
