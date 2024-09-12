// Importar el módulo de base de datos
const db = require("../../db");

// Función para listar casos en la base de datos
const list_Rol = async (params = {}) => {
    try {
        // Consultar la base de datos para seleccionar registros según los parámetros proporcionados
        const results = await db(process.env.T_ROL)
            .where(params)  // Aplicar filtros de búsqueda opcionales
            .select();      // Seleccionar todos los campos de los registros encontrados
        return results ;  // Devolver éxito y los datos obtenidos
    } catch (error) {
        return { success: false, error: error.message };  // Devolver fallo y el mensaje de error si ocurre uno
    }
};
 

// Función para crear un nuevo caso en la base de datos
const create_Rol = async (obj) => {
  try {
      // Insertar el objeto proporcionado en la tabla T_ROL de la base de datos
      const results = await db(process.env.T_ROL).insert(obj);
      return results; // Devolver éxito y los datos del objeto insertado
  } catch (error) {
      return { success: false, error: error.message }; // Devolver fallo y el mensaje de error si ocurre uno
  }
};

// Función para actualizar un video en la base de datos por su ID
// Función para actualizar un video en la base de datos por su ID
const update_Rol = async (ID_Rol, obj) => {
  try {
    // Actualizar el video que coincide con el ID proporcionado con los nuevos datos del objeto
    const results = await db(process.env.T_ROL)
      .where({ ID_Rol })
      .update(obj);
    // Verificar si se actualizó algún registro
    if (results) {
      return { success: true, message: 'updated successfully' };
    } else {
      return { success: false, message: 'Video not found' };
    }
  } catch (error) {
    return { success: false, error: error.message };  // Devolver fallo y el mensaje de error si ocurre uno
  }
};

// Función para obtener un solo caso de la base de datos por sus parámetros
const single_RolID = async (params = {}) => {
    try {
        // Buscar y devolver el primer registro que coincida con los parámetros en la tabla T_ROL
        const result = await db(process.env.T_ROL)
            .where(params)
            .first(); // Utiliza .first() para obtener solo el primer resultado
        return result;  // Devolver el resultado encontrado
    } catch (error) {
        throw new Error(error.message);  // Lanzar un error con el mensaje correspondiente si ocurre un problema
    }
};

// Función para obtener un solo caso de la base de datos por sus parámetros
const deleite_Rol = async (params = {}) => {
    try {
        // Buscar y devolver el primer registro que coincida con los parámetros en la tabla T_ROL
        const result = await db(process.env.T_ROL)
            .where(params)
            .del(); // Utiliza .del() para obtener solo el primer resultado
        return result;  // Devolver el resultado encontrado
    } catch (error) {
        throw new Error(error.message);  // Lanzar un error con el mensaje correspondiente si ocurre un problema
    }
};



// Exportar las funciones para que estén disponibles para otros módulos
module.exports = { list_Rol, create_Rol, update_Rol, single_RolID, deleite_Rol };