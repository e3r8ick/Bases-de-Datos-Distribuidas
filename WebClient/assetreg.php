<?php
// se incluye el header de la pagina
include 'topmenu.php';
?>

<!DOCTYPE html>

<link href='https://fonts.googleapis.com/css?family=Open+Sans:700,600' rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="css/grid.css">


<form method="post" action="index.html">
<div class="box">
<h1>Asset Registration Advance Inc</h1>

<div class="grid-container">
  <div class="grid-item">
    <h4>Code</h4>
    <input type="text" id="code" name="email" placeholder="Code" class="user" />
  </div>
  <div class="grid-item">
    <h4>Category</h4>
    <input type="text" id="category" name="email" placeholder="Category" class="user" />
  </div>
  <div class="grid-item">
    <h4>Description</h4>
    <input type="text" id="desciption" name="email" placeholder="Description" class="user" />
  </div>
  <div class="grid-item">
    <h4>Photo</h4>
    <input type="text" id="photo" name="email" placeholder="Photo" class="user" />
  </div>
  <div class="grid-item">
    <h4>Purchase Price</h4>
    <input type="text" id="price" name="email" placeholder="Purchase Price" class="user" />
  </div>
  <div class="grid-item">
    <h4>Warranty Time</h4>
    <input type="text" id="warranty" name="email" placeholder="Warranty Time" class="user" />
  </div>
  <div class="grid-item">
    <h4>Lifespan</h4>
    <input type="text" id="lifeSpan" name="email" placeholder="Lifespan" class="user" />
  </div>
  <div class="grid-item">
    <h4>Date of Purchase</h4>
    <input type="text" id="purDate" name="email" placeholder="Date of Purchase" class="user" />
  </div>  
  <div class="grid-item">
    <h4>Percentage of Depreciation</h4>
    <input type="text" id="percentage" name="email" placeholder="Percentage of Depreciation" class="user" />
  </div> 
  <div class="grid-item">
    <h4>Registration date</h4>
    <input type="text" id="regDate" name="email" placeholder="Registration date" class="user" />
  </div>
  <div class="grid-item">
    <h4>Status</h4>
    <input type="text" id="status" name="email" placeholder="Status" class="user" />
  </div>
  <div class="grid-item">
    <h4>Cost Center</h4>
    <input type="text" id="costCenter" name="email" placeholder="Cost Center" class="user" />
  </div>
  <div class="grid-item">
    <h4>Residual Value</h4>
    <input type="text" id="value" name="email" placeholder="Residual Value" class="user" />
  </div>
  <div class="grid-item">
    <h4>Venues</h4>
    <input type="text" id="venue" name="email" placeholder="Venue" class="user" />
  </div>
  <div class="grid-item">
    <h4>Detail</h4>
    <input type="text" id="detail" name="email" placeholder="Detail" class="user" />
  </div>
  <div class="grid-item">
    <h4>Name</h4>
    <input type="text" id="name" name="email" placeholder="Name" class="user" />
  </div>
  <div class="grid-item">
    <h4>Employee</h4>
    <input type="text" id="employee" name="email" placeholder="Employee" class="user" />
  </div>
</div>
<div id="assetReg" onclick="assertRegistration()" type="submit" class="btn">Enter</div> <!-- End Btn -->
  
</div> <!-- End Box -->
  
</form>


<script>

  //assetRegistration
  function assertRegistration(){
      var code = $('#code').val();
      var category = $('#category').val();
      var description = $('#description').val();
      var photo = $('#photo').val();
      var price = $('#price').val();
      var warranty = $('#warranty').val();
      var lifeSpan = $('#lifeSpan').val();
      var purDate = $('#purDate').val();
      var percentage = $('#percentage').val();
      var regDate = $('#regDate').val();
      var status = $('#status').val();
      var costCenter = $('#costCenter').val();
      var value = $('#value').val();
      var venue = $('#venue').val();
      var detail = $('#detail').val();
      var name = $('#name').val();
      var employee = $('#employee').val();
      $.post( "http://localhost:8081/asset", 
      { 
        name: name,
        description: description,
        category: category,
        photo: photo,
        price: price,
        lifeSpan: lifeSpan,
        pjeDepreciacion: percentage,
        buyingDate: purDate,
        registrationDate: regDate,
        warrantyDate: warranty,
        valorResidual: value,
        centroCosto: costCenter,
        codEmployee: employee,
        codVenue: venue,
        ubicationDetail: detail,
        status: status
      },
      function(data){
        alert(JSON.stringify(data));
          
      },"json");

  }

</script>
  
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js" type="text/javascript"></script>