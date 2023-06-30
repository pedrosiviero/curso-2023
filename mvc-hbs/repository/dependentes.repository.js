const con = require("../mysql-connection");

module.exports = {
  buscaTodos: () => {
    return con.select().from("dependentes").orderByRaw("id desc");
  },
  buscaPorId: (id) => {
    return con.select().from("dependentes").where("id", "=", id);
  },
  inserir: (dependente) => {
    return con.insert(dependente).into("dependentes");
  },
  deletar: (id) => {
    return con("dependentes").where({ id: id }).del();
  },
  atualizar: (dependente, id) => {
    return con("dependentes").update(dependente).where({ id: id });
  },
  inserirDependentes: (parametro) => {
    return con.insert(parametro).into("dependentes");
  },
  buscaTodosDepDoFunc: () => {
    return con("dependentes").innerJoin(
      "funcionarios",
      "funcionarios.id",
      "dependentes.funcionario_id"
    ).orderByRaw("id desc");
  },
};