"use strict";
// Paul Araque Fernandez
// A01027626
// Escribe una función que tome un número y devuelva verdadero si es una potencia de dos, falso de lo contrario.
function verificarPotenciaDos(num) {
  // Un número es una potencia de 2 si log2(num) es entero
  return Math.log2(num) % 1 === 0;
}

// Ejemplo
console.log(verificarPotenciaDos(64));
console.log(verificarPotenciaDos(36));
console.log(verificarPotenciaDos(8));
console.log(verificarPotenciaDos(4));
console.log(verificarPotenciaDos(98));
