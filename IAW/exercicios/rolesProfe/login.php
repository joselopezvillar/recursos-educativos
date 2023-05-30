<?php

//Para ver errores, quitarlo en produccion
ini_set('display_errors', 'On');

//Comprobar si hay sesion y si no iniciarla
 if (session_status() == PHP_SESSION_NONE  || session_id() == '') {
    session_start();
}

// Comprobar si ya esta creado el array de sesion y si no crearlo
if( !isset($_SESSION['usuario'])){
    $_SESSION['usuario'] = "";
}

// Comprobar si ya esta creado el array de sesion y si no crearlo
if( !isset($_SESSION['rol'])){
    $_SESSION['rol'] = "";
}

$HOST="localhost";
$USER="root";
$PASSWORD="";
$BBDD="futbol";
$PORT="3307";

$conexion = mysqli_connect($HOST, $USER, $PASSWORD, $BBDD, $PORT);

if (mysqli_connect_errno()) {
    echo "Fallo al conectar a BBDD: " . mysqli_connect_error() . "<br>";
} else {
    echo "Conexion correcta a BBDD<br/>";
}

$user = $_GET["nomusuario"];
$pass = $_GET["password"];

$_SESSION['usuario'] = $user;

$consulta = "SELECT nomusuario,password,rol FROM usuarios;";

$resultado= mysqli_query($conexion, $consulta);


if (mysqli_num_rows($resultado) > 0) {

    $encontrado = 0;

    // Se recorren los resultados con un bucle while
    while ($fila = mysqli_fetch_assoc($resultado)) {
        // Comprobar nombre de usuario y contraseña
        if ($fila["nomusuario"] == $user && $fila["password"] == $pass) {
        $encontrado = 1;
		$_SESSION['rol'] =  $fila["rol"];
        break; // Salir del bucle while
        }
        
    }

    if ($encontrado == 1) {
        header("Location: equipos.php");
    } else {
		echo "Usuario no encontrado volviendo...";
        header("refresh: 5; url=index.html");
    }

} else {

echo "No se encontraron usuarios en la base de datos.";

}

mysqli_free_result($resultado);
mysqli_close($conexion);

?>