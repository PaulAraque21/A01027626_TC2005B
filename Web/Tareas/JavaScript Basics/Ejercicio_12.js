"use strict";
// Paul Araque Fernandez
// A01027626
// Escribe una función que tome una lista de números y devuelva la mediana y la moda.
function medianaModa(lista) {
  // Ordenar la lista de menor a mayor utilizando una función de comparación
  lista.sort((a, b) => a - b);

  const n = lista.length;

  // Calcular mediana
  let mediana = 0;
  // Si la cantidad de números es par, sacar el promedio de las dos de en medio
  if (n % 2 === 0) {
    const position1 = n / 2 - 1;
    const position2 = n / 2;
    mediana = (lista[position1] + lista[position2]) / 2;
  } else {
    // Si la cantidad es impar, agarrar el número de en medio
    const position = Math.floor(n / 2);
    mediana = lista[position];
  }

  // Calcular moda
  let cantMax = 0;
  let moda = {};
  // Iterar sobre el arreglo
  for (let i = 0; i < n; i++) {
    // Agregarlo al mapa y sumarle 1 a la cantidad de veces que aparece
    moda[lista[i]] = (moda[lista[i]] || 0) + 1;
    // Guardar el valor máximo del número que se repite
    if (moda[lista[i]] > cantMax) {
      cantMax = moda[lista[i]];
    }
  }

  // Variable para almacenar todas la modas
  const resultModa = [];
  // Iterar sobre el mapa para obtener los que más se repiten
  for (const llave in moda) {
    if (moda[llave] === cantMax) {
      resultModa.push(llave);
    }
  }

  return `Mediana: ${mediana} \nModa: ${resultModa}`;
}

// Ejemplo
const listaPrueba = [20, 30, 10, 43, 12, 30, 20];
const prueba = medianaModa(listaPrueba);
console.log(prueba);

console.log(medianaModa([1, 2, 3, 5, 8, 9, 13, 25, 5]));
