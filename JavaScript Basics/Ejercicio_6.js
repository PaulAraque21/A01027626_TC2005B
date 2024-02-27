"use strict";
// Paul Araque Fernandez
// A01027626
// Crea una función que cambie una cadena de texto a 'Hacker Speak'. Por ejemplo, para la cadena 'Javascript es divertido', su hacker speak es: 'J4v45c1pt 35 d1v3rt1d0'.
function hackerSpeak(cadena) {
  const conversion = {
    i: "1",
    z: "2",
    e: "3",
    a: "4",
    s: "5",
    b: "8",
    g: "9",
    o: "0",
  };

  const n = cadena.length;
  let final = "";
  // Iterar sobre la cadena
  for (let i = 0; i < n; i++) {
    // Cambiar cualquier mayúscula a minúscula para compararlo en el mapa
    let actual = cadena[i].toLowerCase();
    // Ver si está en el mapa y agregarlo a la nueva cadena. Si no está en el mapa, se agrega el carácter actual
    final += conversion[actual] || cadena[i];
  }

  return final;
}

// Ejemplo
const texto = "JavaScript es divertido";
const resultFinal = hackerSpeak(texto);

console.log(resultFinal);
console.log(hackerSpeak("Mbappe viene al Madrid"));
