<?php
// Inicializa la sesion
// Si se usa session_name("algo"), no lo olvides
session_start();

// Restablecer todas las variables de sesion
$_SESSION = array();

// Borrar la cookie de sesion
// Esto destruye la sesion, y no solo los datos de sesion.
if (ini_get("session.use_cookies")) {
    $params = session_get_cookie_params();
    setcookie(session_name(), '', time() - 42000,
        $params["path"], $params["domain"],
        $params["secure"], $params["httponly"]
    );
}

// Destruir la sesion.
session_destroy();

header("Location: index.html");

?>