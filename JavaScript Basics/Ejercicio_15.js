"use strict";
// Paul Araque Fernandez
// A01027626
// Escribe una función que tome una lista de números y devuelva una nueva lista con todos los números en orden descendente.
function numerosOredenDescendente(lista) {
  // Ordenar la lista de mayor a menor utilizando una función de comparación
  lista.sort((a, b) => b - a);
  return lista;
}

// Ejemplo
const listaPrueba = [34, 52, 98, 78, 21, 4, 7, 45];
const prueba = numerosOredenDescendente(listaPrueba);
console.log(prueba);

console.log(numerosOredenDescendente([7, 9, 13, 2, 6, 23, 13]));
