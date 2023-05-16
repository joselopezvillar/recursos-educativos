# Exercicio de roles

## Base de datos

Se creará una base de datos con distintos equipos de los cuáles guardaremos el nombre, país, estadio y año de fundación. 

Además habrá otra tabla para los jugadores, de los que guardaremos el nombre, nacionalidad, posición y dorsal. 

Por último tendremos una tabla de usuarios, que como mínimo tendrá los campos username, password y rol.

## La aplicación

La aplicación tendrá un inicio de sesión en el cuál los usuarios con rol “user” introducirán sus credenciales y se le mostrará una tabla con todos los datos de los equipos. 

Pinchando en cada uno de los equipos veremos los datos de todos los jugadores de dicho equipo, los cuáles podremos seleccionar que se ordenen por orden alfabético o por su dorsal.

Como podemos ver, los usuarios con rol “user” solamente podrán consultar la información y ordenarla. 

Sin embargo, si inicia sesión un usuario con rol “superuser” tendrá la posibilidad de añadir nuevos equipos y nuevos jugadores a la base de datos a través de la aplicación completando los formularios correspondientes.

Por último, los superusuarios también podrán crear nuevos usuarios para la aplicación, pudiendo elegir el rol que van a tener
