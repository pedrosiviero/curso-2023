const express = require("express");
const routes = require("./routes/aluno.router");
const routes1 = require("./routes/professor.router");
const routes2 = require("./routes/turma.router");

const app = express();

app.use(express.json());

app.use("/aluno", routes);
app.use("/professor",routes1);
app.use("/turma", routes2);

app.listen(8080, (error) => {
  if (error) {
    console.log(error);
  }
  console.log("O servidor esta rodando na porta 8080! 👍");
});