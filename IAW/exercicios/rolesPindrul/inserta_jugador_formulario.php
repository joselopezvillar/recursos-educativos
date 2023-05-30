<html>
    <head>
	<title>Insertar Jugador</title>
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
		
		<div>
		
			<h2 class="center">Insertar jugador</h2>

			<form class="pure-form pure-form-stacked" method="POST" action="inserta_jugador.php">
		
			<label>Código jugador:</label>
			<input type="text" id="codigo_jugador" name="codigo_jugador" />
			<br>
	 
			<label>Nombre:</label>
			<input type="text" id="nombre" name="nombre" />
			<br>

			<label>Nacionalidad:</label>
			<input type="text" id="nacionalidad" name="nacionalidad" />
			<br>

			<label>Posicion:</label>
			<input type="text" id="posicion" name="posicion"/>
			<br>
			
			<label>Dorsal:</label>
			<input type="text" id="dorsal" name="dorsal" />
			<br>
			
			<label>Id equipo</label>
			<input type="text" id="id_equipo" name="id_equipo" />
			<br>
			
			<div class="center"><input class="pure-button" type="submit" value="Enviar" /></div>
			<br/>
			<div class="center"><input class="pure-button" type="reset" value="Borrar" /></div>

			</form>		
			
			<br/><br/>
			<a class="pure-button center" href="jugadores.php">Volver</a>		
		
			
		</div>
		
	</div>
	
    </body>
    
</html>
