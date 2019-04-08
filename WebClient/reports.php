<?php
// se incluye el header de la pagina
include 'topmenu.php';
?>

<!DOCTYPE html>

<link href='https://fonts.googleapis.com/css?family=Open+Sans:700,600' rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="css/grid.css">

<body>
  <script>

    ///return an specific cookie
    function getCookie(cname) {
      var name = cname + "=";
      var decodedCookie = decodeURIComponent(document.cookie);
      var ca = decodedCookie.split(';');
      for(var i = 0; i <ca.length; i++) {
          var c = ca[i];
          while (c.charAt(0) == ' ') {
              c = c.substring(1);
          }
          if (c.indexOf(name) == 0) {
              return c.substring(name.length, c.length);
          }
      }
      return "";
    }
   

    //check user
    window.onload = function() {
      var rol = getCookie("ROL");
      if((rol.localeCompare("A")) == 0){
        location.href ="AdminReports.php";
      }
      else{
        location.href ="ManagerReport.php";
      }
    }
    
  </script>  
  <form method="post" action="index.html">
  <div class="box">

    
  </div> <!-- End Box -->
    
  </form>
    
  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js" type="text/javascript"></script>

</body>