<html>

    <head>
        <title>Insertar usuario Resultado</title>
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
			if( !isset($_POST['codigo_usuario']) && !isset($_POST['nombre']) && !isset($_POST['password']) && !isset($_POST['rol']) ) {
			 
				$Errores[] = "No han llegado todos los datos";
			
			}
			
			//Comprobar que el codigo usuario no este vacio
			if( empty($_POST['codigo_usuario']) ) {
				
				$Errores[] = "No ha introducido el codigo de usuario (es requerido)";
			}
			
			//Comprobar que el codigo de usuario es un numero
			if( !is_numeric($_POST['codigo_usuario']) ) {
				
				$Errores[] = "El codigo de usuario debe ser un numero";
			}
			
						
			//Comprobar que el nombre no este vacio
			if( empty($_POST['nombre']) ) {
				
				$Errores[] = "No ha introducido el nombre de usuario (es requerido)";
			}
			
			//Comprobar que el nombre solo tiene letras y espacios
			if( !preg_match($patron_texto, $_POST['nombre']) ) {
				
				$Errores[] = "El nombre sólo puede contener letras y espacios";
			}
			
			//Comprobar que la password no este vacia
			if( empty($_POST['password']) ) {
				
				$Errores[] = "No ha introducido la password del usuario (es requerido)";
			}
			
			//Comprobar que la password contiene los caracteres permitidos
			if( !preg_match($patron_texto_numeros_especiales, $_POST['password']) ) {
				
				$Errores[] = "La nacionalidad sólo puede contener letras, espacios, numeros, guiones y º";
			}
			
			//Comprobar que el rol no este vacio
			if( empty($_POST['rol']) ) {
				
				$Errores[] = "No ha introducido el id de equipo (es requerido)";
			}
			
			//Comprobar que el rol tenga un valor válido
			if( is_numeric($_POST['rol']) ) {
				
				$Errores[] = "El rol no debe ser un numero";
			}
			
			//Si hay errores de validacion entonces mostrarlos y parar, si no continuar con la insercion en BBDD 
			if( count($Errores) > 0 ) {
				
				echo "<p>ERRORES ENCONTRADOS:</p>";
				// Mostrar los errores:
				for( $i=0; $i < count($Errores); $i++ )
					echo $Errores[$i]."<br/>";
				
				
			} else {
						
				//Variables recogidas del formulario anterior por POST
				$id_usuario = $_POST['codigo_usuario'];
				$nomusuario = $_POST['nombre'];
				$password = $_POST['password'];
				$rol = $_POST['rol'];

				//Cadena de consluta de Insercion en la BBDD
				$insercion = "INSERT INTO usuarios (id_usuario, nomusuario, password, rol) VALUES 
				(" . "'" . $id_usuario . "'" . "," . "'". $nomusuario . 
				"'" . "," . "'" . $password . "'" . "," . "'" . $rol . "'" . ");";
				echo "<div class='center'>" . $insercion . "</div>";
				
				//Ejecutar consulta y sacar error si falla
				if (mysqli_query($conexion, $insercion)) {
					echo "<h3 class='center'>El usuario " . $nomusuario ." se ha creado."."</h3>";		    
				} else {
					echo "<h3 class='center'>Ha habido un error al insertar: ". $insercion . " " . mysqli_error($conexion). "</h3><br><br>";
				}					
			}
			
		?>
		
		<br/><br/>
		<a class="center pure-button" href="inserta_usuario_formulario.php">Volver</a>
		</div>
	
    </body>
	
</html>


