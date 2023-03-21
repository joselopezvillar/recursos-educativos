<html>
    <head>
	<title>Resultados</title>
	<link rel="stylesheet" href="../css/style.css" type="text/css" media="all" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
	
	<?php include_once('headerLogueado.php'); ?>
    <?php include 'conector.php'; ?>

    <body>

	<?php
	
		echo '<h1 class="center">Produtos por categoría</h1></br>';
		//include_once('amosar_alumnado.php'); 
		//include_once('amosar_cursos.php'); 
		//include_once('amosar_asignaturas.php'); 
		//include_once('amosar_notas.php'); 
		?>
		<h2 class="center">Productos</h2></br>

		<table id="cursos">
    	<tr>
			<th> categoria</th>
			<th> color </th>
			<th> marca </th>
			<th> precio </th>
			<th> opciones </th>
		</tr>

	<?php
		
	    $qry_productos = "SELECT * FROM productos where categoria='sudadera'";
	    $res_productos = mysqli_query($conexion, $qry_productos);

	    for ($i=0; $row = mysqli_fetch_array($res_productos, MYSQLI_ASSOC); $i++){
	?>

	    <tr>
		<td><?php echo $row['categoria'];?></td>
		<td><?php echo $row['color'];?></td>
		<td><?php echo $row['marca'];?></td>
		<td><?php echo $row['precio'];?></td>
		<td><button class="button">Añadir</button></td>
	    </tr>
	

	<?php
	   }
	   mysqli_free_result($res_productos); 
	?>
	</table>


	<?
	include_once('footer.php');
	 ?>

    </body>
</html>
