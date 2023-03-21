<!DOCTYPE html>
<html>        
<head>
	<title>Principal</title>
	<link rel="stylesheet" href="./css/style.css" type="text/css" media="all" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body>
<?php include_once('header.php'); ?>

<h1>Exame de IAW</h1>
    <!-- Formulario sinxelo de inicio de sesión no que se pide email e contrasinal -->
    <form method="get" action="login.php">
        Nome: <br><input type="text" name="email" value=""><br><br>
        Contrasinal: <br><input type="password" name="password" value=""><br><br>
        <input type="submit" />
        </form>
        <?php include_once('footer.php'); ?>

</body>
</html>