"use strict";
// Paul Araque Fernandez
// A01027626
// Escribe una función que reciba un número, y regrese una lista con todos sus factores. Por ejemplo: factoriza(12) -> [1, 2, 3, 4, 6, 12].
function listaFactores(num) {
  let factoriales = [];
  // Iterar desde 1 hasta el número ingresado
  for (let i = 1; i < num + 1; i++) {
    // Si la división tiene como resto 0, agregarlo a la lista
    if (num % i === 0) {
      factoriales.push(i);
    }
  }
  return factoriales;
}

// Ejemplo
console.log(listaFactores(12));
console.log(listaFactores(13));
console.log(listaFactores(36));
