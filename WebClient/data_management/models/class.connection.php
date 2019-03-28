<?php
	//connection class
	class Connection{

		//DESKTOP-34N0LII\SQLEXPRESS

		public function sqlserver_connect(){
			$serverName = "DESKTOP-34N0LII\SQLEXPRESS";
			$connectionInfo = array("Database"=>"AdvancedInc","UID"=>"admin","PWD"=>"123");
			$connection = sqlsrv_connect($serverName,$connectionInfo);

			if($connection === false){
				die( print_r( sqlsrv_errors(), true));
			}

			$sql = "SELECT * from USUARIOS";

			//$params = array("1234");
			$params = array("");

			$stmt = sqlsrv_query( $connection, $sql, $params);
			if( $stmt === false ) {
				die( print_r( sqlsrv_errors(), true));
			}

			while ($fila = sqlsrv_fetch_array($stmt)) {
				//cada fila obtenida se devuelve en un campo del arreglo.
				$rows[] = $fila;
			  }

			//$row = sqlsrv_fetch_array($stmt);
			echo json_encode($rows);
	
			//$row = sqlsrv_fetch_array($stmt);
		}

				}

	$a = new Connection();
	$a->sqlserver_connect();
?>