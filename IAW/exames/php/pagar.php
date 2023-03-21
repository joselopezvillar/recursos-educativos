<?php
    session_start();
?>
<html>
    <head>
	<title>Pago</title>
	<link rel="stylesheet" href="../css/style.css" type="text/css" media="all" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>

    <body>
    <?php
    include_once('headerLogueado.php'); 
    include 'conector.php';
    echo "<h1> Página de pago </h1>";

    // Guardar en tabla pedidos
    $sql = "INSERT INTO Pedidos (usuario) VALUES ('prueba@prueba.com')";
    
    if ($conexion->query($sql) === TRUE) {
      echo "Registro almacenado correctamente en tabla de Pedidos";
    } else {
      echo "Error: " . $sql . "<br>" . $conn->error;
    }


    // Guardar en tabla linea_pedido
    // https://www.w3schools.com/php/php_mysql_insert_multiple.asp
    // Habría que con un bucle iterar por las variables de sesión
    // Como está sin implementar... simulo como sería el funcionamiento. El tiempo no da para más! :(
    // Lo dejo comentado porque también habría que gestionar tema de integridad referencial.... muchas cosas para no tanto tiempo!
    /*
    $sql = "INSERT INTO linea_pedido(idPedido,idProducto) VALUES ('1', '1');";
    $sql .= "INSERT INTO MyGuests (firstname, lastname, email) VALUES ('2', '2');";
    
    if ($conexion->multi_query($sql) === TRUE) {
        echo "Registros almacenados correctamente en la tabla linea_pedido";
      } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
      }
      */

      echo "<h2> Gracias por su compra! </h2>";
      $conexion->close();

      // Destruir todas las variables de sesión.
      $_SESSION = array();

     include_once('footer.php');

?>
</body>
</html>