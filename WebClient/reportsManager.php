<?php
// se incluye el header de la pagina
include 'topmenu.php';
?>

<!DOCTYPE html>

<link href='https://fonts.googleapis.com/css?family=Open+Sans:700,600' rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="css/grid.css">


<form method="post" action="index.php">
<div class="box">
<h1>Manager Reports</h1>

<div class="column">
  <div class="grid-item">
    <h4>Total assstets per venues for: </h4>
    <select id="Sede">
        <option value="hide">-- Venue --</option>
        <option value="Alajuela" rel="icon-temperature">Alajuela</option>
        <option value="Cartago">Cartago</option>
        <option value="Heredia">Heredia</option>
    </select>
<a href="reporteSede.php"><div class="btn">Get report</div></a>
  </div>
  <div class="grid-item">
    <h4>Total assets by venue for year range:</h4>
    <input type="text" name="rango" placeholder="Rango" class="user" />
<a href="reporteEmpleado.php"><div class="btn">Ver reporte</div></a>
  </div>
  <div class="grid-item">
    <h4>List of 3 employees with the highest amount of assets</h4>
    <h4>_____________________________</h4>
    <h4>_____________________________</h4>
    <h4>_____________________________</h4>
  </div>
  <div class="grid-item">
    <h4>List of 3 employees whose sum of book value of assets is greater</h4>
    <h4>_____________________________</h4>
    <h4>_____________________________</h4>
    <h4>_____________________________</h4>
  </div>
</div>


</div> <!-- End Box -->

</form>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js" type="text/javascript"></script>
