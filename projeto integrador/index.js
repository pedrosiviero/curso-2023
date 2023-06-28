const express = require("express");
const hbs = require("hbs");
const routes = require("./route/index.js");

const app = express();

app.use(express.urlencoded({ extended: true }));
app.use(express.json());

app.use(express.static(__dirname + "/public"));

app.use(routes);

hbs.registerPartials(`${__dirname}/views`);
app.set("view engine", "hbs");
app.set("view options", {
    layout: "layouts/default",
});

app.listen(8080, (error) => {
    if (error) {
        console.log(error);
    }
    console.log("O servidor esta rodando na porta 8080! 👍");
});