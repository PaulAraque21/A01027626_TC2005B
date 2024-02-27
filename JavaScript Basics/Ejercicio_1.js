"use strict";
// Paul Araque Fernandez
// A01027626
// Escribe una función que encuentre el primer caracter de un cadena de texto que no se repite. Prueba tu función con: 'abacddbec'
const primerCaracterNoRepetido = function (string) {
  // Crear mapa para contar la cantidad que se repiten cada caracter
  const cantidades = {};
  // Iterar sobre la cadena y contar los caracteres
  for (let i = 0; i <= string.length; i++) {
    const caracter = string[i];
    // Incrementar la cantidad en el mapa "cantidades"
    cantidades[caracter] = (cantidades[caracter] || 0) + 1;
  }
  // Encontrar el primer caracter que no se repite
  for (let j = 0; j <= string.length; j++) {
    const caracterFinal = string[j];
    // Ver que la cantidad sea igual a 1
    if (cantidades[caracterFinal] === 1) {
      return caracterFinal;
    }
  }

  // En caso de que no encuentre ningun caracter repetido
  return null;
};

// Probar que funcione
const prueba = primerCaracterNoRepetido("abacddbec");
console.log(prueba);
