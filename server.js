const express = require("express");
//const bodyParser = require('body-parser');

const app = express();

app.use(express.json());

// bodyparser é o cara paraguaio que veio pro brasil, nn sabe o portugues e chama alguem para traduzir 
// importando função, usando new do java
// listen é para listar 
// app é uma rota e extensão do express
// get é pegar 
// request(solicitação) e response(resposta)
// post permite buscar

// para falar, garçom
app.get("/sucesso", (request, response) => {
    response.send({data: "sucesso"});
});

app.post("/login", (request, response) => {
    const usuario = request.body.usuario;
    const senha = request.body.senha;
  
    response.send({resposta: "Login", 
    data: `${usuario} - ${senha}`,
    });
});

// response.send.statusCode(500) para mostrar outro tipo de aviso. mostrar padrao, significado de cada código
// response.status(500) para apenas alterar o botão

// representa uma função
app.listen(8080, (error) => {
    if(error){
        console.error(error);
    } else{
        console.log("Servidor está rodando na porta 8080");
    }
});