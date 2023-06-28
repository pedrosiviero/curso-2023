const express = require("express");
const usuarioController = require("../controller/usuario.controller");
const usuarioRepository = require("../repository/usuario.repository");

const routes = new express.Router()


routes.get("/buscartudo", usuarioController.buscaTodos);
routes.get("/:id_usuario([0-9]+)", usuarioController.buscaPorId);
routes.post("/inserirEnd", usuarioController.InserirEnd);
routes.post("/inserir", usuarioController.Inserir);
routes.post("/login", usuarioController.validaLogin);
// routes.delete("/:id([0-9]+)", funcionariosController.deletar);
// routes.put("/:id([0-9]+)", funcionariosController.atualizar);

routes.get("/login", (req, res) => {
    res.render("login");
})

routes.get("/inicio", (req, res) => {
    res.render("home");
})

routes.get("/produtos", (req, res) => {
    res.render("usuario");
})

routes.get("/produtos/caixa-de-papelao", (req, res) => {
    res.render("produto");
})


module.exports = routes;