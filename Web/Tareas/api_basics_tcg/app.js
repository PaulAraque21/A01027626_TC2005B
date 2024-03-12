"use strict";

// Actividad en clase: API básico para cartas
// Paul Araque Fernandez
// A01027626

import express from "express";

const app = express();

const port = 3000;

app.use(express.json());

let cartas = [];
let idCarta = 0;

// Obtener las cartas
app.get("/api/api_basics_tcg/cartas", (req, resp) => {
  // SI el tamaño del arreglo cartas es 0, no hay ninguna carta
  if (cartas.length === 0) {
    console.log("No hay cartas");
    resp.status(404).send("No hay cartas");
  } else {
    console.log(cartas);
    resp.status(200).send(cartas);
  }
});

// Regresar carta en base a ID
app.get("/api/api_basics_tcg/:id", (req, resp) => {
  const id = parseInt(req.params.id);
  // Ver si se encuentra la carta
  const carta = cartas.find((card) => card.id === id);
  if (carta) {
    console.log(carta);
    resp.status(200).json(carta);
  } else {
    console.log("La carta no existe");
    resp.status(404).send("La carta no existe");
  }
});

// Añadir Carta
app.post("/api/api_basics_tcg/addCarta", (req, resp) => {
  const nuevaCarta = req.body;
  // Arreglo con todos los atributos necesarios de una carta
  const atributosNecesarios = [
    "nombre",
    "id_equipo",
    "nacionalidad",
    "posicion",
    "ataque",
    "mediocampo",
    "defensa",
    "energia",
    "url_imagen",
  ];
  let TodosLosAtributos = true;

  // Verificar que la nueva carta tenga todos los atributos
  for (let i = 0; i < atributosNecesarios.length; i++) {
    if (!(atributosNecesarios[i] in nuevaCarta)) {
      TodosLosAtributos = false;
      break;
    }
  }

  // Si no tiene todos los id, regresar mensaje de error.
  if (!TodosLosAtributos) {
    console.log(
      'Faltan atributos en la carta. Por favor verifica que cumples con todos estos atributos: "nombre", "id_equipo", "nacionalidad", "posicion", "ataque", "mediocampo","defensa", "energia", "url_imagen"'
    );
    return resp
      .status(400)
      .send(
        'Faltan atributos en la carta. Por favor verifica que cumples con todos estos atributos: "nombre", "id_equipo", "nacionalidad", "posicion", "ataque", "mediocampo","defensa", "energia", "url_imagen"'
      );
  }

  // Agregar el siguiente id y la carta
  idCarta += 1;
  nuevaCarta.id = idCarta;
  cartas.push(nuevaCarta);
  console.log("Carta agregada exitosamente");
  resp.status(201).send(`Carta agregada exitosamente: ${nuevaCarta}`);
});

// Borrar una carta en base a su ID
app.delete("/api/api_basics_tcg/:id", (req, resp) => {
  const id = parseInt(req.params.id);
  // Encontrar el indice de la carta
  const indice = cartas.findIndex((card) => card.id === id);
  // Si es mayor a -1, se encontró una carta, por lo que se usa splice para borrarla
  if (indice > -1) {
    cartas.splice(indice, 1);
    console.log(`Carta con id ${id} eliminada de forma exitosa.`);
    resp.status(200).send(`Carta con id ${id} eliminada de forma exitosa.`);
  } else {
    console.log(`La carta con id ${id} no existe.`);
    resp.status(404).send(`La carta con id ${id} no existe.`);
  }
});

// Actualizar una carta en base a su ID
app.put("/api/api_basics_tcg/:id", (req, resp) => {
  const id = parseInt(req.params.id);
  // Encontrar el indice de la carta
  const indice = cartas.findIndex((card) => card.id === id);
  // Si es igual a -1, no se encontró la carta
  if (indice === -1) {
    console.log(`La carta con indice ${indice} no existe.`);
    return resp.status(404).json(`La carta con indice ${indice} no existe.`);
  }
  // Actualizar la carta
  const atributosParaActualizar = req.body;
  for (const atributo in atributosParaActualizar) {
    cartas[indice][atributo] = atributosParaActualizar[atributo];
  }
  console.log(`Carta con id ${id} actualizada de forma exitosa.`);
  resp.status(200).send(`Carta con id ${id} actualizada de forma exitosa.`);
});

app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});
