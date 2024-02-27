"use strict";
// Paul Araque Fernandez
// A01027626
// Escribe una función que quite los elementos duplicados de un arreglo y regrese una lista con los elementos que quedan. Por ejemplo: quitaDuplicados([1, 0, 1, 1, 0, 0]) -> [1, 0]

function quitaDuplicados(arr) {
  const n = arr.length;
  // Objeto para ir poniendo los elementos en un mapa y la cantidad que se repiten
  let cant = {};
  // Lista con el resultado final
  let result = [];
  // Iterar sobre el arreglo
  for (let i = 0; i < n; i++) {
    // Agregar el elemento al mapa e incrementar la cantidad de veces que aparece
    cant[arr[i]] = (cant[arr[i]] || 0) + 1;
    // Si la cantidad de veces en el es 1, agregarlo a la lista del resultado final
    if (cant[arr[i]] === 1) {
      result.push(arr[i]);
    }
  }
  return result;
}

// Ejemplo
const prueba = quitaDuplicados([1, 0, 1, 1, 0, 0]);
console.log(prueba);

console.log(quitaDuplicados([2, 2, 3, 3, 2, 4, 7, 3, 7]));
