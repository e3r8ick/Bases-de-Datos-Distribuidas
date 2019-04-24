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

<h1>Top 3 Empelados con mayor valor en activos</h1>
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
                        <th>Nombre</th>
                        <th>Cédula</th>
                        <th>Cod</th>
                        <th>Cod Activo</th>
                        <th>Nombre Activo</th>
                        <th>Categoria</th>
                        <th>Descripción</th>
                        <th>Cod Sede</th>
                        <th>Detalle</th>
                    </tr>
                </thead>
                <tbody>
                    
              </tbody>
        </div>
    </div>

</div> <!-- End Box -->

</body>

<script>
    function getReport(){            
        //report    
        $.post( "http://localhost:8081/report/manager/topvalue", {},
			function(data){
                var n = data.length;

                for(i = 0; i < n; i++){
                var report = JSON.stringify(data[i]);
                report = report.split(",");

                //create elements
                var table = document.getElementById("table");
                var tr = document.createElement("tr");
                var codEmpleado = document.createElement("th");
                var nombre = document.createElement("th");
                var cedula = document.createElement("th");
                var cod = document.createElement("th");
                var activo = document.createElement("th");
                var codactivo = document.createElement("th");
                var categoria = document.createElement("th");
                var descripcion = document.createElement("th");
                var sede = document.createElement("th");
                var detalle = document.createElement("th");

                //values
                codEmpleado.innerText = report[0].split(":")[1];
                nombre.innerText = report[1].split(":")[1].replace(/"/g,'');;
                cedula.innerText = report[2].split(":")[1];
                cod.innerText = report[3].split(":")[1];
                codactivo.innerText = report[4].split(":")[1];
                activo.innerText = report[5].split(":")[1].replace(/"/g,'');;
                categoria.innerText = report[6].split(":")[1].replace(/"/g,'');;
                descripcion.innerText = report[7].split(":")[1].replace(/"/g,'');;
                sede.innerText = report[8].split(":")[1];
                detalle.innerText = report[9].split(":")[1];

                //append items
                table.appendChild(tr);
                tr.appendChild(codEmpleado);
                tr.appendChild(nombre);
                tr.appendChild(cedula);
                tr.appendChild(cod);
                tr.appendChild(codactivo);
                tr.appendChild(activo);
                tr.appendChild(categoria);
                tr.appendChild(descripcion);
                tr.appendChild(sede);
                tr.appendChild(detalle);
                }
                    
                },"json");
    }



</script>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js" type="text/javascript"></script>
