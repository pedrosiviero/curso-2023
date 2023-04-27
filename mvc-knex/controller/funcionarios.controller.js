const funcionariosRepository = require("../repository/funcionarios.repository")
const express = require("express");
const app = express();

app.use(express.json());


module.exports = {
    nomeFuncao: (req, res) => {
        return res.send("ola funcionarios!");
    },
};

app.get('/funcionarios', (req, res) => {
    knex('nome').select('*').then((dados) => {
      res.send(dados);
    });
  });
  
  app.post('/funcionarios', (req, res) => {
    knex('nome').insert(req.body).then(() => {
      res.send('Usuário criado com sucesso!');
    });
  });
  
  app.put('/funcionarios/:id', (req, res) => {
    knex('nome').where('id', req.params.id).update(req.body).then(() => {
      res.send('Usuário atualizado com sucesso!');
    });
  });
  
  app.delete('/funcionarios/:id', (req, res) => {
    knex('nome').where('id', req.params.id).del().then(() => {
      res.send('Usuário deletado com sucesso!');
    });
  });
  