"use strict";
// Paul Araque Fernandez
// A01027626
// Escribe dos funciones: la primera que invierta un arreglo de números y regrese un nuevo arreglo con el resultado; la segunda que modifique el mismo arreglo que se pasa como argumento. No se permite usar la función integrada 'reverse'.

// Función para invertir arreglo y regresar uno nuevo
function invertirArregloNuevo(arr) {
  const n = arr.length;
  let newArr = [];
  // Iterar sobre cada elemento del arreglo
  for (let i = n - 1; i >= 0; i--) {
    // Agregar el elemento al nuevo arreglo
    newArr.push(arr[i]);
  }
  return newArr;
}

// Función para invertir el mismo arreglo del parámetro
function invertirMismoArreglo(arr) {
  const n = arr.length;
  // Iterar sobre cada elemento del arreglo hasta la mitad
  for (let i = 0; i < n / 2; i++) {
    // Cambiar el primer elemento por el último, luego el segundo por el penúltimo y así sucesivamente
    [arr[i], arr[n - 1 - i]] = [arr[n - 1 - i], arr[i]];
  }
  return arr;
}

const arrPrueba = [4, 1, 9, 7, 8];
// Ejemplo Nuevo Arreglo
const arrFinal = invertirArregloNuevo(arrPrueba);
// Ejemplo Mismo Arreglo
const mismoArrFinal = invertirMismoArreglo(arrPrueba);

console.log(`Nuevo arreglo invertido: ${arrFinal}`);
console.log(`Mismo arreglo invertido: ${mismoArrFinal}`);
