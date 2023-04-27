const funcionariosRepository = require("../repository/funcionarios.repository")

const con = require("../mysql-conection");

module.exports = {
    find: () => {
        return con.select().from("funcionarios");
    },
}