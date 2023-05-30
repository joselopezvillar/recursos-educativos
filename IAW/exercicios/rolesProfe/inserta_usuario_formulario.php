<html>
    <head>
	<title>Insertar usuario</title>
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
		
			<h2 class="center">Insertar Usuario</h2>

			<form class="pure-form pure-form-stacked" method="POST" action="inserta_usuario.php">
		
			<label>Código usuario:</label>
			<input type="text" id="codigo_usuario" name="codigo_usuario" />
			<br>
	 
			<label>Nombre:</label>
			<input type="text" id="nombre" name="nombre" />
			<br>

			<label>Password:</label>
			<input type="text" id="password" name="password" />
			<br>

			<label>Rol:</label>
			<input type="text" id="rol" name="rol"/>
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
