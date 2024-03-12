"use strict";
// Paul Araque Fernandez
// A01027626
// Escribe una función que revise si una cadena de texto es un palíndromo o no.
function palindromo(cadena) {
  // Variables para comprobar si son palindromos o no
  let cadenaInicial = [];
  let cadenaFinal = [];

  const n = cadena.length;

  // Iterar sobre la cadena
  for (let i = 0; i < n; i++) {
    // Cambiar las letras a minúsculas
    let caracter = cadena[i].toLowerCase();
    // Ignorar los espacios
    if (caracter !== " ") {
      // Agregarlo al final de la lista
      cadenaInicial.push(caracter);
      // Agregarlo al principio de la lista
      cadenaFinal.unshift(caracter);
    } else {
      continue;
    }
  }

  // Convertir listas a cadenas
  const textoInicial = cadenaInicial.join("");
  const textoFinal = cadenaFinal.join("");

  // Verificar si son palíndromos
  return textoInicial === textoFinal;
}

const cadenaPrueba = "A luna ese anula";
const prueba = palindromo(cadenaPrueba);
console.log(prueba);

console.log(palindromo("Oso"));

console.log(palindromo("Araque"));
