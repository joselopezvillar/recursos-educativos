<html>
    <head></head>
    <body>
        <?php
        // 1º
        /* Crea una función que reciba como parámetro un array de números y vaya
        imprimiendo cada uno de ellos con una separación entre los mismos*/
         // 2º
        /* Crea un array de 8 números enteros en el que uno de ellos tiene que ser el número
        7 y haz lo siguiente con dicho array */

        $numbers = array(8,5,6,7,2,1,3,4);
        function listarNumeros($numeros){
            foreach ($numeros as $num) {
                echo $num . "  ";
            }
        }
        listarNumeros($numbers);
        echo "<br>Posición del 7 en el array desordenado: " . array_search('7' , $numbers);

        echo "<br><br>";
        // metodo para ordenar el array
        sort($numbers);
        function listarOrdenada($numeros){
            foreach ($numeros as $num) {
                echo $num . "  ";
            }
        }
        listarOrdenada($numbers);

        echo "<br>Longitud del array: " . sizeof($numbers);
        echo "<br>Posición del 7 en el array: " . array_search('7' , $numbers);

        /**Escribe un programa en php que vaya añadiendo valores aleatorios a un array
        mientras su longitud sea menor que 100 y luego mostrarlo por pantalla */
        echo "<br><br>";
        $valores=array();
        for ($i=1;$i<100;$i++) {
                $num_aleatorio = rand(1,100);
                array_push($valores,$num_aleatorio);
                echo $num_aleatorio . " ";
        }

        ?>
        <br><br><hr><br>
        <form method="get" action="Tarea5.2.php">
        Nombre: <br><input type="text" name="nombre" value=""><br><br>
        Contraseña: <br><input type="password" name="pass" value="">
        <br><br><input type="submit" />
        </form>

        <?php 
        /**Crea un formulario sencillo simulando un inicio de sesión en el que se pida un
        usuario y una contraseña */

        //echo "<h2>".$_GET["NOMBRE"]."</h2>";
        $user = $_GET["nombre"];
        $pass = $_GET["pass"];
        switch ($user) {
            case "Pepe":
                if ($pass == 'abc123.') {
                    header("Status: 301 Moved Permanently");
                    header("Location: https://www.iessanclemente.net"); 
                    exit;
                } else {
                    echo "Usuario o contraseña incorrectos.";
                }
                break;
            case "Luis":
                if ($pass == 'abc123.') {
                    header("Status: 301 Moved Permanently");
                    header("Location: https://www.iessanclemente.net"); 
                    exit;
                } else {
                    echo "Usuario o contraseña incorrectos.";
                }
                break;
            case "Antonio":
                if ($pass == 'antonio123') {
                    header("Status: 301 Moved Permanently");
                    header("Location: https://www.iessanclemente.net"); 
                    exit;
                }else {
                    echo "Usuario o contraseña incorrectos.";
                }
                break;
            default:
                echo "Usuario o contraseña incorrectos.";
        }
        
        ?>

    </body>
        

</html>