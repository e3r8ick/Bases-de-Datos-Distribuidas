<?php
// se incluye el header de la pagina
include 'topmenu.php';
?>

<!DOCTYPE html>

<link href='https://fonts.googleapis.com/css?family=Open+Sans:700,600' rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="css/grid.css">


<div class="box">
<h1>Admin Reports</h1>

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
    <h4>Total assets of:</h4>
    <input type="text" id="employeeReport" placeholder="Employee" class="user" />
  <div class="btn" onclick="getReportAssetsPerEmployee()">Get report</div>
  </div>
  <div class="grid-item">
    <h4>Total assets by year range</h4>
    <input type="text" id="yearReport" placeholder="Date" class="user" />
    <div class="btn" onclick="getReportAssetsByYear()">Get report</div>
  </div>
</div>


</div> <!-- End Box -->

<script>

function getReportAssetsPerVenue(){
  var venue = $('#Sede').val();
  setCookie("SedeReport",venue,"1");
  location.href ="AdminVenueReport.php";
}

function getReportAssetsPerEmployee(){
  var employee = $('#employeeReport').val();
  setCookie("EmpleadoReport",employee,"1");
  location.href ="AdminEmployeeReport.php";
}

function getReportAssetsByYear(){
  var year = $('#yearReport').val();
  setCookie("YearReport",year,"1");
  location.href ="AdminYearReport.php";
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
