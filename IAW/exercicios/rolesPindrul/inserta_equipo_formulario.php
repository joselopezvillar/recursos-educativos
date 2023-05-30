<html>
    <head>
	<title>Insertar Equipo</title>
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
		
			<h2 class="center">Insertar equipo</h2>

			<form class="pure-form pure-form-stacked" method="POST" action="inserta_equipo.php">
		
			<label>Código equipo:</label>
			<input type="text" id="codigo_equipo" name="codigo_equipo" />
			<br>
	 
			<label>Nombre:</label>
			<input type="text" id="nombre" name="nombre" />
			<br>

			<label>Pais:</label>
			<input type="text" id="pais" name="pais" />
			<br>

			<label>Estadio:</label>
			<input type="text" id="estadio" name="estadio"/>
			<br><br>
			
			<label>Año Fundacion:</label>
			<input type="text" id="anho_fundacion" name="anho_fundacion" />
			<br>
			
			<div class="center"><input class="pure-button" type="submit" value="Enviar" /></div>
			<br/>
			<div class="center"><input class="pure-button" type="reset" value="Borrar" /></div>

			</form>		
			
			<br/><br/>
			<a class="pure-button center" href="equipos.php">Volver</a>		
		
			
		</div>
		
	</div>
	
    </body>
    
</html>
