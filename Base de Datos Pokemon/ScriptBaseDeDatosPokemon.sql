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

-- Insertar Datos Tabla Carta Pokemon
INSERT INTO CartaPokemon (Nombre, Descripcion, Vida, Damage, Energia, Tipo, Evolucion, Debilidad, Cantidad) 
VALUES
("Charmander", "Lizard Pokemon. Length: 2'0, Weight: 19lbs", 50, 10, 1, "Fuego", "Charmaleon", "Agua, Tierra y Roca", 2),
("Pikachu", "Mouse Pokemon. Length: 1'4, Weight: 13lbs", 40, 20, 1, "Electrico", "Raichu", "Tierra", 3),
("Bulbasaur", "Seed Pokemon. Length: 2'4, Weight: 15lbs", 45, 15, 1, "Planta", "Ivysaur", "Fuego, Psíquico y Volador", 2),
("Squirtle", "Turtle Pokemon. Length: 1'8, Weight: 20lbs", 50, 10, 1, "Agua", "Wartortle", "Electrico y Planta", 3),
("Eevee", "Evolution Pokemon. Length: 1'0, Weight: 14lbs", 55, 5, 1, "Normal", "Flareon", "Lucha", 4),
("Arcanine", "Legendary Pokemon. Length: 6'03, Weight: 341.7lbs", 130, 150, 1, "Fuego", "No tiene", "Agua, Tierra y Roca", 1),
("Gengar", "Shadow Pokemon. Length: 4'11, Weight: 89lbs", 80, 30, 1, "Fantasma y Veneno", "No tiene", "Tierra, Psíquico, Fantasma y Siniestro", 2),
("Machop", "Superpower Pokemon. Length: 2'7, Weight: 43lbs", 70, 20, 1, "Lucha", "Machoke", "Psíquico, Volador y Hada", 1),
("Charmaleon", "Flame Pokemon. Length: 3'7, Weight: 42lbs", 80, 50, 1, "Fuego", "Charizard", "Agua, Tierra y Roca", 2),
("Mewtwo", "Genetic Pokemon. Length: 6'7, Weight: 269lbs", 60, 10, 1, "Psíquico", "No tiene", "Fantasma, Bicho y Siniestro", 1);
-- Consulta Tabla Carta Pokemon
SELECT * FROM CartaPokemon;

-- Insertar Datos Tabla Carta Entrenador
INSERT INTO CartaEntrenador (Nombre, Descripcion, Tipo, Restricciones, Cantidad, Duracion)
VALUES
("Correo de Entrenadores", "Mira las 4 primeras cartas de tu baraja. Puedes enseñar 1 carta de Entrenador que encuentres entre ellas (excepto Correo de Entrenadores) y ponerla en tu mano. Pon el resto de las cartas de nuevo en tu baraja y barájalas todas.", "Objeto", "Puedes jugar tantas cartas Objeto como quieras durante tu turno (antes de tu ataque)", 1, 1),
("Entrenador Maestro", "Roba 2 cartas. Si tu Pokémon Activo es un Pokémon de equipo de Relevos, roba 2 cartas más.", "Partidario", "Solo puedes jugar 1 carta de Partidario durante tu turno (antes de tu ataque).", 2, 1),
("Nivel Ball", "Busca en tu baraja 1 Pokémon con 90 PS o menos, enséñalo y ponlo en tu mano. Después, baraja las cartas de tu baraja.", "Objeto", "Puedes jugar tantas cartas Objeto como quieras durante tu turno (antes de tu ataque).", 3, 1),
("Paul", "Roba 3 cartas.", "Partidario", "Solo puedes jugar 1 carta de Partidario durante tu turno (antes de tu ataque).", 4, 1),
("Centro de Entrenamiento", "Cada Pokémon de Fase 1 y Fase 2 en juego (tanto tuyos como de tu rival) obtiene 30 PS más.", "Estadio", "Esta carta se mantiene en juego cuando la juegas. Descarta esta carta si entra en juego otra carta de Estadio. Si ya hay en juego otra crata con el mismo nombre, no puedes jugar esta carta.", 1, null),
("Entrenador de Gimnasio", "Roba 2 cartas. Si alguno de tus Pokémon quedó fuera de combate durante el último turno de tu rival, roba 2 cartas más.", "Partidario", "Solo puedes jugar 1 carta de Partidario durante tu turno (antes de tu ataque).", 4, 1),
("Turno Ball", "Lanza 2 monedas. POr cada cara, busca en tu baraja 1 Pokémon Evolución, enséñalo y ponlo en tu mano. Después, baraja las cartas de tu baraja.", "Objeto", "Puedes jugar tantas cartas Objeto como quieras durante tu turno (antes de tu ataque)", 2, 1),
("Cintia", "Pon las cartas de tu mano en tu baraja y barájalas todas. Después, roba 6 cartas.", "Partidario", "Solo puedes jugar 1 carta de Partidario durante tu turno (antes de tu ataque).", 1, 1),
("Super Ball", "Mira las 7 primeras cartas de tu baraja. Puedes enseñar un Pokémon que encuentres entre ellas y ponerlo en tu mano. Pon el resto de cartas de nuevo en tu baraja y barájalas todas.", "Objeto", "Puedes jugar tantas cartas Objeto como quieras durante tu turno (antes de tu ataque)", 3, 1),
("Prof. Encina", "Descarta las cartas de tu mano y roba 7 cartas.", "Partidario", "Solo puedes jugar 1 carta de Partidario durante tu turno (antes de tu ataque).", 2, 1);
-- Consulta Tabla Carta Entrenador
SELECT * FROM CartaEntrenador;

-- Insertar Datos Tabala Carta Energia
INSERT INTO CartaEnergia (Nombre, Cantidad)
VALUES
("Planta", 4),
("Fuego", 10),
("Agua", 3),
("Rayo", 5),
("Psíquica", 9),
("Lucha", 2),
("Oscura", 5),
("Metálica", 0),
("Hada", 7),
("Incolora", 13);
-- Consulta Tabla Carta Energia
SELECT * FROM CartaEnergia;

-- Insertar Datos Tabla Mazo
INSERT INTO Mazo (Nombre, Descripcion, num_cartas)
VALUES
("Mazo Fuego", "Mazo únicamente con cartas de Fuego", 30),
("Mazo Planta y Fuego", "Mazo con cartas de Fuego y Planta", 40),
("Mazo Inicial", "Primer Mazo utilizado", 20),
("Mazo Principal", "Mejor mazo que tengo actualmente", 35),
("Mazo Agua y Lucha", "Mazo con cartas de Agua y Lucha", 33),
("Mazo Rayo", "Mazo únicamente con cartas de Rayo", 25),
("Mazo Fuego, Metálica y Hada", "Mazo principalmente de Fuego, pero también con cartas Metálica y Hada", 45),
("Mazo Psíquica", "Mazo en construcción únicamente con cartas psíquica", 11),
("Mazo Planta y Agua", "Mazo con cartas de Planta y Agua", 37),
("Mazo Oscura", "Mazo únicamente con cartas Oscura", 26);
-- Consulta Tabla Mazo
SELECT * FROM Mazo;

-- Insertar Datos Tabla Vestimenta
INSERT INTO Vestimenta (Descripcion)
VALUES
("Vestimenta normal"),
("Vestimenta clásica"),
("Vestimenta de batman"),
("Vestimenta deportiva del equipo de fútbol Real Madrid"),
("Vestimenta de dormir"),
("Vestimenta formal de bodas (novio)"),
("Vestimenta formal de bodas (novia)"),
("Vestimenta de superman"),
("Vestimenta de soldado de guerra"),
("Vestimenta deportiva del equipo de fútbol Barcelona");
-- Consulta Tabla Vestimenta
SELECT * FROM Vestimenta;

-- Insertar Datos Tabla Jugador
INSERT INTO Jugador (Nombre, Descripcion, Nivel, Contrasena, Victorias, Derrotas, id_vestimenta)
VALUES
("Paul", "Jugador venezolano nivel 100", 100, "pass1", 349, 33, 1),
("Diegol", "Jugador mexicano nivel 34", 34, "pass2", 78, 14, 2),
("Ana", "Jugadora uruguaya nivel 64", 64, "pass3", 189, 23, 3),
("Reinaldo", "Jugador de Maracay nivel 97", 97, "pass4", 330, 30, 4),
("Juan", "Jugador peruano nivel 56", 56, "pass5", 123, 21, 5),
("Lucas", "Jugador español nivel 1", 1, "pass6", 0, 0, 6),
("Vale", "Jugadora mexicana nivel 87", 87, "pass7", 301, 42, 7),
("David", "Jugador ecuatoriano nivel 43", 43, "pass8", 134, 35, 6),
("Vinicius", "Jugador brasileño nivel 99", 99, "pass9", 340, 31, 8),
("Cristina", "Jugadora venezolana nivel 87", 87, "pass10", 287, 27, 9);
-- Consulta Tabla Jugador
SELECT * FROM Jugador;

-- Insertar Datos Tabla Recompensa
INSERT INTO Recompensa (Cantidad, Tipo, id_jugador)
VALUES
(279, "Monedas", 1),
(60, "Cristales", 1),
(978, "Créditos", 8),
(122, "Monedas", 2),
(167, "Monedas", 3),
(21, "Cristales", 5),
(35, "Cristales", 6),
(1000, "Créditos", 7),
(1342, "Créditos", 10),
(43, "Cristales", 9);
-- Consulta Tabla Recompensa
SELECT * FROM Recompensa;

-- Insertar Datos Tabla Inventario
INSERT INTO Inventario (id_cartaPokemon, id_cartaEnergia, id_cartaEntrenador, id_mazo, id_jugador)
VALUES
(1, 1, 1, 1, 1),
(1, 1, 2, 2, 1),
(2, 2, 4, 3, 2),
(3, 4, 3, 4, 3),
(6, 9, 8, 5, 4),
(8, 7, 6, 6, 9),
(7, 1, 5, 7, 7),
(5, 2, 7, 8, 6),
(9, 6, 2, 9, 3),
(4, 4, 4, 4, 4);
-- Consulta Tabla Inventario
SELECT * FROM Inventario;

-- Consulta de la lista de jugadores, junto a los detalles de su inventario
SELECT
    J.Nombre AS Jugador,
    CP.Nombre AS Carta_Pokemon,
    CP.Tipo AS Tipo_Pokemon,
    CE.Nombre AS Carta_Energia,
    CET.Nombre AS Carta_Entrenador,
    M.Nombre AS Mazo,
    I.id_jugador AS ID_Jugador
FROM
    Inventario I
JOIN Jugador J ON I.id_jugador = J.id_jugador
JOIN CartaPokemon CP ON I.id_cartaPokemon = CP.id_cartaPokemon
JOIN CartaEnergia CE ON I.id_cartaEnergia = CE.id_cartaEnergia
JOIN CartaEntrenador CET ON I.id_cartaEntrenador = CET.id_cartaEntrenador
JOIN Mazo M ON I.id_mazo = M.id_mazo;

-- Insertar Datos Tabla Partida
INSERT INTO Partida (id_jugador1, id_jugador2, id_ganador, Duracion, Reglas_Del_Partido, Recompensas_Ganador, Recompensas_Perdedor)
VALUES
(1, 2, 1, 30, "1. Pon 1 de tus Pokémon Básicos boca abajo como tu Pokémon Activo. 2.  Coloca hasta 5 Pokémon Básicos más boca abajo en tu Banca.", 231, 41),
(1, 5, 5, 45, "1. Pon 1 de tus Pokémon Básicos boca abajo como tu Pokémon Activo. 2.  Coloca hasta 5 Pokémon Básicos más boca abajo en tu Banca.", 301, 13),
(5, 8, 8, 60, "1. Pon 1 de tus Pokémon Básicos boca abajo como tu Pokémon Activo. 2.  Coloca hasta 5 Pokémon Básicos más boca abajo en tu Banca.", 297, 10),
(9, 3, 9, 47, "1. Pon 1 de tus Pokémon Básicos boca abajo como tu Pokémon Activo. 2.  Coloca hasta 5 Pokémon Básicos más boca abajo en tu Banca.", 278, 35),
(6, 4, 4, 49, "1. Pon 1 de tus Pokémon Básicos boca abajo como tu Pokémon Activo. 2.  Coloca hasta 5 Pokémon Básicos más boca abajo en tu Banca.", 201, 36),
(2, 8, 2, 37, "1. Pon 1 de tus Pokémon Básicos boca abajo como tu Pokémon Activo. 2.  Coloca hasta 5 Pokémon Básicos más boca abajo en tu Banca.", 221, 23),
(4, 5, 4, 33, "1. Pon 1 de tus Pokémon Básicos boca abajo como tu Pokémon Activo. 2.  Coloca hasta 5 Pokémon Básicos más boca abajo en tu Banca.", 222, 18),
(8, 2, 8, 31, "1. Pon 1 de tus Pokémon Básicos boca abajo como tu Pokémon Activo. 2.  Coloca hasta 5 Pokémon Básicos más boca abajo en tu Banca.", 264, 7),
(7, 10, 10, 48, "1. Pon 1 de tus Pokémon Básicos boca abajo como tu Pokémon Activo. 2.  Coloca hasta 5 Pokémon Básicos más boca abajo en tu Banca.", 297, 17),
(3, 1, 3, 50, "1. Pon 1 de tus Pokémon Básicos boca abajo como tu Pokémon Activo. 2.  Coloca hasta 5 Pokémon Básicos más boca abajo en tu Banca.", 289, 31);
-- Consulta Tabla Partida
SELECT * FROM Partida;

-- Insertar Dats Tabla Turno
INSERT INTO Turno (id_jugador, id_partida, Duracion, Estatus, Damage_Caused, Estatus_Pokemon_En_Juego, Damage_Received, Cantidad_De_Acciones_Realizadas, Cantidad_Cartas_Banca, Cantidad_Cartas_Energia, Cantidad_Cartas_Descartes, Cantidad_Cartas_Jugadas, Cantidad_Cartas_En_Mano, Cantidad_Cartas_Recompensa)
VALUES
(1, 1, 3, True, 10, True, 0, 2, 1, 1, 3, 2, 5, 6),
(2, 1, 4, True, 0, True, 10, 4, 2, 2, 17, 3, 4, 6),
(3, 2, 3, True, 0, False, 260, 1, 4, 3, 11, 4, 7, 5),
(4, 3, 2, True, 60, True, 0, 2, 1, 3, 4, 7, 6, 4),
(4, 4, 2, False, 0, False, 300, 0, 5, 3, 31, 2, 4, 5),
(5, 7, 1, True, 170, True, 0, 2, 1, 4, 14, 4, 4, 0),
(6, 6, 5, True, 20, False, 0, 4, 1, 5, 20, 3, 3, 2),
(7, 9, 5, False, 0, False, 310, 0, 3, 7, 23, 0, 5, 1),
(8, 9, 4, True, 80, True, 0, 2, 3, 8, 18, 1, 1, 1),
(9, 10, 6, False, 0, False, 280, 0, 1, 2, 25, 0, 2, 5);
-- Consulta Tabla Turno
SELECT * FROM Turno;

-- Consulta Datos de Turnp, Partida y Jugador
SELECT
    T.id_turno AS TurnoID,
    T.Duracion AS DuracionTurno,
    T.Estatus AS EstatusTurno,
    T.Damage_Caused AS DañoCausado,
    T.Damage_Received AS DañoRecibido,
    T.Cantidad_De_Acciones_Realizadas AS AccionesRealizadas,
    P.id_partida AS PartidaID,
    P.Duracion AS DuracionPartida,
    P.Reglas_Del_Partido AS Reglas,
    J.Nombre AS NombreJugador
FROM
    Turno T
JOIN Partida P ON T.id_partida = P.id_partida
JOIN Jugador J ON T.id_jugador = J.id_jugador;

