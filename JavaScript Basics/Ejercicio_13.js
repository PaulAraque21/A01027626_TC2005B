"use strict";
// Paul Araque Fernandez
// A01027626
// Escribe una función que tome una lista de cadenas de texto y devuelva la cadena más frecuente.

function cadenaMasFrecuente(lista) {
  const n = lista.length;
  // Variables para almacenar las cadenas, sus repeticiones y la cantidad que más se repite
  let mapaCadenas = {};
  let cantMax = 0;
  // Iterar sobre la lista de cadenas de texto
  for (let i = 0; i < n; i++) {
    // Agregarlo al mapa e ir sumándole 1
    mapaCadenas[lista[i]] = (mapaCadenas[lista[i]] || 0) + 1;
    // Guardar el valor que más se repite
    if (mapaCadenas[lista[i]] > cantMax) {
      cantMax = mapaCadenas[lista[i]];
    }
  }
  // Lista para almacenar las cadenas que más se repiten
  let listaCadenasMasRepetidas = [];
  // Iterar sobre el mapa para obtener los que más se repiten
  for (const llave in mapaCadenas) {
    if (mapaCadenas[llave] === cantMax) {
      listaCadenasMasRepetidas.push(llave);
    }
  }

  return listaCadenasMasRepetidas;
}

// Ejemplo
const listaCadenasPrueba = [
  "Amigo",
  "Papa",
  "Hamburguesa",
  "Araque",
  "Hamburguesa",
  "Telefono",
  "Papa",
  "Hamburguesa",
  "Papa",
];
const prueba = cadenaMasFrecuente(listaCadenasPrueba);
console.log(prueba);

console.log(
  cadenaMasFrecuente(["Madrid", "Madrid", "Madrid", "Y", "Nada", "Mas"])
);
