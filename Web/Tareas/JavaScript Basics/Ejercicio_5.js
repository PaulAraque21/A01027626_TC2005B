"use strict";
// Paul Araque Fernandez
// A01027626
// Escribe una función que calcule el máximo común divisor de dos números.
function calcularMCD(a, b) {
  // Parar cuando el resto es 0
  while (b !== 0) {
    // Obtener el resto de a y b
    // Guardar el número pequeño en la primera parte del array
    // Guardar el resto en la segunda parte del array
    // Cuando el resto sea 0, a es el MCD
    [a, b] = [b, a % b];
  }
  return a;
}

const n1 = 48;
const n2 = 18;

const mcd = calcularMCD(n1, n2);

console.log(mcd);
