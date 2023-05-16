<?php

 // funcionalidad de creación de nuevos usuarios por parte de los superusuarios
 // formulario para crear nuevos usuarios:
 // incluye campos para el nombre de usuario, contraseña y rol del nuevo usuario
 // cuando se envía el formulario, se llama a la función insertUsuario() para insertar el nuevo usuario en la base de datos
 // después de la creación exitosa, se redirecciona a la página de usuarios para mostrar la lista actualizada.

require_once 'database.php'; // Archivo que contiene la configuración y las funciones de la base de datos

// Verificar si no hay una sesión activa o el usuario no tiene rol "superuser"
if (!isset($_SESSION['username']) || $_SESSION['rol'] !== 'superuser') {
    header("Location: login.php"); // Redireccionar al formulario de inicio de sesión si no hay sesión activa o no tiene rol "superuser"
    exit();
}

// Obtener todos los usuarios
$usuarios = getUsuarios();

// Comprobar si se ha enviado el formulario de creación de usuarios
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Obtener los datos del formulario
    $username = $_POST["username"];
    $password = $_POST["password"];
    $rol = $_POST["rol"];

    // Crear el nuevo usuario en la base de datos
    insertUsuario($username, $password, $rol);

    // Redireccionar a la página de usuarios después de la creación exitosa
    header("Location: usuarios.php");
    exit();
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Crear Usuario</title>
</head>
<body>
    <h2>Crear Nuevo Usuario</h2>

    <form method="POST" action="">
        <div>
            <label for="username">Nombre de usuario:</label>
            <input type="text" id="username" name="username" required>
        </div>
        <div>
            <label for="password">Contraseña:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <div>
            <label for="rol">Rol:</label>
            <select id="rol" name="rol">
                <option value="user">User</option>
                <option value="superuser">Superuser</option>
            </select>
        </div>
        <div>
            <button type="submit">Crear Usuario</button>
        </div>
    </form>

    <h2>Lista de Usuarios</h2>
    <table>
        <tr>
            <th>Nombre de Usuario</th>
            <th>Rol</th>
        </tr>
        <?php foreach ($usuarios as $usuario) { ?>
            <tr>
                <td><?php echo $usuario['username']; ?></td>
                <td><?php echo $usuario['rol']; ?></td>
            </tr>
        <?php } ?>
    </table>
</body>
</html>