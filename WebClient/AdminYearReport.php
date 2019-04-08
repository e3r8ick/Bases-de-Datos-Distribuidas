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


<form method="post" action="reportsManager.html">
<div class="box">
  <h4>Tiempo Real precio venta:608.5800000 </h4>
  <h4>Tiempo Real precio compra:601.9900000 </h4>

<h1>Activos en un rango por sede</h1>
<div class="container">
        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-6">
					          </div>
                </div>
            </div>
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                      <th>Cod Sede</th>
                        <th>Cod Activo</th>
						            <th>Nombre Activo</th>
                        <th>Precio Compras</th>
                        <th>Valor Recidual</th>
                        <th>Categoria</th>
                        <th>Fecha Compra</th>
						            <th>Años Vida Útil</th>
                        <th>Cod Empleado</th>
                        <th>Nombre Empleado</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1</td>
                        <td>1</td>
						            <td>Omnispex</td>
                        <td>10640</td>
                        <td>9000</td>
                        <td>Utilidades</td>
                        <td>2018-02-19</td>
                        <td>3</td>
                        <td>10</td>
                        <td>Jimena</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td>3</td>
						            <td>Omnispex</td>
                        <td>10640</td>
                        <td>9000</td>
                        <td>Utilidades</td>
                        <td>2018-02-19</td>
                        <td>3</td>
                        <td>10</td>
                        <td>Jimena</td>
                    </tr>
                  <tr>
              </tbody>
        </div>
    </div>

</div> <!-- End Box -->

</form>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js" type="text/javascript"></script>
