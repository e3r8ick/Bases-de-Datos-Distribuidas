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


<form method="post" action="index.html">
<div class="box">
<h1>Venues CRUD Advance Inc</h1>

<div class="container">
        <div class="table-wrapper">
            <div class="table-title">
                <div class="row">
                    <div class="col-sm-6">
						<h2>Manage <b>Venues</b></h2>
					</div>
					<div class="col-sm-6">
						<a href="#addVenueModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Venue</span></a>
						<a href="#deleteVenueModal" class="btn btn-danger" data-toggle="modal"><i class="material-icons">&#xE15C;</i> <span>Delete</span></a>						
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
                        <th>Cod Venues</th>
                        <th>Name</th>
						<th>Description</th>
                        <th>Province</th>
                        <th>Canton</th>
                        <th>District</th>
						<th>Location</th>
                        <th>Status</th>
                        <th>Venue Admin</th>
                        <th>Admin Date</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
	<!-- Edit Modal HTML -->
	<div id="addVenueModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form>
					<div class="modal-header">						
						<h4 class="modal-title">Add Venue</h4>
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
						<input type="submit" class="btn btn-success" value="Add">
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- Edit Modal HTML -->
	<div id="editVenueModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form>
					<div class="modal-header">						
						<h4 class="modal-title">Edit Venue</h4>
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
	<div id="deleteVenueModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<form>
					<div class="modal-header">						
						<h4 class="modal-title">Delete Venue</h4>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">					
						<p>Are you sure you want to delete these Records?</p>
						<p class="text-warning"><small>This action cannot be undone.</small></p>
					</div>
					<div class="modal-footer">
						<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
						<input type="submit" class="btn btn-danger" value="Delete">
					</div>
				</form>
			</div>
		</div>
	</div>
  
</div> <!-- End Box -->
  
</form>
  
<script>

	function getCRUDVenues(){
	$.get( "http://localhost:8081/venue",{},
	function(data){
		var venuesArray = JSON.parse(JSON.stringify(data));
		var n = venuesArray.length;
		var m = 0;
		var venues =  "";
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
			venueS =  JSON.parse(JSON.stringify(venuesArray));
			var selected = JSON.stringify(JSON.parse(JSON.stringify(venueS[i])));
			selected = selected.split(",");
			m = selected.length;

			//venues data
			var tdCod = document.createElement("td");
			var tdNombre = document.createElement("td");
			var tdProvincia = document.createElement("td");
			var tdCanton = document.createElement("td");
			var tdDistrito = document.createElement("td");
			var tdUbicacion = document.createElement("td");
			var tdCodEmpleado = document.createElement("td");
			var tdAdminDate = document.createElement("td");
			var tdEstado = document.createElement("td");
			var tdDescripcion = document.createElement("td");

			for(j = 0; j < m; j++){
				var CodSede = selected[0].split(":")[1];
				var Nombre = selected[1].split(":")[1].replace(/"/g,'');
				var Provincia = selected[2].split(":")[1];
				var Canton = selected[3].split(":")[1];
				var Distrito = selected[4].split(":")[1];
				var Ubicacion = selected[5].split(":")[1];
				var CodEmpleado =selected[6].split(":")[1].replace(/"/g,'');
				var AdminDate = selected[7].split(":")[1].replace(/"/g,'');
				var Estado = selected[8].split(":")[1].replace(/"/g,'')
				var Descripcion = selected[9].split(":")[1].replace(/"/g,'').replace(/}/g,'');

				
				tdCodSede.innerText = CodSede
				tdNombre.innerText = Nombre
				tdProvincia.innerText = Provincia
				tdCanton.innerText = Canton
				tdDistrito.innerText = Distrito
				tdUbicacion.innerText = Ubicacion
				tdCodEmpleado.innerText = CodEmpleado
				tdAdminDate.innerText = AdminDate
				tdEstado.innerText = Estado
				tdDescripcion.innerText = Descripcion
				
			}

			//appends
			tr.appendChild(tdCodSede);
			tr.appendChild(tdNombre);
			tr.appendChild(tdProvincia);
			tr.appendChild(tdDescripcion);
			tr.appendChild(tdCanton);
			tr.appendChild(tdDistrito);
			tr.appendChild(tdUbicacion);
			tr.appendChild(tdCodEmpleado);
			tr.appendChild(tdAdminDate);
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
	$.post( "http://localhost:8081/venue",
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
		location.href ="venues.php";
	},"json");
}

</script>

</body>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js" type="text/javascript"></script>