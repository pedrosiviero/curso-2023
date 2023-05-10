const con = require("../mysql-connection");

module.exports = {
  buscaTodos: () => {
    return con.select("*").from("alunos");
  },
  buscaPorId: (id) => {
    return con.select("*").from("alunos").where("id", "=", id);
  },
  inserir: (aluno) => {
    return con.insert(aluno).into("alunos");
  },
  deletar: (id) => {
    return con("alunos").where({ id: id }).del();
  },
  atualizar: (aluno, id) => {
    return con("alunos").update(aluno).where({ id: id });
  },
};