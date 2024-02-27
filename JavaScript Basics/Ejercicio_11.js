"use strict";
// Paul Araque Fernandez
// A01027626
// Escribe una función que tome una lista de cadena de textos y devuelva una nueva lista con todas las cadenas en orden alfabético.
function cadenasOrdenAlfabetico(cadenas) {
  // Para crear nueva lista se utiliza .slice() y así no modificar la original. Se cambia todo a minísculas y si "a" es menor que "b" se agrega antes
  const listaOrdenada = cadenas
    .slice()
    .sort((a, b) => (a.toLowerCase() < b.toLowerCase() ? -1 : 1));
  return listaOrdenada;
}

// Ejemplo
const listaCadenas = ["Hola", "Araque", "Lucas", "Abadi", "Lara"];
const prueba = cadenasOrdenAlfabetico(listaCadenas);
console.log(prueba);
