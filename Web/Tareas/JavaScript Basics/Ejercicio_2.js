"use strict";
// Paul Araque Fernandez
// A01027626
// Escribe una función que implemente el algoritmo 'bubble-sort' para ordenar una lista de números.
function bubbleSort(arr) {
  const n = arr.length;
  // Iterar cada elemento del array
  for (let i = 0; i < n; i++) {
    // Iterar desde el final hasta la posición actual
    for (let j = n - 1; j > i; j--) {
      // Cambiar elementos si no están en el orden correcto
      if (arr[j] < arr[j - 1]) {
        [arr[j], arr[j - 1]] = [arr[j - 1], arr[j]];
      }
    }
  }
  return arr;
}

// Ejemplo
const arrPrueba = [4, 1, 9, 7, 8];
const arrFinal = bubbleSort(arrPrueba);

console.log(arrFinal);

console.log(bubbleSort([2, 1, 9, 8, 12]));
