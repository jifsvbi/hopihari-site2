const express = require('express');
const router = express.Router();
const authController = require('../controllers/authController');

// Rota para o registro de usuários (POST)
router.post('/register', authController.registerUser);

// Outras rotas de autenticação (login, etc.) podem vir aqui
// router.post('/login', authController.loginUser);

module.exports = router