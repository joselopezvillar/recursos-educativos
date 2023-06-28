<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>iaw05 resultado</title>
	</head>
	<body>

      <table border=2>
        <tbody>
      <tr>
        <th>Nombre y Apellidos</th>
        <th>Dia comienzo de trabajo</th>
        <th>Mes que comenzó</th>
        <th>Número Mágico</th>
        
      </tr>
      <tr>
        <td> 
		<?php
		 //Comprobamos si el nombre y  apellido están rellenos, en tal caso se muestran.
		if (($_REQUEST['nombre']!="") && ($_REQUEST['apellidos']!=""))
            print strip_tags($_REQUEST['nombre']) . " " . trim($_REQUEST['apellidos']); 
		  ?> 
		</td>
		
        <td><?php
		//comprobamos si la fecha está rellena y en tal caso.
		// con la función date , solicitamos que muestre el dia de la semana en letra con 'l' de la fecha dada en strtotime.
		if ($_REQUEST['fecha']!="")
					echo date("l",strtotime($_REQUEST['fecha']))  ;
		?>
			
		</td>
        <td>
		
		<?php
		//comprobamos si la fecha está rellena y en tal caso.
		// con la función date , solicitamos que muestre el mes completo en letra con 'F' de la fecha dada en strtotime.
			if ($_REQUEST['fecha']!="")
					echo date("F",strtotime($_REQUEST['fecha']))  ;
		
		?>
		</td>
        <td>
		
		
		<?php
		// Usamos variables para extraer en numero el dia de una fecha dada con 'j' en dos digitos.
				$diames=date("d",strtotime($_REQUEST['fecha']));
		// Con la misma secuencia pero usando 'Y' obtenemos en num de 4 digitos el año dado en la fecha introducida.
		$anio=date("Y",strtotime($_REQUEST['fecha']));
		
		//Ahora necesitamos dividir cada digito por separado para poder operar con ellos.
		$digitosdia= str_split($diames);
		$digitosanio= str_split($anio);
		
		//sumamos cada digito por separado, primero el dia y luego cada digito del año.
		
				$sumadia = $digitosdia[0]+$digitosdia[1];
				$sumaanio= $digitosanio[0] + $digitosanio[1] + $digitosanio[2] + $digitosanio[3] ;
		//nos pedían que el número mágico fuese la suma de cada dígito del año menos la suma de cada dìgito del dia:	
					$resultado = $sumaanio - $sumadia;
		//comprobamos que el campo fecha este relleno y que además el resultado de la operación sea mayor que cero.
		// si el resultado da un número negativo entonces el número mágico será 0.
		
			if (($_REQUEST['fecha']!="") && ($resultado >= 0))
			{echo $resultado;
			}else if ($resultado < 0){
				echo '0';
			}		
			
		?>
		</td>
       
      </tr>
	  </tbody>
	</table>


	</body>
</html>
