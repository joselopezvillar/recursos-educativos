<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Nota Media IAW</title>
	</head>
	<body>
		<?php
		
		// definimos los arrays con las notas obtenidas en cada práctica.
		
		$PracticaX = array('Practica1' => 5, 'Practica2' => 5, 'Practica3' => 5, 'Practica4' => 5 );
		
		// Ahora definimos los arrays con las notas obtenidas en los exámenes.

		$ExamenX = array('Examen1' => 8, 'Examen2'=> 8 );
		
		// variable $numero1 donde sumamos todas las notas de las prácticas y las dividimos
		// por el número de pràcticas totales realizadas para obtener la media.
		
		$numero1 = array_sum($PracticaX)/count($PracticaX);
		
		// hacemos lo mismo con los exámenes.
		
		$numero2 = array_sum($ExamenX)/count($ExamenX);
		
		
		// Ahora metemos dentro de otra variable el peso sobre el calculo medio final de 40% para prácticas y 50% para exámenes.
		$notamedia =(0.4*$numero1) + (0.5*$numero2);
			
			echo '<p>' . 'Nota media de IAW : '. $notamedia . '</p>';
			
		?>
	</body>
</html>
