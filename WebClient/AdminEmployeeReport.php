<?php
// se incluye el header de la pagina
include 'topmenu.php';
?>

<!DOCTYPE html>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link href='https://fonts.googleapis.com/css?family=Open+Sans:700,600' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="css/crud.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link href='https://fonts.googleapis.com/css?family=Open+Sans:700,600' rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="css/grid.css">

<body onload="getReport()">
<div class="box">
    <h4 id="venta"></h4>
    <h4 id="compra"></h4>

<h1>Activos para un empleado</h1>
<div class="container">
        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-6">
					          </div>
                </div>
            </div>
            <table class="table table-striped table-hover">
                <thead id="table">
                    <tr>
                        <th>Cod Empleado</th>
                        <th>Activos Asignados</th>
                        <th>Costo Inicial</th>
                        <th>Costo en Libros</th>
                        <th>Costo Residua</th>
                        <th>Promedio Inicial</th>
                        <th>Promedio en Libros</th>
                        <th>Promedio Recidual</th>
                        <th>Costo Inicial Dolares</th>
                        <th>Costo en Libros Dolares</th>
                        <th>Costo Residual Dolares</th>
                        <th>Promedio Inicial Dolares</th>
                        <th>Promedio en Libros Dolares</th>
                        <th>Promedio Recidual Dolares</th>
                    </tr>
                </thead>
        </div>
    </div>

</div> <!-- End Box -->
</body>
<script>
function getReport(){
        var id = getCookie("EmpleadoReport")
        //dolar 
        $.get( "http://localhost:8081/tipo",{},
			function(data){
                var tipo = JSON.stringify(data);
                tipo = tipo.split('"');
                document.getElementById("venta").innerText = "Tiempo Real precio venta: " + tipo[5];
                document.getElementById("compra").innerText = "Tiempo Real precio compra: " + tipo[9];
					
            },"json");
            
        //report    
        $.post( "http://localhost:8081/report/admin/employee",
		{
			codEmployee: id
		},
			function(data){
                var report = JSON.stringify(data);
                report = report.split(",");

                //create elements
                var table = document.getElementById("table");
                var tr = document.createElement("tr");
                var codEmpleado = document.createElement("th");
                var activos = document.createElement("th");
                var costo = document.createElement("th");
                var libros = document.createElement("th");
                var residual = document.createElement("th");
                var costoP = document.createElement("th");
                var librosP = document.createElement("th");
                var residualP = document.createElement("th");
                var costoD = document.createElement("th");
                var librosD = document.createElement("th");
                var residualD = document.createElement("th");
                var librosDP = document.createElement("th");
                var residualDP = document.createElement("th");

                //values
                codEmpleado.innerText = report[0].split(":")[1];
                activos.innerText = report[1].split(":")[1];
                costo.innerText = report[2].split(":")[1];
                libros.innerText = report[3].split(":")[1];
                residual.innerText = report[4].split(":")[1];
                costoP.innerText = report[5].split(":")[1];
                librosP.innerText = report[6].split(":")[1];
                residualP.innerText = report[7].split(":")[1];
                costoD.innerText = report[8].split(":")[1];
                librosD.innerText = report[9].split(":")[1];
                residualD.innerText = report[10].split(":")[1];
                librosDP.innerText = report[11].split(":")[1];
                residualDP.innerText = report[12].split(":")[1];

                //append items
                table.appendChild(tr);
                tr.appendChild(codEmpleado);
                tr.appendChild(activos);
                tr.appendChild(costo);
                tr.appendChild(libros);
                tr.appendChild(residual);
                tr.appendChild(costoP);
                tr.appendChild(librosP);
                tr.appendChild(residualP);
                tr.appendChild(costoD);
                tr.appendChild(librosD);
                tr.appendChild(residualD);
                tr.appendChild(librosDP);
                tr.appendChild(residualDP);
					
			},"json");
    }

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

</script>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js" type="text/javascript"></script>
