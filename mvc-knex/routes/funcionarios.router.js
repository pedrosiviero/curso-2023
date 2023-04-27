const express = require("express");
const funcionariosController = require("../controller/funcionarios.controller");

const routes = new express.Router();

routes.get("/", funcionariosController.nomeFuncao);

module.exports = routes;