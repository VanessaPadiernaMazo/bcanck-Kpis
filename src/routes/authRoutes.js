/** authRouter.js */
const express = require('express');
const router = express.Router();
const protected = require('../middlewares/authenticateToken'); // Importa el middleware de autenticación
const { refreshToken } = require('../controllers/authController'); // Importa el controlador

// Ruta para refresh del token
router.post('/refresh', protected, refreshToken);

module.exports = router;
