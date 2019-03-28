<!DOCTYPE html>
<html lang="en">

<?php
echo '<input type="hidden" id="CIA" value="001">';
echo '<input type="hidden" id="NumInvites" value="0">';

/*echo '<input type="hidden" id="CIA" value="'.$_SESSION['CIA'].'">
			<input type="hidden" id="COD_CLIENTE" value="'.$_SESSION['COD_CLIENTE'].'">
			<input type="hidden" id="SUCURSAL" value="'.$_SESSION['SUCURSAL'].'">';*/

?>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

	<title>Cetrenss S.A.</title>

	<!-- Google font -->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:300,600" rel="stylesheet">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Josefin+Sans:300,400|Roboto:300,400,500">
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.2/css/all.css" integrity="sha384-/rXc/GQVaYpyDdyxK+ecHPVYJSN9bmVFBvjA/9eOB+pb3F2w2N6fc5qB9Ew5yIns" crossorigin="anonymous">

	<!-- Bootstrap -->
	<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />
	<link type="text/css" rel="stylesheet" href="css/dropdown.css" />
	<link type="text/css" rel="stylesheet" href="css/normalize.css">

	<!-- Custom stlylesheet -->
	<link type="text/css" rel="stylesheet" href="css/style.css" />
	<link type="text/css" rel="stylesheet" href="css/animate.css" />

	<!-- Javascript -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/aes.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/crypto-js/3.1.2/rollups/pbkdf2.js"></script>
	<script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/jquery.backstretch.min.js"></script>
	<script src="js/wow.min.js"></script>
	<script src="js/scripts.js"></script>

	  <title>Cetrenss S.A.</title>

</head>

<body>
	<!-- Top menu -->
	<nav class="navbar navbar-inverse" role="navigation">
		<div class="menu-container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#top-navbar-1">
					<span class="sr-only"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.php">Cetrenss S.A.</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="top-navbar">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="index.php">Sedes</a></li>
					<li><a href="gallery.php">Empleados</a></li>
					<li><a href="#">Activos</a></li>
					<li><a href="#">Reportes</a></li>
					<li><a href="#">Cerrar Sesión</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- Small modal -->
	<div class="modal" id="logoutModal" tabindex="-1" role="dialog" aria-hidden="true">
	  <div class="modal-dialog modal-sm">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
	        <h4>Cerrar Sesión <i class="fa fa-lock"></i></h4>
	      </div>
	      <div class="modal-body">
	        <p><i class="fa fa-question-circle"></i> ¿Desea Cerrar Sesión? <br /></p>
	        <div class="actionsBtns">
	            <form action="/logout" method="post">
	                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	                <input type="submit" onclick="logout()" class="btn btn-default btn-primary" data-dismiss="modal" value="Cerra Sesión" />
		                <button class="btn btn-default" data-dismiss="modal">Cancelar</button>
	            </form>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>
	</body>

	<script>

	 //save a cookie
 	function setCookie(cname, cvalue, exdays) {
		var d = new Date();
		d.setTime(d.getTime() + (exdays*24*60*60*1000));
		var expires = "expires="+ d.toUTCString();
		document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
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

	//delete a cookie
	var deleteCookie = function(name) {
    document.cookie = name +'=; Path=/; Expires=Thu, 01 Jan 1970 00:00:01 GMT;';
	};


	//logout
	function logout(){
		deleteCookie("COD_CLIENTE");
		deleteCookie("MON_CLIENTE");
		topMenu.removeChild(newUl);
		topMenu.appendChild(oldMenu);
		window.location.assign("index.php")
	}

	</script>
</html>
