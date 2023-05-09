const alunoRepository = require("../repository/aluno.repository");

module.exports = {
  buscaTodos: (req, res) => {
    alunoRepository
      .buscaTodos()
      .then((data) => {
        res.send(data);
      })
      .catch((error) => {
        res.status(500).send(error);
      });
  },
  buscaPorId: (req, res) => {
    const { id } = req.params;

    if (!id) {
      res.status(404).send({ msg: "Parametro id obrigatorio!" });
    }

    alunoRepository
      .buscaPorId(id)
      .then((data) => {
        res.send(data);
      })
      .catch((error) => {
        res.status(500).send(error);
      });
  },
  inserir: (req, res) => {
    const aluno = req.body;

    if (aluno.length > 1) {
      res.send({
        msg: "Número de registros informado é maior que o permitido!",
      });
    }

    alunoRepository
      .inserir(aluno)
      .then(() => {
        res.send({
          msg: "Aluno inserido, com sucesso!",
          aluno,
        });
      })
      .catch((error) => {
        res.status(500).send(error);
      });
  },
  deletar: (req, res) => {
    const { id } = req.params;

    alunoRepository
      .deletar(id)
      .then(() => {
        res.send({ msg: "Aluno deletado com sucesso!" });
      })
      .catch((error) => {
        res.status(500).send(error);
      });
  },
  atualizar: (req, res) => {
    const aluno = req.body;
    const { id } = req.params;
    console.log(aluno, id)

    alunoRepository
      .atualizar(aluno, id)
      .then(() => {
        res.send({
          msg: "Aluno atualizado com sucesso!",
          aluno,
        });
      })
      .catch((error) => {
        res.status(500).send(error);
      });
  },
};

