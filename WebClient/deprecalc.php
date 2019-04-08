<?php
// se incluye el header de la pagina
include 'topmenu.php';
?>

<!DOCTYPE html>

<link href='https://fonts.googleapis.com/css?family=Open+Sans:700,600' rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="css/grid.css">


<form method="post" action="index.html">
<div class="box">
<h1>Deprecation Calc Advance Inc</h1>

<div class="column">
<h4>Depreciation method</h4>
    <select id="mounth">
        <option value="hide">-- Method --</option>
        <option value="1">Straight Line</option>
        <option value="2">Method of sum of digits</option>
    </select> 
    <div class="grid-item">
      <h4>Asset Code</h4>
      <input type="text" id="code" name="email" placeholder="Code" class="user" />
  </div>
    <a href=""><div class="btn">Calc</div></a> <!-- End Btn -->
  <div class="grid-item">
    <h4>Result</h4>
    <input type="text" name="email" placeholder="Result" class="user" />
  </div>
</div>

  
</div> <!-- End Box -->
  
</form>
  
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js" type="text/javascript"></script>