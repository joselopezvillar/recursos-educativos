--0
USE baloncesto;

--1
-- Crear
CREATE VIEW Vista1 AS 
 SELECT clases.codigo, clases.grupo,clases.nombre_tutor, clases.capitan,(
  SELECT COUNT(*) FROM jugadores
  WHERE clases.codigo = jugadores.clase) Total_Jugadores
  FROM clases

-- Seleccionar
SELECT * 
FROM baloncesto.Vista1;

--2
-- Crear
CREATE VIEW Vista2 AS SELECT jugadores.nombre,jugadores.apellido, jugadores.tantos_marcados,(
 SELECT clases.nombre_tutor FROM clases
 WHERE clases.codigo = jugadores.clase) tutor,(
  SELECT clases.puntuacion FROM clases
  WHERE clases.codigo = jugadores.clase) puntuacion_clase,(
   SELECT puestos.nombre FROM puestos
   WHERE jugadores.puesto = puestos.codigo) puesto
   FROM jugadores ORDER BY jugadores.tantos_marcados DESC;

-- Seleccionar
SELECT * 
FROM baloncesto.Vista2;

--3
CREATE USER asgbd01 IDENTIFIED BY 'jlv';
CREATE USER asgbd02@'%';
CREATE USER asgbd02@localhost ACCOUNT LOCK;

--4
GRANT ALL PRIVILEGES ON baloncesto.* TO 'asgbd01';
CREATE USER asgbd01@localhost;
GRANT ALL PRIVILEGES ON baloncesto.* TO 'asgbd01@localhost'
WITH GRANT OPTION;

--5
GRANT SELECT,INSERT,UPDATE,DELETE ON baloncesto.* TO 'asgbd02';

--6
LOCK TABLE jugadores WRITE;

--7
START transaction;
SELECT * FROM jugadores where codalumno='E1A016' FOR UPDATE;