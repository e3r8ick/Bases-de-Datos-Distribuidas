<?php
// se incluye el header de la pagina
include 'topmenu.php';
?>

<!DOCTYPE html>

<link href='https://fonts.googleapis.com/css?family=Open+Sans:700,600' rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="css/grid.css">


<form method="post" action="index.html">
<div class="box">
<h1>Admin Reports</h1>

<div class="column">
  <div class="grid-item">
    <h4>Total assstets per venues for: </h4>
    <select id="Sede">
        <option value="hide">-- Venue --</option>
        <option value="Alajuela" rel="icon-temperature">Alajuela</option>
        <option value="Cartago">Cartago</option>
        <option value="Heredia">Heredia</option>
    </select>
<a href="venueReport.php"><div class="btn">Get report</div></a>
  </div>
  <div class="grid-item">
    <h4>Total assets of:</h4>
    <select id="employee">
        <option value="hide">-- Employee --</option>
        <option value="Employee" rel="icon-temperature">Brandon</option>
    </select>
<a href="employeeReport.php"><div class="btn">Get report</div></a>
  </div>
  <div class="grid-item">
    <h4>Total assets by year range</h4>
    <input type="text" name="date" placeholder="Date" class="user" />
  </div>
</div>
<a href="yearReport.php"><div class="btn">Get report</div></a> <!-- End Btn -->


</div> <!-- End Box -->

</form>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js" type="text/javascript"></script>
