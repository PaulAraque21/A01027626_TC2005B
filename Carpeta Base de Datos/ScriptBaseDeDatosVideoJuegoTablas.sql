-- Crear Base de Datos
CREATE DATABASE Zambombazo;

-- Seleccionar la Base de Datos
USE Zambombazo;

-- Crear Tablas
CREATE TABLE Equipo (
	id_equipo INT UNSIGNED NOT NULL AUTO_INCREMENT,
    Nombre VARCHAR(25) NOT NULL,
    Descripcion VARCHAR(255),
    Cantidad_Defensas TINYINT UNSIGNED NOT NULL CHECK(Cantidad_Defensas >= 0),
    Cantidad_Medios TINYINT UNSIGNED NOT NULL CHECK(Cantidad_Medios >= 0),
    Cantidad_Delanteros TINYINT UNSIGNED NOT NULL CHECK(Cantidad_Delanteros >= 0),
    Fecha_Creacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    Fecha_Ultima_Modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id_equipo)
);

CREATE TABLE Carta (
	id_carta INT UNSIGNED NOT NULL AUTO_INCREMENT,
    id_equipo INT UNSIGNED,
    Nombre VARCHAR(25) UNIQUE NOT NULL,
    Posicion VARCHAR(25) NOT NULL,
    Ataque TINYINT UNSIGNED NOT NULL CHECK(Ataque > 0),
    Mediocampo TINYINT UNSIGNED NOT NULL CHECK(Mediocampo > 0),
    Defensa TINYINT UNSIGNED NOT NULL CHECK(Defensa > 0),
    Energia TINYINT UNSIGNED NOT NULL CHECK(Energia > 0),
    Fecha_Creacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    Fecha_Ultima_Modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id_carta),
    CONSTRAINT fk_carta_equipo FOREIGN KEY (id_equipo) REFERENCES Equipo(id_equipo) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE Formacion (
	id_formacion INT UNSIGNED NOT NULL AUTO_INCREMENT,
    TipoDeFormacion VARCHAR(25) NOT NULL,
    Descripcion VARCHAR(255),
    PRIMARY KEY (id_formacion)
);

CREATE TABLE TacticaJuego (
	id_tactica_juego INT UNSIGNED NOT NULL AUTO_INCREMENT,
    id_usuario INT UNSIGNED,
    id_formacion INT UNSIGNED,
    PRIMARY KEY (id_tactica_juego),
    CONSTRAINT fk_tacticaJuego_formacion FOREIGN KEY (id_formacion) REFERENCES Formacion(id_formacion) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE Usuario (
	id_usuario INT UNSIGNED NOT NULL AUTO_INCREMENT,
    id_inventario INT UNSIGNED,
    Nombre VARCHAR(25) UNIQUE NOT NULL,
    Contrasena varchar(255),
    Monedas INT UNSIGNED NOT NULL,
    Victorias INT UNSIGNED NOT NULL,
    Derrotas INT UNSIGNED NOT NULL,
    Empates INT UNSIGNED NOT NULL,
    esBot BOOLEAN NOT NULL,
    Fecha_Creacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    Fecha_Ultima_Modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id_usuario)
);

ALTER TABLE TacticaJuego ADD CONSTRAINT fk_tacticaJuego_usuario FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario) ON DELETE RESTRICT ON UPDATE CASCADE;

-- CREATE TABLE Inventario (
-- id_inventario INT UNSIGNED NOT NULL AUTO_INCREMENT,
-- id_usuario INT UNSIGNED,
-- id_carta INT UNSIGNED,
-- PRIMARY KEY (id_inventario)
-- );

CREATE TABLE Inventario (
  id_inventario INT UNSIGNED NOT NULL AUTO_INCREMENT,
  id_usuario INT UNSIGNED UNIQUE NOT NULL,
  PRIMARY KEY (id_inventario)
);

CREATE TABLE InventarioCarta (
  id_inventario INT UNSIGNED NOT NULL,
  id_carta INT UNSIGNED NOT NULL,
  cantidad INT UNSIGNED NOT NULL DEFAULT 1,
  PRIMARY KEY (id_inventario, id_carta)
);

-- Agregar los Foreign Keys, después de crear ambas tablas
ALTER TABLE Usuario ADD CONSTRAINT fk_usuario_inventario FOREIGN KEY (id_inventario) REFERENCES Inventario(id_inventario) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE Inventario ADD CONSTRAINT fk_inventario_usuario FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE InventarioCarta ADD CONSTRAINT fk_inventarioCarta_inventario FOREIGN KEY (id_inventario) REFERENCES Inventario(id_inventario) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE InventarioCarta ADD CONSTRAINT fk_inventarioCarta_carta FOREIGN KEY (id_carta) REFERENCES Carta(id_carta) ON DELETE RESTRICT ON UPDATE CASCADE;

CREATE TABLE Partido (
	id_partido INT UNSIGNED NOT NULL AUTO_INCREMENT,
    id_jugador1 INT UNSIGNED,
    id_jugador2 INT UNSIGNED,
    id_ganador INT UNSIGNED,
    Resultado VARCHAR(5) NOT NULL,
    PRIMARY KEY (id_partido),
    CONSTRAINT fk_jugador1 FOREIGN KEY (id_jugador1) REFERENCES Usuario(id_usuario) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_jugador2 FOREIGN KEY (id_jugador2) REFERENCES Usuario(id_usuario) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_ganador FOREIGN KEY (id_ganador) REFERENCES Usuario(id_usuario) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE Turno (
	id_turno INT UNSIGNED NOT NULL AUTO_INCREMENT,
    id_partido INT UNSIGNED,
    id_carta INT UNSIGNED,
    id_usuario INT UNSIGNED,
    esGol BOOLEAN NOT NULL,
    Tipo_stat VARCHAR(25) NOT NULL,
    Valor_stat TINYINT UNSIGNED NOT NULL,
    PRIMARY KEY (id_turno),
    CONSTRAINT fk_turno_partido FOREIGN KEY (id_partido) REFERENCES Partido(id_partido) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_turno_carta FOREIGN KEY (id_carta) REFERENCES Carta(id_carta) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_turno_usuario FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE Estadistica (
	id_estadistica INT UNSIGNED NOT NULL AUTO_INCREMENT,
    id_partido INT UNSIGNED,
    id_carta INT UNSIGNED,
    id_usuario INT UNSIGNED,
    id_turno INT UNSIGNED,
	Tiempo_partida INT UNSIGNED NOT NULL,
    Numero_jugadas TINYINT UNSIGNED NOT NULL,
    PRIMARY KEY (id_estadistica),
    CONSTRAINT fk_estadistica_partido FOREIGN KEY (id_partido) REFERENCES Partido(id_partido) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_estadistica_carta FOREIGN KEY (id_carta) REFERENCES Carta(id_carta) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_estadistica_usuario FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_estadistica_turno FOREIGN KEY (id_turno) REFERENCES Turno(id_turno) ON DELETE RESTRICT ON UPDATE CASCADE
);
