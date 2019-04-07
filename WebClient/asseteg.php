<?php
// se incluye el header de la pagina
include 'topmenu.php';
?>

<!DOCTYPE html>

<link href='https://fonts.googleapis.com/css?family=Open+Sans:700,600' rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="css/grid.css">

<script src="js/select.js"></script>


<form method="post" action="index.html">
<div class="box">
<h1>Asset Egress Advance Inc</h1>

<div class="grid-item">
    <h4>Asset Code</h4>
    <input type="text" id="code" name="email" placeholder="Code" class="user" />
  </div>

<h4>Select Status</h4>
<select id="status">
    <option value="hide">-- Status --</option>
    <option value="A" rel="icon-temperature">A</option>
    <option value="S">S</option>
    <option value="G">G</option>
    <option value="E">E</option>
</select> 

<br>
<div id="assetReg" onclick="assertEgress()" type="submit" class="btn">Enter</div> <!-- End Btn -->
 
</div> <!-- End Box -->
  
</form>
  
<script>

    //login
    function assertEgress(){
        var code = $('#code').val();
        var status = $('#status').val();
        alert(status);
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