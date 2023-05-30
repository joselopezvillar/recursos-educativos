<html>

    <head>
        <title>Insertar Equipo Resultado</title>
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
		
		<div class="center">
		
				<?php
					//Comprobar si hay sesion y si no iniciarla
					if (session_status() == PHP_SESSION_NONE  || session_id() == '') {
					session_start();
					}
										
					echo "Su rol es: " . $_SESSION['rol'] . "&nbsp";
				?>	
				
		</div><br/><br/>
		
		<div class="center">
		
				<?php
		
					//Menu De Acciones
					if ($_SESSION['rol'] == 'user') {
						echo '<a class="pure-button" href="equipos.php">Equipos</a>'.'&nbsp;';
						echo '<a class="pure-button"href="jugadores.php">Jugadores</a>'.'&nbsp;';
						echo '<a class="pure-button"href="logout.php">Cerrar Sesion</a>'.'&nbsp;';
					} else {
						echo '<a class="pure-button" href="equipos.php">Equipos</a>'.'&nbsp;';
						echo '<a class="pure-button" href="jugadores.php">Jugadores</a>'.'&nbsp;';
						echo '<a class="pure-button" href="inserta_equipo_formulario.php">Añadir Equipos</a>'.'&nbsp;';
						echo '<a class="pure-button" href="inserta_jugador_formulario.php">Añadir Jugadores</a>'.'&nbsp;';
						echo '<a class="pure-button" href="inserta_usuario_formulario.php">Crear Usuario</a>'.'&nbsp;';
						echo '<a class="pure-button"href="logout.php">Cerrar Sesion</a>'.'&nbsp;';
					}
					
				?>
				
		</div><br/><br/>
		
		<h2 class="center">Lista de Equipos</h2>
		<h3 class="center">Ordenar</h2>
		
		<div class="center">
		
		<?php
			echo '<a class="pure-button" href="equipos.php?'."order=nomequipo".'">Nombre</a>'.'&nbsp;';
			echo '<a class="pure-button" href="equipos.php?'."order=pais".'">Pais</a>'.'&nbsp;';
			echo '<a class="pure-button" href="equipos.php?'."order=anho".'">Año</a>'.'&nbsp;';
		?>
		
		</div><br/><br/>
		
		<div class="center">
		
				<?php
					//Conectar a la BD					
					include 'BD_conexion.php';
				?>
				
		</div><br/><br/>
		
		<div class="center">
		
			<table class="pure-table pure-table-striped" border=1>
				
				<thead>
				<tr>
					<th> ID </th>
					<th> Nombre </th>
					<th> Pais </th>			
					<th> Estadio </th>
					<th> Año Fundacion </th>
				</tr>
				</thead>
				
				<?php
				
					//Guardar consulta a la BBDD en variable
					$consulta = "SELECT * FROM equipos";
					
					if (isset($_GET["order"])) {
						$consulta .= " ORDER BY ";
						$consulta .= $_GET["order"];
					}
				
					$resultado_consulta = mysqli_query($conexion, $consulta);
					
					//Guardar todas las filas en un array asociativo
					$filas = mysqli_fetch_all($resultado_consulta, MYSQLI_ASSOC);
					
						//Recorrer cada fila del array asociativo de filas y crear fila de tabla
						foreach ($filas as $fila) {
							echo "<tr>";
							//Recorrer los valores de la fila y hacer celda en la fila con cada una
							foreach ($fila as $valor) {
								echo "<td>". $valor ."</td>";
							}
							echo "</tr>";
						}
					
					mysqli_free_result($resultado_consulta);
					
				?>		
					
				</tr>
			
			</table>
		</div>
	</body>
</html>