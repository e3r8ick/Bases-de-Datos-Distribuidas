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
            // $.get( "http://localhost:8081/user/" + user, 
            // { 
            //    password: password 
            // },
            // function(data){
            //    alert(JSON.stringify(data));    
            // },"json");

            $.post( "http://localhost:8081/user", { password: "1234"},function(data){
						alert(JSON.stringify(data));
					});

            // $.ajax({
            //     type: 'GET',
            //     url:"http://localhost:8081/user/"+user,
            //     dataType: 'jsonp', // Notice! JSONP <-- P (lowercase),
            //     body: {
            //         "password": password
            //     },
            //     headers: {
            //         "Access-Control-Allow-Origin":"True"
            //     },
            //     crossDomain: true,
            //     success:function(json){
            //         // do stuff with json (in this case an array)
            //        alert(json);
            //     },
            //     error:function(error){
            //         alert(JSON.stringify(error));
            //     }      
            // });
        }

        
    </script>
    
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.0/jquery.min.js" type="text/javascript"></script>

</body>

</html>