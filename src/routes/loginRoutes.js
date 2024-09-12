const express = require('express');
const { loginUser, logoutUser } = require('../controllers/loginController');
const protected = require('../middlewares/authenticateToken'); // Importa el middleware de autenticación

const router = express.Router();

router.post("/login", loginUser); // Ruta para iniciar sesión
router.get("/logout", protected, logoutUser); // Ruta para cerrar sesión

module.exports = router;
