<html>

    <head>
        <title>Insertar Jugador Resultado</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/purecss@3.0.0/build/pure-min.css" integrity="sha384-X38yfunGUhNzHpBaEBsWLO+A0HDYOQi8ufWDkZ0k9e0eXz/tH3II7uKZ9msv++Ls" crossorigin="anonymous">
    </head>
	
	<style>
	
	.center{
		display: flex;
		align-items: center;
		justify-content: center;
	}	
	</style>
	
    <body>
		
		<h2 class="center">Aplicación Futbol</h2>
		<h2 class="center">Resultado: </h2>
		
		<div class="center">
		
			<?php
			//VER ERRORES PARA DEPURAR APLICACION, QUITARLO EN PRODUCCION
			ini_set('display_errors', 1);
			
			//Cadena de conexion a la BBDD
			include 'BD_conexion.php';
			
			?>
		</div>
		<br/>
		
		<div>
		<?php
			
			//Se define array para ir guardando errores de validacion
			$Errores = array();
			
			//Patrón para validar texto Mayusculas Minusculas, acentos y espacios
			$patron_texto = "/^[a-zA-ZñÑáéíóúÁÉÍÓÚäëïöüÄËÏÖÜàèìòùÀÈÌÒÙ\s]+$/";
			
			//Patrón para validar texto Mayusculas Minusculas, acentos, espacios, numeros, guiones y º
			$patron_texto_numeros_especiales = "/^[0-9a-zA-ZñÑáéíóúÁÉÍÓÚäëïöüÄËÏÖÜàèìòùÀÈÌÒÙ\sº-]+$/";
			
			//VALIDACIONES
			//Comprobar que vienen todos los campos necesarios del formulario por POST
			if( !isset($_POST['codigo_jugador']) && !isset($_POST['nombre']) && !isset($_POST['pais']) && !isset($_POST['año']) ) {
			 
				$Errores[] = "No han llegado todos los datos";
			
			}
			
			//Comprobar que el codigo jugador no este vacio
			if( empty($_POST['codigo_jugador']) ) {
				
				$Errores[] = "No ha introducido el codigo de jugador (es requerido)";
			}
			
			//Comprobar que el codigo de jugador es un numero
			if( !is_numeric($_POST['codigo_jugador']) ) {
				
				$Errores[] = "El codigo de jugador debe ser un numero";
			}
			
						
			//Comprobar que el nombre no este vacio
			if( empty($_POST['nombre']) ) {
				
				$Errores[] = "No ha introducido el nombre de jugador (es requerido)";
			}
			
			//Comprobar que el nombre solo tiene letras y espacios
			if( !preg_match($patron_texto, $_POST['nombre']) ) {
				
				$Errores[] = "El nombre sólo puede contener letras y espacios";
			}
			
			//Comprobar que la nacionalidad no este vacia
			if( empty($_POST['nacionalidad']) ) {
				
				$Errores[] = "No ha introducido la nacionalidad del jugador (es requerido)";
			}
			
			//Comprobar que la nacionalidad contiene los caracteres permitidos
			if( !preg_match($patron_texto_numeros_especiales, $_POST['nacionalidad']) ) {
				
				$Errores[] = "La nacionalidad sólo puede contener letras, espacios, numeros, guiones y º";
			}
			
			//Comprobar que el año no este vacio
			if( empty($_POST['id_equipo']) ) {
				
				$Errores[] = "No ha introducido el id de equipo (es requerido)";
			}
			
			//Comprobar que el año es un numero
			if( !is_numeric($_POST['id_equipo']) ) {
				
				$Errores[] = "El id de equipo debe ser un numero";
			}
			
			//Si hay errores de validacion entonces mostrarlos y parar, si no continuar con la insercion en BBDD 
			if( count($Errores) > 0 ) {
				
				echo "<p>ERRORES ENCONTRADOS:</p>";
				// Mostrar los errores:
				for( $i=0; $i < count($Errores); $i++ )
					echo $Errores[$i]."<br/>";
				
				
			} else {
						
				//Variables recogidas del formulario anterior por POST
				$id_jugador = $_POST['codigo_jugador'];
				$nomjugador = $_POST['nombre'];
				$nacionalidad = $_POST['nacionalidad'];
				$posicion = $_POST['posicion'];
				$dorsal = $_POST['dorsal'];
				$equipoId = $_POST['id_equipo'];

				//Cadena de consluta de Insercion en la BBDD
				$insercion = "INSERT INTO jugadores (id_jugador, nomjugador, nacionalidad, posicion, dorsal, equipoId) VALUES 
				(" . "'" . $id_jugador . "'" . "," . "'". $nomjugador . 
				"'" . "," . "'" . $nacionalidad . "'" . "," . "'" . $posicion . "'" . "," . "'" . $dorsal . "'" . "," . "'" . $equipoId . "'" . ");";
				echo "<div class='center'>" . $insercion . "</div>";
				
				//Ejecutar consulta y sacar error si falla
				if (mysqli_query($conexion, $insercion)) {
					echo "<h3 class='center'>El jugador " . $nomjugador ." se ha creado."."</h3>";		    
				} else {
					echo "<h3 class='center'>Ha habido un error al insertar: ". $insercion . " " . mysqli_error($conexion). "</h3><br><br>";
				}					
			}
			
		?>
		
		<br/><br/>
		<a class="center pure-button" href="inserta_jugador_formulario.php">Volver</a>
		</div>
	
    </body>
	
</html>


