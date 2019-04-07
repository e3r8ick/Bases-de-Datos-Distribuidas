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
  <div class="grid-item">
      <h4>Asset Code</h4>
      <input type="text" id="code" name="email" placeholder="Code" class="user" />
  </div>
  <div class="grid-item">
    <h4>Venue</h4>
    <input type="text" id="venue" name="email" placeholder="Venue" class="user" />
  </div>
  <div class="grid-item">
    <h4>Employee ID</h4>
    <input type="text" id="employee" cname="email" placeholder="Employee ID" class="user" />
  </div>
</div>
<div id="assetReg" onclick="assertTransfer()" type="submit" class="btn">Enter</div> <!-- End Btn -->
  
</div> <!-- End Box -->
  
</form>

<script>

    //login
    function assertTransfer(){
        var code = $('#code').val();
        var venue = $('#venue').val();
        var employee = $('#employee').val();
        $.post( "http://localhost:8081/asset", 
        { 
            codAsset: code,
            status: status
        },
        function(data){
        alert(JSON.stringify(data));
            
        },"json");

    }

</script>
  
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js" type="text/javascript"></script>