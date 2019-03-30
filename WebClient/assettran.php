<?php
// se incluye el header de la pagina
include 'topmenu.php';
?>

<!DOCTYPE html>

<link href='https://fonts.googleapis.com/css?family=Open+Sans:700,600' rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="css/grid.css">


<form method="post" action="index.html">
<div class="box">
<h1>Asset Transfer Advance Inc</h1>

<div class="column">
<h4>Select Asset</h4>
    <select id="mounth">
        <option value="hide">-- Month --</option>
        <option value="january" rel="icon-temperature">January</option>
        <option value="february">February</option>
        <option value="march">March</option>
        <option value="april">April</option>
        <option value="may">May</option>
        <option value="june">June</option>
        <option value="july">July</option>
        <option value="august">August</option>
        <option value="september">September</option>
        <option value="october">October</option>
        <option value="november">November</option>
        <option value="december">December</option>
    </select> 
  <div class="grid-item">
    <h4>Venue</h4>
    <input type="text" name="email" placeholder="Venue" class="user" />
  </div>
  <div class="grid-item">
    <h4>Employee ID</h4>
    <input type="text" name="email" placeholder="Employee ID" class="user" />
  </div>
</div>
<a href=""><div class="btn">Enter</div></a> <!-- End Btn -->
  
</div> <!-- End Box -->
  
</form>
  
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js" type="text/javascript"></script>