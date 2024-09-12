const { list_Rol, create_Rol, update_Rol, single_RolID, deleite_Rol } = require('../models/rol');


/* Función para listar todos los RolS */
const listRol = (req, res) => {
    list_Rol()
        .then((response) => res.json({ success: true, response: response })) // Enviar respuesta JSON con los casos listados
        .catch((e) => res.status(500).json({ success: false, error: e.message })); // Manejo de errores
};

/* Función para registrar un Rol */
const createRol = (req, res) => {
    const { Nombre_Rol } = req.body; // Obtener el nombre del rol del cuerpo de la solicitud

    // Validar que el nombre del rol está presente
    if (!Nombre_Rol) {
        return res.status(400).json({ success: false, message: 'Name of role is required' });
    }

    // Llamar al servicio para crear un nuevo rol
    create_Rol({ Nombre_Rol })
        .then((rolResponse) => {
            res.status(201).json({ success: true, message: 'Role created successfully', rol: rolResponse });
        })
        .catch((e) => res.status(500).json({ success: false, error: e.message })); // Manejo de errores
};


/* Función para obtener un Rol por su id */
const singleRolID = (req, res) => {
    single_RolID({ ID_Rol : req.params.id }) // Llamar al servicio para obtener un caso por ID
        .then((response) => {
            if (response) {
                res.json({ response }); // Enviar respuesta JSON con el caso encontrado
            } else {
                res.status(404).json({ success: false, message: 'Case not found' }); // Enviar error 404 si no se encontró el caso
            }
        })
        .catch((e) => res.status(500).json({ success: false, error: e.message })); // Manejo de errores
};

const updateRol = async(req, res) => {
    const ID_Rol = req.params.id; // Obtener el ID del rol desde los parámetros de la solicitud
    const { Nombre_Rol } = req.body; // Obtener el nuevo nombre del rol desde el cuerpo de la solicitud
    try {
        // Preparar el objeto para actualizar
        const updateObject = { Nombre_Rol };

        // Llamar al modelo para actualizar el rol
        const response  = await  update_Rol(ID_Rol, updateObject);

        // Devolver la respuesta adecuada
      
        res.status(200).json({ success: true, response: response });
    } catch (e) {
        console.error('Error al actualizar el rol:', e.message); // Depuración
        res.status(500).json({ success: false, error: e.message });
    }
};

// Función para eliminar un Rol por su id
const deleteRol = (req, res) => {
    deleite_Rol({ ID_Rol: req.params.id }) // Llamar al servicio para eliminar el rol por ID
        .then((response) => {
            if (response) {
                res.json({ success: true, message: 'Role deleted successfully', response }); // Enviar respuesta JSON confirmando la eliminación
            } else {
                res.status(404).json({ success: false, message: 'Role not found' }); // Enviar error 404 si no se encontró el rol
            }
        })
        .catch((e) => res.status(500).json({ success: false, error: e.message })); // Manejo de errores
};

module.exports = { listRol, singleRolID, createRol, updateRol, deleteRol }; // Exportar el router 