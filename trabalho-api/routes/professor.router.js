const express = require("express");
const professorController = require("../controller/professor.controller");

const routes = new express.Router();

routes.get("/", professorController.buscaTodos);
routes.get("/:id([0-9]+)", professorController.buscaPorId);
routes.post("/", professorController.inserir);
routes.delete("/:id", professorController.deletar); 
routes.put("/:id", professorController.atualizar); 

module.exports = routes; 