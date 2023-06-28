const con = require("../mysql-connection");

module.exports = {
    buscaTodos: () => {
        return con.select().from("usuario")
    },
    buscaPorId: (id_usuario) => {
        return con.select().from("usuario").where("id_usuario", "=", id_usuario);
    },
    InserirEnd: (body) => {
        return con('endereco').insert(body).into('endereco');
    },
    Inserir: (body) => {
        return con('usuario').insert(body).into('usuario');
    },
    validaLogin: (nome) => {
            return con.select().from("usuario").where("nome", "=", nome);
        }
        // deletar: (id) => {
        //     return con("funcionarios").where({ id: id }).del();
        // },
        // atualizar: (funcionario, id) => {
        //     return con("funcionarios").update(funcionario).where({ id: id });
        // },
}