const express = require("express");
const routes = require("./routes/index");

const knex = require('knex')({
    client: 'mysql',
    connection: {
      host: 'localhost',
      user: 'root',
      password: '',
      database: 'empresa'
    }
  });

const app = express();

app.use(express.json());

app.listen(8080, (error) => {
    if (error){
        console.log(error);
    }
    console.log("Seu servidor está em execução na porta 8080!");
})