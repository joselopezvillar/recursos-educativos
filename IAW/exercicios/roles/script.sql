-- Crear la tabla "equipos"
CREATE TABLE equipos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    pais VARCHAR(100) NOT NULL,
    estadio VARCHAR(100) NOT NULL,
    fundacion INT NOT NULL
);

-- Crear la tabla "jugadores"
CREATE TABLE jugadores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    nacionalidad VARCHAR(100) NOT NULL,
    posicion VARCHAR(100) NOT NULL,
    dorsal INT NOT NULL,
    equipo_id INT,
    FOREIGN KEY (equipo_id) REFERENCES equipos(id)
);

-- Crear la tabla "usuarios"
CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL,
    rol VARCHAR(20) NOT NULL
);


-- Insertar datos de ejemplo en la tabla "equipos"
INSERT INTO equipos (nombre, pais, estadio, fundacion) VALUES
    ('Real Madrid', 'España', 'Santiago Bernabéu', 1902),
    ('Barça', 'España', 'Camp Nou', 1899);

-- Obtener los ID de los equipos insertados
-- SET @realMadridId = LAST_INSERT_ID();
-- SET @barcaId = LAST_INSERT_ID() + 1;
SET @realMadridId = (SELECT LAST_INSERT_ID());
SET @barcaId = (SELECT LAST_INSERT_ID());

-- Insertar datos de ejemplo en la tabla "jugadores"
INSERT INTO jugadores (nombre, nacionalidad, posicion, dorsal, equipo_id) VALUES
    ('Lionel Messi', 'Argentina', 'Delantero', 10, @barcaId),
    ('Sergio Ramos', 'España', 'Defensa', 4, @realMadridId),
    ('Karim Benzema', 'Francia', 'Delantero', 9, @realMadridId),
    ('Gerard Piqué', 'España', 'Defensa', 3, @barcaId),
    ('Luka Modric', 'Croacia', 'Centrocampista', 10, @realMadridId);

-- Insertar datos de ejemplo en la tabla "usuarios"
INSERT INTO usuarios (username, password, rol) VALUES
    ('usuario', 'password', 'user'),
    ('superusuario', 'password', 'superuser');
