const express = require('express');
const { listRol, singleRolID, createRol, updateRol, deleteRol } = require('../controllers/rolController');
const protected = require('../middlewares/authenticateToken'); // Importa el middleware de autenticación

const router = express.Router();

router.get("/all", protected, listRol); // Ruta para cargar toda la lista de roles
router.get("/:id", protected, singleRolID); // Ruta para buscar un rol por ID
router.post("/create", protected, createRol); // Ruta para crear un rol
router.put("/updateRol/:id", protected, updateRol); // Ruta para update un rol
router.get("/delete/:id", protected, deleteRol); // Ruta para update un rol

module.exports = router;
