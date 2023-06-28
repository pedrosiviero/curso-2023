const express = require("express");
const usuarioRoutes = require("./usuario.router");

const routes = new express.Router();

routes.use("/usuario", usuarioRoutes);

module.exports = routes;