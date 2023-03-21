<?php 
  include 'conector.php'; 

  //Código que permitiría validar el campo email en el lado del servidor (además de estar controlado el formulario por HTML5)
  /*
  function test_input($data) {
  $data = trim($data);
  $data = stripslashes($data);
  $data = htmlspecialchars($data);
  return $data;
}

if (empty($_GET["email"])) {
    $emailErr = "Email is required";
  } else {
    $email = test_input($_GET["email"]);
    // check if e-mail address is well-formed
    if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $emailErr = "Formato de email invalido";
    }
  }
  */
  $email = $_GET["email"];
  $password = $_GET["password"];
  
  // Realmente, una vez logueado, habría que guardar la información en sesión
  // También una vez que uno llega al punto 5 se puede uno dar cuenta de que el campo email hará falta para almacenarlo en la tabla de pedidos

  $consulta= "SELECT email,password FROM usuarios;";
  
  $resultado= mysqli_query($conexion, $consulta);

  if (mysqli_num_rows($resultado) > 0) {
    
    $encontrado = 0;
    
    // Se recorren los resultados con un bucle while
    while ($fila = mysqli_fetch_assoc($resultado)) {

      // Comprobar nombre de usuario y contraseña
      if ($fila["email"] == $email && $fila["password"] == $password) {
        $encontrado = 1;
        break; // Salir do bucle while
      }
    }
    if ($encontrado == 1) {
      echo "Inicio de sesión exitoso $email!<br/> ";
      echo 'Pincha <a href="./amosaTodoForm.php"> para entrar</a>';
      
    } else {
      echo "Usuario ou contrasinal incorrectos.<br/>" .
      ' <a href="index.php"> Vuelva a loguearse en pantalla de inicio</a> ';
    }    
  } else {
  echo "Non se atoparon usuarios na base de datos.<br/>";
  }

  //mysql_free_result($resultado); 
  //mysql_close($conexion);
  
    
?>