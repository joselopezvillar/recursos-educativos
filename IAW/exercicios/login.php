<?php 
    
  $HOST="localhost";
  $USER="root";
  $PASSWORD="";
  $BBDD="usuarios";
  $PORT=3307;
  
  $conexion = mysqli_connect($HOST, $USER, $PASSWORD, $BBDD, $PORT);
  
  if (mysqli_connect_errno()) {

    echo "Fallo ao conectar a BBDD: " . mysqli_connect_error() . "<br/>";
  } else {
    echo "Conexion correcta a BBDD<br/>";
  }
  
  $user = $_GET["nome"];
  $pass = $_GET["pass"];
  
  $consulta= "SELECT nome,pass FROM usuario;";
  
  $resultado= mysqli_query($conexion, $consulta);

  if (mysqli_num_rows($resultado) > 0) {
    
    $encontrado = 0;
    
    // Se recorren los resultados con un bucle while
    while ($fila = mysqli_fetch_assoc($resultado)) {

      // Comprobar nombre de usuario y contraseña
      if ($fila["nome"] == $user && $fila["pass"] == $pass) {
        $encontrado = 1;
        break; // Salir do bucle while
      }
    }
    if ($encontrado == 1) {
      echo "Inicio de sesión exitoso!<br/>";
    } else {
      echo "Usuario ou contrasinal incorrectos.<br/>";
    }    
  } else {
  echo "Non se atoparon usuarios na base de datos.<br/>";
  }
  
  mysql_free_result($resultado); 
  mysql_close($conexion);
    
?>
