"use strict";
// Paul Araque Fernandez
// A01027626
// Escribe una función que reciba una cadena de texto y regrese una nueva con la primer letra de cada palabra en mayúscula.
function mayusPrimerasLetras(cadena) {
  // Variable para guardar la nueva cadena
  let cadenaFinal = "";
  const n = cadena.length;
  // Si la cadena está vacía, regresar null
  if (n === 0) {
    return null;
  } else {
    // Capitalizar la primera letra
    cadenaFinal = cadena[0].toUpperCase();
  }
  // Iterar la cadena desde la segunda posición
  for (let i = 1; i < n; i++) {
    // Capitalizar la letra si va después de un espacio
    if (cadena[i - 1] === " ") {
      cadenaFinal += cadena[i].toUpperCase();
    } else {
      cadenaFinal += cadena[i];
    }
  }
  return cadenaFinal;
}

const texto = "fran y beto son panas";
const textoFinal = mayusPrimerasLetras(texto);
console.log(textoFinal);

console.log(mayusPrimerasLetras("mbappe viene al madrid"));
