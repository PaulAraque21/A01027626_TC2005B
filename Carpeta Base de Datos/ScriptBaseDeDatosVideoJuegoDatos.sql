-- Seleccionar la Base de Datos
USE Zambombazo;

-- Insertar Datos Tabla Equipo
-- Solo 4 filas dummy, ya que el juego solo contiene 4 equipos
INSERT INTO Equipo (Nombre, Descripcion, Cantidad_Defensas, Cantidad_Medios, Cantidad_Delanteros) 
VALUES 
('Real Madrid', 'Equipo de la capital española con 10 defensas, 8 mediocampos y 4 delanteros.', 10, 8, 4),
('Barcelona', 'Equipo de Barcelona con 10 defensas, 6 mediocampos y 5 delanteros', 10, 6, 5),
('Atlético Madrid', 'Otro equipo de la capital española con 10 defensas, 7 mediocampos y 5 delanteros', 10, 7, 5),
('Sevilla', 'Equipo con sede en Sevilla que tiene 11 defensas, 7 mediocampos y 4 delanteros', 11, 7, 4);
-- Consulta Tabla Equipo
SELECT * FROM Equipo;

-- Insertar Datos Tabla Carta
INSERT INTO Carta (Nombre, Posicion, Ataque, Mediocampo, Defensa, Costo, id_equipo) 
VALUES 
('Thibaut Courtois', 'PO', 32, 40, 86, 60, 1),
('Andriv Lunin', 'PO', 30, 37, 82, 30, 1),
('Kepa Arrizabalaga', 'PO', 31, 38, 80, 20, 1),
('Dani Carvajal', 'LD', 77, 80, 84, 40, 1),
('Lucas Vázquez', 'LD', 74, 78, 81, 20, 1),
('Eder Militao', 'DFC', 69, 72, 87, 60, 1),
('Antonio Rudiger', 'DFC', 66, 69, 86, 50, 1),
('David Alaba', 'DFC', 72, 80, 84, 40, 1),
('Nacho Fernández', 'DFC', 62, 69, 82, 20, 1),
('Ferland Mendy', 'LI', 70, 76, 84, 30, 1),
('Fran García', 'LI', 70, 74, 81, 20, 1),
('Aurelian Tchouaméni', 'MC', 76, 82, 84, 40, 1),
('Eduardo Camaving', 'MC', 81, 84, 82, 30, 1),
('Toni Kroos', 'MC', 83, 86, 80, 50, 1),
('Federico Valverde', 'MC', 84, 86, 85, 50, 1),
('Luka Modric', 'MC', 84, 86, 84, 50, 1),
('Dani Ceballos', 'MC', 79, 80, 73, 10, 1),
('Arda Guller', 'MC', 80, 80, 74, 10, 1),
('Jude Bellingham', 'MC', 85, 88, 82, 70, 1),
('Vinicius Jr', 'EI', 89, 82, 51, 80, 1),
('Rodrygo Goes', 'ED', 85, 81, 57, 50, 1),
('Brahim Díaz', 'ED', 84, 80, 56, 30, 1),
('Joselu Mato', 'DC', 82, 76, 54, 20, 1),
('Ter Stegen', 'PO', 34, 40, 85, 50, 2),
('Iñaki Peña', 'PO', 22, 34, 77, 10, 2),
('João Cancelo', 'LD', 79, 81, 82, 20, 2),
('Sergi Roberto', 'LD', 64, 71, 79, 10, 2),
('Ronald Araújo', 'DFC', 66, 70, 86, 60, 2),
('Jules Koundé', 'DFC', 67, 71, 84, 40, 2),
('Iñigo Martínez', 'DFC', 60, 67, 82, 20, 2);
-- Consulta Tabla Carta
SELECT * FROM Carta;

-- Consulta para ver a qué equipo pertenece cada jugador
SELECT Equipo.Nombre AS Equipo, Carta.Nombre AS Carta
FROM Carta
JOIN Equipo ON Carta.id_equipo = Equipo.id_equipo;

-- Insertar Datos Tabla Usuario
INSERT INTO Usuario (Nombre, Contrasena, Monedas, Victorias, Derrotas, Empates, Progreso, esBot, cantidadDineroPartida)
VALUES
('Paul', 'pass1', 1003, 23, 4, 1, 1021, FALSE, 500),
('Diego', 'pass2', 243, 12, 14, 2, 586, FALSE, 120),
('Beto', 'pass3', 100, 3, 12, 0, 482, FALSE, 100),
('CPU1', 'pass4', 0, 2, 1, 0, 387, TRUE, 100),
('Paolo', 'pass5', 200, 5, 2, 0, 501, FALSE, 120),
('CPU2', 'pass6', 0, 1, 4, 0, 341, TRUE, 100),
('CPU3', 'pass7', 0, 10, 2, 0, 590, TRUE, 120),
('CPU4', 'pass8', 0, 17, 1, 0, 732, TRUE, 160),
('CPU5', 'pass9', 0, 15, 1, 0, 689, TRUE, 150),
('CPU6', 'pass10', 0, 14, 1, 0, 654, TRUE, 150),
('CPU7', 'pass11', 0, 1, 1, 0, 413, TRUE, 100),
('Pablo', 'pass12', 406, 768, 349, 0, 2037, FALSE, 600),
('Vale', 'pass13', 201, 10, 35, 0, 203, FALSE, 100),
('Luis', 'pass14', 643, 43, 44, 1, 690, FALSE, 160),
('Francisco', 'pass15', 765, 123, 31, 3, 1340, FALSE, 520),
('Gabriel', 'pass16', 2345, 101, 46, 2, 1286, FALSE, 510),
('Lucas', 'pass17', 432, 234, 123, 4, 1781, FALSE, 560),
('CPU8', 'pass18', 0, 13, 12, 0, 502, TRUE, 120),
('Joseph', 'pass19', 107, 1, 2, 0, 399, FALSE, 100),
('CPU9', 'pass20', 0, 1, 4, 0, 351, TRUE, 100),
('CPU10', 'pass21', 0, 15, 2, 0, 523, TRUE, 130),
('CPU11', 'pass22', 0, 1, 1, 0, 413, TRUE, 100),
('CPU12', 'pass23', 0, 0, 0, 0, 400, TRUE, 100),
('CPU13', 'pass24', 0, 8, 5, 0, 567, TRUE, 130),
('CPU14', 'pass25', 0, 7, 19, 1, 403, TRUE, 100),
('Isaac', 'pass26', 89, 5, 7, 1, 467, FALSE, 110),
('Ricardo', 'pass27', 222, 2, 2, 2, 433, FALSE, 100),
('Mateo', 'pass28', 9872, 589, 321, 0, 2433, FALSE, 600),
('Maria', 'pass29', 407, 10, 3, 0, 516, FALSE, 120),
('Daniela', 'pass30', 543, 56, 39, 2, 745, FALSE, 170);
-- Consulta Tabla Usuario
SELECT * FROM Usuario;

-- Insertar Datos en Inventario
INSERT INTO Inventario (id_usuario)
VALUES
(1),
(2),
(3),
(4),
(5),
(6),
(7),
(8),
(9),
(10),
(11),
(12),
(13),
(14),
(15),
(16),
(17),
(18),
(19),
(20),
(21),
(22),
(23),
(24),
(25),
(26),
(27),
(28),
(29),
(30);
-- Consultar Tabla Inventario
SELECT * FROM Inventario;

-- Insertar Datos InventarioCarta
INSERT INTO InventarioCarta (id_inventario, id_carta, cantidad)
VALUES 
(1, 1, 3),
(1, 2, 2),
(1, 3, 1),
(1, 4, 2),
(1, 5, 2),
(1, 11, 2),
(1, 12, 3),
(1, 13, 1),
(1, 14, 4),
(1, 15, 1),
(1, 21, 2),
(1, 22, 1),
(1, 23, 1),
(1, 24, 1),
(1, 25, 1),
(2, 6, 3),
(2, 7, 2),
(2, 8, 1),
(2, 9, 2),
(2, 10, 2),
(2, 16, 2),
(2, 17, 3),
(2, 18, 1),
(2, 19, 4),
(2, 20, 1),
(2, 26, 2),
(2, 27, 1),
(2, 28, 1),
(2, 29, 1),
(2, 30, 1);
-- Consultar Tabla InventarioCarta
SELECT * FROM InventarioCarta;

-- Consulta combinando varios datos
SELECT
  U.id_usuario,
  U.Nombre AS NombreUsuario,
  I.id_inventario,
  C.id_carta,
  C.Nombre AS NombreCarta,
  IC.cantidad
FROM Usuario U
JOIN Inventario I ON U.id_usuario = I.id_usuario
JOIN InventarioCarta IC ON I.id_inventario = IC.id_inventario
JOIN Carta C ON IC.id_carta = C.id_carta;

-- Insertar Datos Tabla Formacion
-- Solo van a existir 5 formaciones dentro del juego
INSERT INTO Formacion (TipoDeFormacion, pos1, cord1, pos2, cord2, pos3, cord3, pos4, cord4, pos5, cord5, pos6, cord6, pos7, cord7)
VALUES
('3-2-1', 'GK', '-560, 0', 'DFC', '-404, 0', 'DFC', '-404, -230', 'DFC', '-404, 230', 'MC', '-260, -124', 'MC', '-260, 124', 'DC', '-119, 0'),
('3-1-2', 'GK', '-560, 0', 'DFC', '-404, 0', 'DFC', '-404, -230', 'DFC', '-404, 230', 'MC', '-255, 0', 'DC', '-119, -124', 'DC', '-119, 124'),
('2-3-1', 'GK', '-560, 0', 'DFC', '-404, 146', 'DFC', '-404, -146', 'MC', '-260, 0', 'MC', '-260, -221', 'MC', '-260, 221', 'DC', '-108, 0'),
('2-2-2', 'GK', '-560, 0', 'DFC', '-404, 146', 'DFC', '-404, -146', 'MC', '-260, -221', 'MC', '-260, 221', 'DC', '-115, 90', 'DC', '-115, -90'),
('2-1-3', 'GK', '-560, 0', 'DFC', '-404, 146', 'DFC', '-404, -146', 'MC', '-260, 0', 'DC', '-108, 0', 'DC', '-108, -220', 'DC', '-108, 220');
-- Consulta Tabla Formación
SELECT * FROM Formacion;

-- Insertar Datos Tabla Turno
INSERT INTO Partido (id_jugador1, id_formacion_jugador1, id_jugador2, id_formacion_jugador2, id_ganador, id_formacion_ganador, resultado)
VALUES
(1, 1, 2, 1, 1, 1, '4-3'),
(1, 1, 3, 1, 1, 1, '4-2'),
(1, 1, 23, 1, 1, 1, '4-3'),
(2, 1, 12, 1, 2, 1, '4-3'),
(2, 1, 30, 2, 30, 2, '4-3'),
(2, 1, 13, 5, 2, 1, '4-2'),
(2, 2, 10, 5, 10, 5, '4-1'),
(3, 2, 28, 4, 3, 2, '4-0'),
(3, 1, 27, 4, 3, 1, '4-0'),
(3, 2, 11, 5, 11, 2, '4-1'),
(4, 2, 29, 2, 29, 2, '4-3'),
(4, 3, 22, 3, 22, 3, '4-2'),
(5, 4, 13, 3, 5, 4, '4-3'),
(5, 3, 27, 3, 27, 3, '4-3'),
(5, 4, 30, 2, 5, 4, '4-3'),
(6, 5, 1, 2, 6, 5, '4-2'),
(7, 5, 23, 1, 23, 1, '4-1'),
(7, 5, 24, 3, 24, 3, '4-0'),
(7, 5, 26, 2, 26, 2, '4-0'),
(7, 4, 3, 4, 7, 4, '4-1'),
(8, 3, 14, 5, 8, 3, '4-3'),
(8, 3, 15, 5, 15, 5, '4-2'),
(9, 3, 16, 2, 16, 2, '4-3'),
(9, 4, 19, 3, 9, 4, '4-3'),
(9, 4, 20, 1, 9, 4, '4-3'),
(10, 4, 1, 1, 10, 4, '4-2'),
(10, 5, 4, 4, 10, 5, '4-1'),
(10, 2, 6, 4, 6, 4, '4-0'),
(11, 1, 5, 2, 11, 1, '4-0'),
(11, 3, 7, 1, 7, 1, '4-1');
-- Consulta Tabla Partido
SELECT * FROM Partido;

-- Insertar Datos Turno
INSERT INTO Turno (id_partido, id_carta, id_usuario, esGol, Tipo_stat, Valor_stat)
VALUES
(1, 23, 1, FALSE, 'Ataque', 81),
(1, 29, 2, TRUE, 'Defensa', 84),
(1, 12, 2, FALSE, 'Mediocampo', 82),
(1, 13, 1, TRUE, 'Mediocampo', 84),
(1, 2, 1, FALSE, 'Defensa', 82),
(1, 20, 2, TRUE, 'Ataque', 89),
(1, 16, 2, FALSE, 'Mediocampo', 86),
(1, 19, 1, TRUE, 'Mediocampo', 88),
(1, 25, 1, FALSE, 'Defensa', 77),
(1, 22, 2, TRUE, 'Ataque', 84),
(1, 21, 1, FALSE, 'Ataque', 85),
(1, 1, 2, TRUE, 'Defensa', 86),
(1, 27, 2, FALSE, 'Defensa', 79),
(1, 15, 1, TRUE, 'Ataque', 84),
(2, 17, 1, FALSE, 'Mediocampo', 80),
(2, 26, 2, TRUE, 'Mediocampo', 81),
(2, 30, 2, FALSE, 'Defensa', 82),
(2, 14, 1, TRUE, 'Ataque', 83),
(2, 7, 1, FALSE, 'Defensa', 86),
(2, 20, 2, TRUE, 'Ataque', 89),
(3, 23, 1, FALSE, 'Ataque', 82),
(3, 29, 2, TRUE, 'Defensa', 84),
(3, 21, 2, FALSE, 'Ataque', 85),
(3, 6, 1, TRUE, 'Defensa', 87),
(4, 16, 1, FALSE, 'Mediocampo', 86),
(5, 19, 2, TRUE, 'Mediocampo', 88),
(6, 13, 2, FALSE, 'Mediocampo', 84),
(6, 15, 1, TRUE, 'Mediocampo', 86),
(6, 1, 1, FALSE, 'Defensa', 86),
(6, 20, 2, TRUE, 'Ataque', 89);
-- Consulta Tabla Turno
SELECT * FROM Turno;

-- Insertar Datos Tabla Estadistica
INSERT INTO Estadistica (id_partido, id_carta, id_usuario, id_turno, Tiempo_partida, Numero_jugadas)
VALUES
(1, 23, 1, 1, 90, 10),
(1, 26, 2, 2, 103, 16),
(1, 28, 3, 3, 143, 18),
(1, 29, 4, 4, 87, 17),
(1, 25, 5, 5, 86, 18),
(1, 21, 6, 6, 99, 19),
(1, 22, 7, 7, 93, 19),
(1, 27, 8, 8, 91, 12),
(1, 20, 9, 9, 135, 11),
(1, 24, 10, 10, 76, 11),
(1, 30, 11, 11, 79, 13),
(1, 12, 12, 12, 78, 10),
(1, 11, 13, 13, 95, 16),
(1, 17, 14, 14, 82, 15),
(2, 19, 15, 15, 83, 14),
(2, 15, 16, 16, 86, 12),
(2, 14, 17, 17, 87, 18),
(2, 16, 18, 18, 88, 16),
(2, 15, 19, 19, 200, 10),
(2, 18, 20, 20, 123, 10),
(3, 1, 21, 21, 154, 11),
(3, 2, 22, 22, 176, 11),
(3, 3, 23, 23, 156, 19),
(3, 6, 24, 24, 198, 18),
(4, 5, 25, 25, 62, 18),
(5, 4, 26, 26, 67, 13),
(6, 9, 27, 27, 142, 14),
(6, 7, 28, 28, 102, 16),
(6, 8, 29, 29, 137, 15),
(6, 10, 30, 30, 132, 15);
-- Consulta Tabla Estadistica
SELECT * FROM Estadistica;

-- Consulta Datos combinados
SELECT
    E.id_estadistica AS EstadisticaID,
    P.id_partido AS PartidoID,
    U.Nombre AS Usuario,
    C.Nombre AS Carta,
    T.esGol AS Gol,
    T.Tipo_stat AS TipoEstadistica,
    T.Valor_stat AS ValorEstadistica,
    E.Tiempo_partida AS TiempoPartida,
    E.Numero_jugadas AS NumeroJugadas
FROM Estadistica E
JOIN Turno T ON E.id_turno = T.id_turno
JOIN Partido P ON E.id_partido = P.id_partido
JOIN Usuario U ON E.id_usuario = U.id_usuario
JOIN Carta C ON E.id_carta = C.id_carta;
