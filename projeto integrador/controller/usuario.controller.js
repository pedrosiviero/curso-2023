//const funcionariosRepository = require("../repository/funcionarios.repository.js");
const usuarioRepository = require("../repository/usuario.repository");

module.exports = {
    buscaTodos: (req, res) => {
        const data = usuarioRepository
            .buscaTodos()

        res.render("usuario", { data });
    },
    buscaPorId: (req, res) => {
        //Lembra do async await e do let data
        const { id_usuario } = req.params;
        const data = usuarioRepository.buscaPorId(id_usuario)
            .then((result) => {
                res.send({ msg: result })

            })
            // data = data[0]
            // data.DATA_NSC = formataData(data.DATA_NSC);
            // res.render("cadastro_funcionario", { data })
    },
    InserirEnd: (req, res) => {
        const endereco = req.body
        usuarioRepository.InserirEnd(endereco)
            .then((data) => {
                res.send({ msg: "Endereço inserido com sucesso!" });
            })
    },
    Inserir: (req, res) => {
        var usuario = req.body;
        console.log(usuario);
        usuarioRepository.Inserir(usuario);
        // res.send({ msg: "Usuário inserido com sucesso!", usuario });

        res.redirect("/usuario/buscartudo")
    },
    validaLogin: async(req, res) => {
        var { usuario, senha, } = req.body;

        try {
            const data = await usuarioRepository.validaLogin(usuario);

            const user = data[0];
            // const user = data.find(
            //     (usuario) => usuario.nome === nome && usuario.senha === senha,
            // );



            if (user) {
                if (user.senha == senha) {
                    // res.send('Login concluído');
                    res.redirect("/usuario/buscartudo")
                } else {
                    res.send('Senha inválida!');
                }
            } else {
                res.render('criar_usuario', { msg: "Informações inválidas" });
            }
        } catch (error) {
            console.error(error);
            res.send('Erro ao validar o login.');
        }
    }
}