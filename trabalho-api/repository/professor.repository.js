const con = require("../mysql-connection");

module.exports = {
  buscaTodos: () => {
    return con.select("*").from("professor");
  },
  buscaPorId: (id) => {
    return con.select("*").from("professor").where("id", "=", id);
  },
  inserir: (professor) => {
    return con.insert(professor).into("professor");
  },
  deletar: (id) => {
    return con("professor").where({ id: id }).del();
  },
  atualizar: (professor, id) => {
    return con("professor").update(professor).where({ id: id });
  },
};