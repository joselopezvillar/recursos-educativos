<html>

<head>
    <title>Tarea 5.1</title>
</head>

<body>
    <?php

        $nombre= "Ivan Fernandez Sanchez";
        echo "<h1>Nombres</h1>
            <ol>
                <li>Pedro</li>
                <li>Luis</li>
                <li>Marcos</li>
                <li>Ramon</li>
            </ol>";
        
        echo "Buenas tardes, mi nombre es ". $nombre. " y estos fueron los alumnos de hoy.";

        echo "<br>";
        echo "<br>";

        $numero = rand(1,99);
        if($numero>50){
            echo "El número $numero es mayor que 50";
        }
        elseif($numero<50){
            echo "El número $numero es menor que 50";
        }
        else{
            echo "El número $numero es igual a 50";
        }

        echo "<br>";
        echo "<br>";
        $par=0;
        $i=0;
        while($i<20){
            echo $par;
            echo " ";
            $par=$par+2;
            $i++;
        }
        echo "<br>";
        $par=0;
        for($i=0;$i<20;$i++){
            echo $par;
            echo " ";
            $par=$par+2;
        }

        echo "<br>";echo "<br>";
        $dias=array("Lunes", "Martes", "Miercoles", "Jueves", "Viernes");
        $modulos = array("SAD", "SRI", "ASO", "IAW", "ASXBD", "EIE");

        echo "<table border=1>
                <tr>
                <th>$dias[0]</th>
                <th>$dias[1]</th>
                <th>$dias[2]</th>
                <th>$dias[3]</th>
                <th>$dias[4]</th>
                </tr>
                <tr>
                <td>$modulos[0]</td>
                <td>$modulos[3]</td>
                <td>$modulos[3]</td>
                <td>$modulos[2]</td>
                <td>$modulos[2]</td>
                </tr>
                <tr>
                <td>$modulos[1]</td>
                <td>$modulos[1]</td>
                <td>$modulos[1]</td>
                <td>$modulos[2]</td>
                <td>$modulos[2]</td>
                </tr>
                <tr>
                <td>$modulos[0]</td>
                <td>$modulos[0]</td>
                <td>$modulos[0]</td>
                <td>$modulos[4]</td>
                <td>$modulos[4]</td>
                </tr>
                <tr>
                <td>$modulos[5]</td>
                <td>$modulos[5]</td>
                <td>$modulos[3]</td>
                <td>$modulos[3]</td>
                <td>$modulos[3]</td>
                </tr>
                <tr>
                <td>$modulos[4]</td>
                <td>$modulos[4]</td>
                <td>$modulos[4]</td>
                <td>$modulos[2]</td>
                <td>$modulos[2]</td>
                </tr>";

    ?>
    
</body>
</html>