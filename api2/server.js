const express = require("express");
const bodyParser = require("body-parser");

const app = express();
app.use(express.json());

app.get("/sucesso",(request, response)=>{
    response.send("Sucesso!");
});

app.post("/login", (request, response)=>{
    //const usuario = request.body.user;
    //const senha = request.body.senha;
    const{usuario, senha} = request.body;

    response.send({
        message: "Autenticação realizada com sucesso!",
        data: `${usuario} - ${senha}`,

    });
})

app.listen(8080,(error)=>{
    if(error){
        console.log(error);
    }else{
        console.log("Servidor On, Porta: 8080");
    }
});