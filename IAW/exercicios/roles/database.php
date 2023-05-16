<?php
/* Este código proporciona funciones para: 
// obtener equipos, jugadores y usuarios
// insertar nuevos equipos, jugadores y usuarios (solo para superusuarios)
   cerrar la conexión a la base de datos. */

// Configuración de la base de datos
$servername = "localhost";
$username = "tu_usuario";
$password = "tu_contraseña";
$dbname = "tu_basededatos";

// Conexión a la base de datos
$conn = new mysqli($servername, $username, $password, $dbname);
if ($conn->connect_error) {
    die("Error de conexión a la base de datos: " . $conn->connect_error);
}

// Comprobar el inicio de sesión
session_start();
if (!isset($_SESSION['username'])) {
    header("Location: login.php"); // Redireccionar al formulario de inicio de sesión si no hay sesión activa
    exit();
}

// Obtener el rol del usuario actual
$rol = $_SESSION['rol'];

// Obtener todos los equipos
$sql = "SELECT * FROM equipos";
$result = $conn->query($sql);
$equipos = [];
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        $equipos[] = $row;
    }
}

// Obtener todos los jugadores de un equipo dado
function getJugadores($equipoId, $orden) {
    global $conn;
    $sql = "SELECT * FROM jugadores WHERE equipo_id = $equipoId ORDER BY ";
    if ($orden === 'nombre') {
        $sql .= "nombre ASC";
    } else {
        $sql .= "dorsal ASC";
    }
    $result = $conn->query($sql);
    $jugadores = [];
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $jugadores[] = $row;
        }
    }
    return $jugadores;
}

// Obtener todos los usuarios (solo para superusuarios)
function getUsuarios() {
    global $conn;
    $sql = "SELECT * FROM usuarios";
    $result = $conn->query($sql);
    $usuarios = [];
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $usuarios[] = $row;
        }
    }
    return $usuarios;
}

// Insertar un nuevo equipo (solo para superusuarios)
function insertEquipo($nombre, $pais, $estadio, $fundacion) {
    global $conn;
    $sql = "INSERT INTO equipos (nombre, pais, estadio, fundacion) VALUES ('$nombre', '$pais', '$estadio', '$fundacion')";
    $conn->query($sql);
}

// Insertar un nuevo jugador (solo para superusuarios)
function insertJugador($nombre, $nacionalidad, $posicion, $dorsal, $equipoId) {
    global $conn;
    $sql = "INSERT INTO jugadores (nombre, nacionalidad, posicion, dorsal, equipo_id) VALUES ('$nombre', '$nacionalidad', '$posicion', '$dorsal', '$equipoId')";
    $conn->query($sql);
}

// Insertar un nuevo usuario (solo para superusuarios)
function insertUsuario($username, $password, $rol) {
    global $conn;
    $hashedPassword = password_hash($password, PASSWORD_DEFAULT);
    $sql = "INSERT INTO usuarios (username, password, rol) VALUES ('$username', '$hashedPassword', '$rol')";
$conn->query($sql);
}

// Cerrar la conexión a la base de datos
function closeConnection() {
global $conn;
$conn->close();
}
?>
