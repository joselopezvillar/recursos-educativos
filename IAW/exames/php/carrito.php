<?php
    session_start();
?>
<html>
    <head>
	<title>Carrito</title>
	<link rel="stylesheet" href="../css/style.css" type="text/css" media="all" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>

    <body>
    <?php
    include_once('headerLogueado.php'); 
    echo "<h1> PHP Motrando todas las variables de sesión</h1>";
    $_SESSION['ProductoA'] = "5"; 
    $_SESSION['ProductoB'] = "5";
    $precio=0;
    if(isset($_SESSION['ProductoA']) && !empty($_SESSION['ProductoA'])) {
        echo '<table id="carrito">
    	<tr>
			<th> producto</th>
			<th> precio </th>
		</tr>';
        foreach ($_SESSION as $key=>$val){
        echo "<tr><td>".$key."</td><td>".$val."</td><tr/>";
        $precio=$precio + 5;
        }
        echo "<td><th>Precio total: $precio</th></td></tr></table>";
        
        echo '<a href="pagar.php" class="button">Pagar</a>';

    
     }
     else {
        echo "Carrito vacio!";
     }
    
     include_once('footer.php');

?>
</body>
</html>