<?php
	//Datos de conexion a BBDD
	$HOST="localhost";
	$USER="root";
	$PASSWORD="";
	$BBDD="futbol";
	$PORT="3307";
	
	mysqli_report(MYSQLI_REPORT_OFF);

	//Conexion y establecimiento de formato a UTF-8
	$conexion = mysqli_connect($HOST, $USER, $PASSWORD, $BBDD, $PORT);
	$conexion->set_charset('utf8');
	
	if (mysqli_connect_errno()) {
		echo "Fallo al conectar a BBDD: " . mysqli_connect_error() . "<br>";
	} else {
		echo "Conexion correcta a BBDD<br/>";
	}
			
?>