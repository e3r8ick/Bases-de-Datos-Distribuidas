<?php
// se incluye el header de la pagina
include 'topmenu.php';
?>

<!DOCTYPE html>
<html lang="en">
<head>
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

<body onload="getCRUDEmployees()">
	<form method="post" action="index.html">
	<div class="box">
	<h1>Employees CRUD Advance Inc</h1>

	<div class="container">
			<div class="table-wrapper">
				<div class="table-title">
					<div class="row">
						<div class="col-sm-6">
							<h2>Manage <b>Employees</b></h2>
						</div>
						<div class="col-sm-6">
							<a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Employee</span></a>
							<a href="#deleteEmployeeModal" class="btn btn-danger" data-toggle="modal"><i class="material-icons">&#xE15C;</i> <span>Delete</span></a>
						</div>
					</div>
				</div>
				<table class="table table-striped table-hover">
					<thead>
						<tr>
							<th>
								<span class="custom-checkbox">
									<input type="checkbox" id="selectAll">
									<label for="selectAll"></label>
								</span>
							</th>
							<th>Cod Employee</th>
							<th>Name</th>
							<th>ID</th>
							<th>Photo</th>
							<th>Cod Venue</th>
							<th>Cod Department</th>
							<th>Admision Date</th>
							<th>Position</th>
							<th>Status</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody id="tbody">
					</tbody>
				</table>
			</div>
		</div>

		<!-- Add Modal HTML -->
		<div id="addEmployeeModal" class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">
					<form>
						<div class="modal-header">
							<h4 class="modal-title">Add Employee</h4>
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<label>Name</label>
								<input type="text" id="name" class="form-control" required>
							</div>
							<div class="form-group">
								<label>Status</label>
								<input type="text" id="status" class="form-control" required>
							</div>
							<div class="form-group">
								<label>Photo</label>
								<input type="text" id="photo" class="form-control" required>
							</div>
							<div class="form-group">
								<label>Cod Sede</label>
								<input type="text" id="codSede" class="form-control" required>
							</div>
							<div class="form-group">
								<label>Cod Deparment</label>
								<input type="text" id="codDep" class="form-control" required>
							</div>
							<div class="form-group">
								<label>Date</label>
								<input type="text" id="date" class="form-control" required>
							</div>
							<div class="form-group">
								<label>Job</label>
								<input type="text" id="job" class="form-control" required>
							</div>
							<div class="form-group">
								<label>ID</label>
								<input type="text" id="id" class="form-control" required>
							</div>
						</div>
						<div class="modal-footer">
							<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
							<input onclick="addEmployee()" type="submit" class="btn btn-success" value="Add">
						</div>
					</form>
				</div>
			</div>
		</div>

		<!-- Edit Modal HTML -->
		<div id="editEmployeeModal" class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">
					<form>
						<div class="modal-header">
							<h4 class="modal-title">Edit Employee</h4>
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<label>Name</label>
								<input type="text" class="form-control" required>
							</div>
							<div class="form-group">
								<label>Email</label>
								<input type="email" class="form-control" required>
							</div>
							<div class="form-group">
								<label>Address</label>
								<textarea class="form-control" required></textarea>
							</div>
							<div class="form-group">
								<label>Phone</label>
								<input type="text" class="form-control" required>
							</div>
						</div>
						<div class="modal-footer">
							<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
							<input type="submit" class="btn btn-info" value="Save">
						</div>
					</form>
				</div>
			</div>
		</div>

		<!-- Delete Modal HTML -->
		<div id="deleteEmployeeModal" class="modal fade">
			<div class="modal-dialog">
				<div class="modal-content">
					<div>
						<div class="modal-header">
							<h4 class="modal-title">Delete Employee</h4>
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						</div>
						<div class="modal-body">
						<div class="form-group">
								<label>Employee ID</label>
								<input type="text" id="deleteID" class="form-control" required>
							</div>
						</div>
						<div class="modal-footer">
							<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
							<input type="submit" onclick="deleteEmployee()" class="btn btn-danger" value="Delete">
						</div>
					</div>
				</div>
			</div>
		</div>

	</div> <!-- End Box -->

	</form>

<script>

  function getCRUDEmployees(){
    $.get( "http://localhost:8081/employee",{},
    function(data){
		var employeesArray = JSON.parse(JSON.stringify(data));
	  var n = employeesArray.length;
	  var m = 0;
	  var employeeS =  "";
		for(i = 0; i < n; i++){
			//create html element
			var tbody = document.getElementById("tbody");
			var tr = document.createElement("tr");
			var tdCheck = document.createElement("td");
			var spanCheck = document.createElement("span");
			var inputCheck = document.createElement("input");
			var labelCheck = document.createElement("label");
			var tdActions = document.createElement("td");
			var aActions1 = document.createElement("a");
			var iActions1 = document.createElement("i");
			var aActions2 = document.createElement("a");
			var iActions2 = document.createElement("i");

			//attributes
			spanCheck.setAttribute("class","custom-checkbox");
			inputCheck.setAttribute("type","checkbox");
			inputCheck.setAttribute("id","checkbox"+1);
			inputCheck.setAttribute("value","1");
			labelCheck.setAttribute("for","checkbox"+1);
			aActions1.setAttribute("href","#editEmployeeModal");
			aActions1.setAttribute("class","edit");
			aActions1.setAttribute("data-toggle","modal");
			iActions1.setAttribute("data-toggle","tooltip");
			iActions1.setAttribute("class","material-icons");
			iActions1.setAttribute("title","Edit");
			aActions2.setAttribute("href","#deleteEmployeeModal");
			aActions2.setAttribute("class","delete");
			aActions2.setAttribute("data-toggle","modal");
			iActions2.setAttribute("data-toggle","tooltip");
			iActions2.setAttribute("class","material-icons");
			iActions2.setAttribute("title","Delete");

			iActions1.innerText = "";
			iActions2.innerText = "";

			//appends
			tbody.appendChild(tr);
			tr.appendChild(tdCheck);
			tdCheck.appendChild(spanCheck);
			spanCheck.appendChild(inputCheck);
			spanCheck.appendChild(labelCheck);

			//fill the info from de DB
			employeeS =  JSON.parse(JSON.stringify(employeesArray));
			var selected = JSON.stringify(JSON.parse(JSON.stringify(employeeS[i])));
			selected = selected.split(",");
			m = selected.length;

			//employees data
			var tdCodEmpleado = document.createElement("td");
			var tdNombre = document.createElement("td");
			var tdCedula = document.createElement("td");
			var tdFoto = document.createElement("td");
			var tdCodSede = document.createElement("td");
			var tdCodDepartamento = document.createElement("td");
			var tdFechaIngreso = document.createElement("td");
			var tdPuesto = document.createElement("td");
			var tdEstado = document.createElement("td");

			for(j = 0; j < m; j++){
				var CodEmpleado = selected[0].split(":")[1];
				var Nombre = selected[1].split(":")[1].replace(/"/g,'');
				var Cedula = selected[2].split(":")[1];
				var Foto = selected[3].split(":")[1];
				var CodSede = selected[4].split(":")[1];
				var CodDepartamento = selected[5].split(":")[1];
				var FechaIngreso =selected[6].split(":")[1].replace(/"/g,'');
				var Puesto = selected[7].split(":")[1].replace(/"/g,'');
				var Estado = selected[8].split(":")[1].replace(/"/g,'').replace(/}/g,'');;

				
				tdCodEmpleado.innerText = CodEmpleado
				tdNombre.innerText = Nombre
				tdCedula.innerText = Cedula
				tdFoto.innerText = Foto
				tdCodSede.innerText = CodSede
				tdCodDepartamento.innerText = CodDepartamento
				tdFechaIngreso.innerText = FechaIngreso
				tdPuesto.innerText = Puesto
				tdEstado.innerText = Estado
				
			}

			//appends
			tr.appendChild(tdCodEmpleado);
			tr.appendChild(tdNombre);
			tr.appendChild(tdCedula);
			tr.appendChild(tdFoto);
			tr.appendChild(tdCodSede);
			tr.appendChild(tdCodDepartamento);
			tr.appendChild(tdFechaIngreso);
			tr.appendChild(tdPuesto);
			tr.appendChild(tdEstado);
			tr.appendChild(tdActions);
			tdActions.appendChild(aActions1);
			tdActions.appendChild(aActions2);
			aActions1.appendChild(iActions1);
			aActions2.appendChild(iActions2);


		}

    },"json");
  }

  function addEmployee(){
		var name = $('#name').val();
		var status = $('#status').val();
		var photo = $('#photo').val();
		var codSede = $('#codSede').val();
		var codDep = $('#codDep').val();
		var date = $('#date').val();
		var job = $('#job').val();
		var id = $('#id').val();
	$.post( "http://localhost:8081/employee",
	{
		name: name,
		status: status,
		photo: photo,
		codSede: codSede,
		codDepartamento: codDep,
		date: date,
		job: job,
		id: id
	},
    function(data){
		location.href ="employees.php";
    },"json");
  }

	function deleteEmployee(){
		var id = $('#deleteID').val();
		$.post( "http://localhost:8081/employee/delete",
		{
			id: id
		},
			function(data){
				alert(data);
					location.href ="employees.php";
			},"json");
	}
	
</script>

</body>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js" type="text/javascript"></script>
</html>