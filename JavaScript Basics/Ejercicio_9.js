"use strict";
// Paul Araque Fernandez
// A01027626
// Escribe una función que reciba como parámetro una lista de cadenas de texto, y regrese la longitud de la cadena más corta.
function longitudCadenaCorta(lista) {
  // Variable para almacenar las longitudes
  let longitudCadenas = lista[0].length;

  // Lista para almacenar las cadenas cortas
  let cadenasCortas = [];

  const n = lista.length;
  // Iterar sobre la lista
  for (let i = 0; i < n; i++) {
    let longitudActual = lista[i].length;
    // Comparar la longitud actual con la más corta
    if (longitudActual < longitudCadenas) {
      cadenasCortas = [];
      // Si es más corta, actualizar la longitud más corta
      longitudCadenas = longitudActual;
    } else if (longitudActual === longitudCadenas) {
      // Agregar la palabra a una lista por si se quisiera imprimir
      cadenasCortas.push(lista[i]);
    } else {
      continue;
    }
  }
  return longitudCadenas;
}

// Ejemplo
const cadenas = [
  "Paralelas",
  "Diegos",
  "Ricardos",
  "Hola",
  "Araque",
  "Un",
  "Television",
  "Par",
  "El",
  "Pantalon",
];
const prueba = longitudCadenaCorta(cadenas);
console.log(prueba);

console.log(longitudCadenaCorta(["Hamburguesa", "Tele", "Rectangulo"]));
