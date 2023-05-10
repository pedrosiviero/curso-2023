const express = require("express");
const turmaController = require("../controller/turma.controller");

const routes = new express.Router();

routes.get("/", turmaController.buscaTodos);
routes.get("/:id([0-9]+)", turmaController.buscaPorId);
routes.post("/", turmaController.inserir);
routes.delete("/:id([0-9]+)", turmaController.deletar);
routes.put("/:id([0-9]+)", turmaController.atualizar);

module.exports = routes; 