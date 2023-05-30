CREATE DATABASE futbol;

USE futbol;

CREATE TABLE IF NOT EXISTS equipos (
  id_equipo INT(10) UNSIGNED PRIMARY KEY,
  nomequipo VARCHAR(40) NOT NULL,
  pais VARCHAR(40) NOT NULL,
  estadio VARCHAR(40) NOT NULL,
  anho INT(11) UNSIGNED
);

CREATE TABLE IF NOT EXISTS jugadores (
  id_jugador INT(10) UNSIGNED PRIMARY KEY,
  nomjugador VARCHAR(30) NOT NULL,
  nacionalidad VARCHAR(45) NOT NULL,
  posicion VARCHAR(45) NOT NULL,
  dorsal INT(11) UNSIGNED,
  equipoId INT(6) UNSIGNED,
  CONSTRAINT fk_jugadores_equipos
  FOREIGN KEY(equipoId) 
  REFERENCES equipos(id_equipo)
);

CREATE TABLE IF NOT EXISTS usuarios (
  id_usuario INT(10) UNSIGNED PRIMARY KEY,
  nomusuario VARCHAR(30) NOT NULL,
  password VARCHAR(30) NOT NULL,
  rol VARCHAR(30) NOT NULL
);




