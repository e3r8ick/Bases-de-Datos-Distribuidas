<?php
// se incluye el header de la pagina

?>

<!DOCTYPE html>
<html lang="en">

<head>

    <link href='https://fonts.googleapis.com/css?family=Open+Sans:700,600' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" type="text/css" href="css/login.css">

</head>

<body>

    <form method="post" action="index.html">
    <div class="box">
    <h1>Control de Activos Advance Inc</h1>

    <input type="text" id="user" name="email" placeholder="User" class="user" />
    
    <input type="password" name="password" id="password" placeholder="Password" class="user" />
    
    <div id="login" onclick="login()" type="submit" class="btn">Sign In</div> <!-- End Btn -->

    <div id="btn2" class="btn">Sign Up</div> <!-- End Btn2 -->
    
    </div> <!-- End Box -->
    
    </form>

    <script>

        //login
        function login(){
            var user = $('#user').val();
            var password = $('#password').val();
            $.post( "http://localhost:8081/user/" + user, 
            { 
               password: password 
            },
            function(data){
                var rol = JSON.stringify(data)[10];
                if((rol.localeCompare("A")) == 0){
                    setCookie("USER",user,"1");  
                    setCookie("ROL",rol,"1"); 
                    location.href ="admin.php";
                } 
                else if((rol.localeCompare("U")) == 0){
                    setCookie("USER",user,"1");  
                    setCookie("ROL",rol,"1"); 
                    location.href ="manager.php";
                }
                else{
                    alert("Unregistered user")
                }
            },"json");

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

</body>

</html>