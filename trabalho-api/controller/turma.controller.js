const turmaRepository = require("../repository/turma.repository");

module.exports = {
  buscaTodos: (req, res) => {
    turmaRepository
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

    turmaRepository
      .buscaPorId(id)
      .then((data) => {
        res.send(data);
      })
      .catch((error) => {
        res.status(500).send(error);
      });
  },
  inserir: (req, res) => {
    const turma = req.body;

    if (turma.length > 1) {
      res.send({
        msg: "Número de registros informado é maior que o permitido!",
      });
    }

    turmaRepository
      .inserir(turma)
      .then(() => {
        res.send({
          msg: "Turma inserido, com sucesso!",
          turma,
        });
      })
      .catch((error) => {
        res.status(500).send(error);
      });
  },
  deletar: (req, res) => {
    const { id } = req.params;

    turmaRepository
      .deletar(id)
      .then(() => {
        res.send({ msg: "Turma deletado com sucesso!" });
      })
      .catch((error) => {
        res.status(500).send(error);
      });
  },
  atualizar: (req, res) => {
    const turma = req.body;
    const { id } = req.params;

    turmaRepository
      .atualizar(turma, id)
      .then(() => {
        res.send({
          msg: "Turma atualizado com sucesso!",
          turma,
        });
      })
      .catch((error) => {
        res.status(500).send(error);
      });
  },
};

