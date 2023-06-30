const dependentesRepository = require("../repository/dependentes.repository");
const funcionariosRepository = require("../repository/funcionarios.repository");

module.exports = {
  buscaTodos: async (req, res) => {
    const data = await dependentesRepository
      .buscaTodos()
      .then((result) => result)
      .catch((error) => {
        res.status(500).send(error);
      });
    res.render("dependentes", { data });
  },
  buscaPorId: async (req, res) => {
    const { id } = req.params;

    let data = await dependentesRepository.buscaPorId(id);

    const funcionarios = await funcionariosRepository.buscaTodos();

    data = data[0];

    res.render("cadastro_dependente", { data , funcionarios});
  },
  inserir: async (req, res) => {
    var dependente = req.body;

    console.log(dependente);

    if (dependente.ID == "") {
      dependente.ID = null;
      await dependentesRepository.inserir(dependente);
    } else {
      const { ID } = dependente;
      await dependentesRepository.atualizar(dependente, ID);
    }

    res.redirect("dependentes");
  },
  deletar: (req, res) => {
    const { id } = req.params;

    dependentesRepository
      .deletar(id)
      .then(() => {
        res.send({ msg: "dependente deletado com sucesso!" });
      })
      .catch((error) => {
        res.status(500).send(error);
      });
  },
  atualizar: (req, res) => {
    const dependente = req.body;
    const { id } = req.params;

    dependentesRepository
      .atualizar(dependente, id)
      .then(() => {
        res.send({
          msg: "dependente atualizado com sucesso!",
          dependente,
        });
      })
      .catch((error) => {
        res.status(500).send(error);
      });
  },
  inserirDependentes: async (req, res) => {
    const dependente = req.body;

    const funcionario = await dependentesRepository
      .buscaPorId(dependente.id)
      .then((data) => data)
      .catch((error) => {
        return res.status(500).send(error);
      });

    if (dependente.length <= 0) {
      return res.status(404).send({ msg: "Funcionário não existe!" });
    }

    dependentesRepository
      .inserirDependentes(dependente)
      .then((data) => {
        return res.send({ msg: "Dependente registrado com sucesso!" });
      })
      .catch((error) => {
        return res.status(500).send(error);
      });
  },
  buscaTodosDepDoFunc: async (req, res) => {
    const data = await dependentesRepository
      .buscaTodosDepDoFunc()
      .then((data) => data);
    const funcionarios = await funcionariosRepository
      .buscaTodos();

    res.render("cadastro_dependente", { data, funcionarios});
  },
};

function formataData(end_date) {
  var ed = new Date(end_date);
  var d = ed.getDay();
  var m = ed.getMonth() + 1;
  var y = ed.getFullYear();
  return "" + y + "-" + (m <= 9 ? "0" + m : m) + "-" + (d <= 9 ? "0" + d : d);
}