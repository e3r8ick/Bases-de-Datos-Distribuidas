<?php
// se incluye el header de la pagina
include 'topmenu.php';
?>

<!DOCTYPE html>

<link href='https://fonts.googleapis.com/css?family=Open+Sans:700,600' rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="css/grid.css">


<div class="box">
<h1>Manager Reports</h1>

<div class="column">
  <div class="grid-item">
    <h4>Total assstets per venues for: </h4>
    <select id="Sede">
        <option value="hide">-- Venue --</option>
        <option value="2" rel="icon-temperature">Alajuela</option>
        <option value="3">Cartago</option>
        <option value="1">Heredia</option>
    </select>
   <div class="btn" onclick="getReportAssetsPerVenue()">Get report</div>
  </div>
  <div class="grid-item">
    <h4>Total assets by venue for year range:</h4>
    <input type="text" name="rango" placeholder="Rango" class="user" />
<a href="ManagerReportDetailVenue.php"><div class="btn">Get Report</div></a>
  </div>
  <div class="grid-item">
    <h4>List of 3 employees with the highest amount of assets</h4>
    <div class="btn" onclick="getReportTopAssetsEmployee()">Get report</div>
  </div>
  <div class="grid-item">
    <h4>List of 3 employees whose sum of book value of assets is greater</h4>
    <div class="btn" onclick="getReportTopAssets()">Get report</div>
  </div>
</div>


</div> <!-- End Box -->


<script>

function getReportAssetsPerVenue(){
  var venue = $('#Sede').val();
  setCookie("SedeReport",venue,"1");
  location.href ="ManagerVenueReport.php";
}

function getReportTopAssets(){
  location.href ="ManagerTopAssets.php";
}

function getReportTopAssetsEmployee(){
  location.href ="ManagerTopEmployee.php";
}

 //save a cookie
function setCookie(cname, cvalue, exdays) {
  var d = new Date();
  d.setTime(d.getTime() + (exdays*24*60*60*1000));
  var expires = "expires="+ d.toUTCString();
  document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
}

</script>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js" type="text/javascript"></script>
