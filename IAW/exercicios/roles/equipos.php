<?php
require_once 'database.php'; // Archivo que contiene la configuración y las funciones de la base de datos

// muestra una tabla con los datos de los equipos 
// proporciona un formulario para ordenar los jugadores por nombre o dorsal
// Al hacer clic en el botón "Ver jugadores" de un equipo, se enviará el formulario a "jugadores.php" para mostrar los jugadores del equipo seleccionado.

Es importante tener en cuenta que este código asume que tienes definida la función getEquipos() en tu archivo "database.php" (o el archivo donde hayas definido las funciones de la base de datos).


// Verificar si no hay una sesión activa o el usuario no tiene rol "user"
if (!isset($_SESSION['username']) || $_SESSION['rol'] !== 'user') {
    header("Location: login.php"); // Redireccionar al formulario de inicio de sesión si no hay sesión activa o no tiene rol "user"
    exit();
}

// Obtener todos los equipos
$equipos = getEquipos();

// Comprobar si se ha enviado el formulario de ordenación
if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST["orden"])) {
    $orden = $_POST["orden"];
} else {
    $orden = "nombre"; // Orden predeterminado
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Equipos</title>
</head>
<body>
    <h2>Tabla de Equipos</h2>

    <table>
        <tr>
            <th>Nombre</th>
            <th>País</th>
            <th>Estadio</th>
            <th>Año de Fundación</th>
        </tr>
        <?php foreach ($equipos as $equipo) { ?>
            <tr>
                <td><?php echo $equipo['nombre']; ?></td>
                <td><?php echo $equipo['pais']; ?></td>
                <td><?php echo $equipo['estadio']; ?></td>
                <td><?php echo $equipo['fundacion']; ?></td>
                <td>
                    <form method="POST" action="jugadores.php">
                        <input type="hidden" name="equipo_id" value="<?php echo $equipo['id']; ?>">
                        <button type="submit">Ver jugadores</button>
                    </form>
                </td>
            </tr>
        <?php } ?>
    </table>

    <h3>Ordenar Jugadores</h3>
    <form method="POST" action="">
        <select name="orden">
            <option value="nombre" <?php echo ($orden === "nombre") ? "selected" : ""; ?>>Nombre</option>
            <option value="dorsal" <?php echo ($orden === "dorsal") ? "selected" : ""; ?>>Dorsal</option>
        </select>
        <button type="submit">Ordenar</button>
    </form>
</body>
</html>
