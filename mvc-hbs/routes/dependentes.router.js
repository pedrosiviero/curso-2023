const express = require("express");
const dependentesController = require("../controller/dependentes.controller");
const funcionariosRepository = require("../repository/funcionarios.repository");

const router = new express.Router();

routes.get("/", dependentesController.buscaTodos);
routes.get("/:id([0-9]+)", dependentesController.buscaPorId);
routes.post("/", dependentesController.inserir);
routes.delete("/:id([0-9]+)", dependentesController.deletar);
routes.put("/:id([0-9]+)", dependentesController.atualizar);
routes.post("/dependentes", dependentesController.inserirDependentes);
routes.get("/dependentes", dependentesController.buscaTodosDepDoFunc);

routes.get("/cadastro_dependentes", async (req, res) => {
    const funcionarios = await funcionariosRepository
    .buscaTodos();
    res.render("cadastro_dependentes", {funcionarios})
}
);

module.exports = routes;