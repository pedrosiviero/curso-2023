const professorRepository = require("../repository/professor.repository");

module.exports = {
  buscaTodos: (req, res) => {
    professorRepository
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

     professorRepository
      .buscaPorId(id)
      .then((data) => {
        res.send(data);
      })
      .catch((error) => {
        res.status(500).send(error);
      });
  },
  inserir: (req, res) => {
    const professor = req.body;

    if (professor.length > 1) {
      res.send({
        msg: "Número de registros informado é maior que o permitido!",
      });
    }

    professorRepository
      .inserir(professor)
      .then(() => {
        res.send({
          msg: "Professor inserido, com sucesso!",
          professor,
        });
      })
      .catch((error) => {
        res.status(500).send(error);
      });
  },
  deletar: (req, res) => {
    const { id } = req.params;

    professorRepository
      .deletar(id)
      .then(() => {
        res.send({ msg: "Professor deletado com sucesso!" });
      })
      .catch((error) => {
        res.status(500).send(error);
      });
  },
  atualizar: (req, res) => {
    const professor = req.body;
    const { id } = req.params;

    professorRepository
      .atualizar(professor, id)
      .then(() => {
        res.send({
          msg: "Professor atualizado com sucesso!",
          professor,
        });
      })
      .catch((error) => {
        res.status(500).send(error);
      });
  },
};

