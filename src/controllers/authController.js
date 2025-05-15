// src/controllers/authController.js
const bcrypt = require('bcrypt');
// Importe seu modelo de usuário e sua conexão com o banco de dados (ex: Sequelize, Mongoose)
// const User = require('../models/User');

exports.registerUser = async (req, res) => {
    try {
        const { firstName, lastName, email, password, birthDate, phone } = req.body;

        // 1. Validação básica dos dados de entrada
        if (!firstName || !lastName || !email || !password) {
            return res.status(400).json({ message: 'Por favor, preencha todos os campos obrigatórios.' });
        }

        // 2. Verificar se o e-mail já existe no banco de dados (exemplo com Sequelize)
        // const existingUser = await User.findOne({ where: { email } });
        // if (existingUser) {
        //     return res.status(409).json({ message: 'Este e-mail já está cadastrado.' });
        // }

        // 3. Criptografar a senha
        const hashedPassword = await bcrypt.hash(password, 10);

        // 4. Criar um novo usuário no banco de dados (exemplo com Sequelize)
        // const newUser = await User.create({
        //     firstName,
        //     lastName,
        //     email,
        //     password: hashedPassword,
        //     birthDate,
        //     phone
        // });

        // 5. Enviar uma resposta de sucesso
        res.status(201).json({ message: 'Usuário cadastrado com sucesso!' });

    } catch (error) {
        console.error('Erro ao cadastrar usuário:', error);
        res.status(500).json({ message: 'Erro interno do servidor ao cadastrar o usuário.' });
    }
};

// Exemplo de uma possível função de login (você precisará implementá-la)
// exports.loginUser = async (req, res) => {
//     // Lógica de login aqui
// };