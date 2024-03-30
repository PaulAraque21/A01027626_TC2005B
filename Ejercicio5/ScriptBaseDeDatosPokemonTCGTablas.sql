-- Crear Base de Datos 
CREATE DATABASE PokemonTCG;

-- Seleccionar la Base de Datos
USE PokemonTCG;

-- Crear Tablas
CREATE TABLE CartaPokemon (
	id_cartaPokemon INT UNSIGNED NOT NULL AUTO_INCREMENT,
    Nombre VARCHAR(25) NOT NULL,
    Descripcion VARCHAR(255),
    Vida INT UNSIGNED NOT NULL,
    Damage INT UNSIGNED NOT NULL,
    Energia INT UNSIGNED NOT NULL,
    Tipo VARCHAR(25),
    Evolucion VARCHAR(25),
    Debilidad VARCHAR(100),
    Cantidad INT UNSIGNED NOT NULL,
    Fecha_Creacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    Fecha_Ultima_Modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id_cartaPokemon)
);

CREATE TABLE CartaEntrenador (
	id_cartaEntrenador INT UNSIGNED NOT NULL AUTO_INCREMENT,
    Nombre VARCHAR(100) NOT NULL,
    Descripcion VARCHAR(255),
    Tipo VARCHAR(25),
    Restricciones VARCHAR(255),
    Cantidad INT UNSIGNED NOT NULL,
    Duracion INT UNSIGNED,
    Fecha_Creacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    Fecha_Ultima_Modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id_cartaEntrenador)
);

CREATE TABLE CartaEnergia (
	id_cartaEnergia INT UNSIGNED NOT NULL AUTO_INCREMENT,
    Nombre VARCHAR(255) NOT NULL,
    Cantidad INT UNSIGNED NOT NULL,
    Fecha_Creacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    Fecha_Ultima_Modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id_cartaEnergia)
);

CREATE TABLE Mazo (
	id_mazo INT UNSIGNED NOT NULL AUTO_INCREMENT,
    Nombre VARCHAR(255) NOT NULL,
    Descripcion VARCHAR(255),
    num_cartas INT UNSIGNED NOT NULL,
    Fecha_Creacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    Fecha_Ultima_Modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id_mazo)
);

CREATE TABLE Vestimenta (
	id_vestimenta INT UNSIGNED NOT NULL AUTO_INCREMENT,
    Descripcion VARCHAR(255) NOT NULL,
    Fecha_Creacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    Fecha_Ultima_Modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id_vestimenta)
);

CREATE TABLE Recompensa (
	id_recompensa INT UNSIGNED NOT NULL AUTO_INCREMENT,
    id_jugador INT UNSIGNED NOT NULL,
    Cantidad INT UNSIGNED NOT NULL,
    Tipo VARCHAR(255),
    Fecha_Creacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    Fecha_Ultima_Modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id_recompensa)
);

CREATE TABLE Inventario (
	id_inventario INT UNSIGNED NOT NULL AUTO_INCREMENT,
    id_cartaPokemon INT UNSIGNED NOT NULL,
    id_cartaEnergia INT UNSIGNED NOT NULL,
    id_cartaEntrenador INT UNSIGNED NOT NULL,
    id_mazo INT UNSIGNED NOT NULL,
    id_jugador INT UNSIGNED NOT NULL,
    PRIMARY KEY (id_inventario),
    CONSTRAINT fk_inventario_cartaPokemon FOREIGN KEY (id_cartaPokemon) REFERENCES CartaPokemon(id_cartaPokemon) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_inventario_cartaEnergia FOREIGN KEY (id_cartaEnergia) REFERENCES CartaEnergia(id_cartaEnergia) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_inventario_cartaEntrenador FOREIGN KEY (id_cartaEntrenador) REFERENCES CartaEntrenador(id_cartaEntrenador) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_inventario_mazo FOREIGN KEY (id_mazo) REFERENCES Mazo(id_mazo) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE Jugador (
	id_jugador INT UNSIGNED NOT NULL AUTO_INCREMENT,
    id_vestimenta INT UNSIGNED NOT NULL,
    id_inventario INT UNSIGNED,
    Nombre VARCHAR(25),
    Descripcion VARCHAR(255),
    Nivel INT UNSIGNED NOT NULL,
    Contrasena VARCHAR(25),
    Victorias INT UNSIGNED NOT NULL,
    Derrotas INT UNSIGNED NOT NULL,
    Fecha_Creacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    Fecha_Ultima_Modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id_jugador),
    CONSTRAINT fk_jugador_vestimenta FOREIGN KEY (id_vestimenta) REFERENCES Vestimenta(id_vestimenta) ON DELETE RESTRICT ON UPDATE CASCADE
);

ALTER TABLE Recompensa ADD CONSTRAINT fk_recompensa_jugador FOREIGN KEY (id_jugador) REFERENCES Jugador(id_jugador) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE Inventario ADD CONSTRAINT fk_inventario_jugador FOREIGN KEY (id_jugador) REFERENCES Jugador(id_jugador) ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE Jugador ADD CONSTRAINT fk_jugador_inventario FOREIGN KEY (id_inventario) REFERENCES Inventario(id_inventario) ON DELETE RESTRICT ON UPDATE CASCADE;

CREATE TABLE Partida (
	id_partida INT UNSIGNED NOT NULL AUTO_INCREMENT,
    id_jugador1 INT UNSIGNED NOT NULL,
    id_jugador2 INT UNSIGNED NOT NULL,
    id_ganador INT UNSIGNED NOT NULL,
    Duracion INT UNSIGNED NOT NULL,
    Reglas_Del_Partido VARCHAR(255),
    Recompensas_Ganador INT UNSIGNED NOT NULL,
    Recompensas_Perdedor INT UNSIGNED NOT NULL,
    Fecha_Creacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    Fecha_Ultima_Modificacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id_partida),
    CONSTRAINT fk_partida_jugador1 FOREIGN KEY (id_jugador1) REFERENCES Jugador(id_jugador) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_partida_jugador2 FOREIGN KEY (id_jugador2) REFERENCES Jugador(id_jugador) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_partida_ganador FOREIGN KEY (id_ganador) REFERENCES Jugador(id_jugador) ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE Turno (
	id_turno INT UNSIGNED NOT NULL AUTO_INCREMENT,
    id_jugador INT UNSIGNED NOT NULL,
    id_partida INT UNSIGNED NOT NULL,
    Duracion INT UNSIGNED NOT NULL,
    Estatus BOOLEAN,
    Damage_Caused INT UNSIGNED NOT NULL,
    Estatus_Pokemon_En_Juego BOOLEAN,
    Damage_Received INT UNSIGNED NOT NULL,
    Cantidad_De_Acciones_Realizadas INT UNSIGNED NOT NULL,
    Cantidad_Cartas_Banca INT UNSIGNED NOT NULL,
    Cantidad_Cartas_Energia INT UNSIGNED NOT NULL,
    Cantidad_Cartas_Descartes INT UNSIGNED NOT NULL,
    Cantidad_Cartas_Jugadas INT UNSIGNED NOT NULL,
    Cantidad_Cartas_En_Mano INT UNSIGNED NOT NULL,
    Cantidad_Cartas_Recompensa INT UNSIGNED NOT NULL,
    PRIMARY KEY (id_turno),
    CONSTRAINT fk_turno_partida FOREIGN KEY (id_partida) REFERENCES Partida(id_partida) ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_turno_jugador FOREIGN KEY (id_jugador) REFERENCES Jugador(id_jugador) ON DELETE RESTRICT ON UPDATE CASCADE
);
