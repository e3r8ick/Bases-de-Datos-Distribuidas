<?php
// se incluye el header de la pagina
include 'topmenu.php';
?>

<!DOCTYPE html>

<link href='https://fonts.googleapis.com/css?family=Open+Sans:700,600' rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="css/grid.css">


<form method="post" action="index.html">
<div class="box">
<h1>Reportes para Gerentes</h1>

<div class="column">
  <div class="grid-item">
    <h4>Total de activos por sede de: </h4>
    <select id="Sede">
        <option value="hide">-- Sede --</option>
        <option value="Alajuela" rel="icon-temperature">Alajuela</option>
        <option value="Cartago">Cartago</option>
        <option value="Heredia">Heredia</option>
    </select>
<a href="reporteSede.html"><div class="btn1">Ver reporte</div></a>
  </div>
  <div class="grid-item">
    <h4>Total de activos asignados a las sedes para un rango de años:</h4>
    <input type="text" name="rango" placeholder="Rango" class="user" />
<a href="reporteEmpleado.html"><div class="btn2">Ver reporte</div></a>
  </div>
  <div class="grid-item">
    <h4>Lista de 3 empleados con mayor cantidad de activos</h4>
    <h4>_____________________________</h4>
    <h4>_____________________________</h4>
    <h4>_____________________________</h4>
  </div>
  <div class="grid-item">
    <h4>Lista de 3 empleados cuya suma del valor en libros de los activos es mayor</h4>
    <h4>_____________________________</h4>
    <h4>_____________________________</h4>
    <h4>_____________________________</h4>
  </div>
</div>


</div> <!-- End Box -->

</form>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js" type="text/javascript"></script>
