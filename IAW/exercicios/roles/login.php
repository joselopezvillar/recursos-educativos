<?php
session_start();

 // Formulario de inicio de sesión simple. 
 // Cuando se envía el formulario, verifica las credenciales ingresadas y establece las variables de sesión correspondientes ($_SESSION["username"] y $_SESSION["rol"]). 
 // Luego, redirecciona al usuario a la página "equipos.php" si el inicio de sesión es exitoso.
 // Falta reemplazar la lógica de verificación de credenciales con el código para interactuar con la base de datos y realizar una autenticación segura.

// Verificar si ya hay una sesión activa
if (isset($_SESSION['username'])) {
    header("Location: equipos.php"); // Redireccionar al inicio si ya hay una sesión activa
    exit();
}

// Comprobar si se ha enviado el formulario
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    // Obtener los datos del formulario
    $username = $_POST["username"];
    $password = $_POST["password"];

    // Verificar las credenciales en la base de datos (código de ejemplo)
    // Reemplaza esto con tu lógica de verificación de credenciales con MySQL
    if ($username === "admin" && $password === "admin") {
        // Inicio de sesión exitoso, establecer las variables de sesión
        $_SESSION["username"] = $username;
        $_SESSION["rol"] = "superuser";
        
        header("Location: equipos.php"); // Redireccionar al inicio después del inicio de sesión exitoso
        exit();
    } elseif ($username === "user" && $password === "user") {
        // Inicio de sesión exitoso, establecer las variables de sesión
        $_SESSION["username"] = $username;
        $_SESSION["rol"] = "user";
        
        header("Location: equipos.php"); // Redireccionar al inicio después del inicio de sesión exitoso
        exit();
    } else {
        $error = "Credenciales inválidas. Por favor, inténtalo de nuevo.";
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Iniciar sesión</title>
</head>
<body>
    <h2>Iniciar sesión</h2>
    <?php if (isset($error)) { ?>
        <p style="color: red;"><?php echo $error; ?></p>
    <?php } ?>
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
            <button type="submit">Iniciar sesión</button>
        </div>
    </form>
</body>
</html>
