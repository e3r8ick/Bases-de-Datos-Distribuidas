<?php
// se incluye el header de la pagina
include 'topmenu.php';
?>

<!DOCTYPE html>

<link href='https://fonts.googleapis.com/css?family=Open+Sans:700,600' rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="css/grid.css">


<form method="post" action="index.html">
<div class="box">
<h1>Asset Assignment Advance Inc</h1>

<div class="column">
  <div class="grid-item">
    <h4>Code</h4>
    <input type="text" id="code" name="email" placeholder="Code" class="user" />
  </div>
  <div class="grid-item">
    <h4>Employee ID</h4>
    <input type="text" id="employee" name="email" placeholder="Employee ID" class="user" />
  </div>
  <div class="grid-item">
    <h4>Date</h4>
    <input type="text" id="date" name="email" placeholder="Date" class="user" />
  </div>
  <div class="grid-item">
    <h4>Detail</h4>
    <input type="text" id="detail" name="email" placeholder="Detail" class="user" />
  </div>
  <div class="grid-item">
    <h4>Venue</h4>
    <input type="text" id="venue" name="email" placeholder="Venue" class="user" />
  </div>
</div>
<div id="assertAssignation" onclick="assertAssignation()" type="submit" class="btn">Enter</div> <!-- End Btn -->
  
</div> <!-- End Box -->
  
</form>
  
<script>

  //login
  function assertAssignation(){
      var code = $('#code').val();
      var regDate = $('#regDate').val();
      var venue = $('#venue').val();
      var detail = $('#detail').val();
      var employee = $('#employee').val();
      $.post( "http://localhost:8081/asset/assign", 
      { 
        registrationDate: regDate,
        codEmployee: employee,
        codVenue: venue,
        ubicationDetail: detail,
        codAsset: code
      },
      function(data){
        alert(JSON.stringify(data));
          
      },"json");

  }

</script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js" type="text/javascript"></script>