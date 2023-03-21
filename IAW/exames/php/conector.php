<?php
  $HOST="localhost";
  $USER="root";
  $PASSWORD="";
  $BBDD="examen";
  $PORT=3306;
  
  $conexion = mysqli_connect($HOST, $USER, $PASSWORD, $BBDD, $PORT);
  
  if (mysqli_connect_errno()) {

    echo "Fallo ao conectar a BBDD: " . mysqli_connect_error() . "<br/>";
  } else {
    //echo "Conexion correcta a BBDD<br/>";
  }
  
  ?>