const db = require('../../db');
const bcrypt = require('bcryptjs');

// Función para verificar la contraseña utilizando bcrypt
const isMatch = (password, hashedPassword) => {
    return bcrypt.compareSync(password, hashedPassword);
};

const authenticateUser = async (name_user, password) => {
    try {
        // Obtener el usuario de la base de datos con la consulta SQL proporcionada
        const user = await db('usuarios as u')
            .select(
                'u.ID_Usuario',
                'u.Usuario',
                'u.Clave as PASSWORD',
                'u.Estado_Usuario',
                'r.Nombre_Rol as CARGO',
                'p.CentroCosto',
                'p.Nombre',
                'p.Apellido',
                'p.FechaNacimiento',
                'p.Num_Documento',
                'p.Telefono',
                'p.CCMSID',
                'p.FechaIngresoTP',
                'p.FechaEgresoTP',
                'p.CorreoCorporativo',
                'p.Estado_Civil',
                'p.Hijos',
                'p.Direccion',
                'p.Barrio',
                'p.Ciudad',
                'p.Carrera',
                'p.TipoCarrera',
                'p.NivelCarrera',
                'p.CorreoPersonal',
                'p.Plaza',
                'p.GrupoSanguineo',
                'p.ARP',
                'p.EPS',
                'p.EquipoCompuesto',
                'p.Observaciones',
                'p.Estado as EstadoPersona',
                'c.Tipo_Contrato',
                'a.nombreArea',
                'cr.nombreCargo',
                'pr.Inicio',
                'pr.Perfil',
                'pr.CrearUM',
                'pr.CrearUI',
                'pr.ConsultarEU',
                'pr.CrearE',
                'pr.ConsultarECreado',
                'pr.AgregarInt',
                'pr.ConsultarInt',
                'pr.EliminarInt',
                'pr.CrearKPI',
                'pr.CrearItems',
                'pr.ConsultarKPIS',
                'pr.EvaluarKPIS',
                'pr.ConsultarEVKPIS',
                'pr.ConsultarIndIndividuales',
                'pr.ConsultarIndGrupales',
                'pr.CrearProyecto',
                'pr.ConsultarProyecto',
                'pr.EliminarProyecto',
                'pr.CrearNotifi',
                'pr.ConsultarNotifi',
                'pr.CrearRol',
                'pr.CrearArea',
                'pr.CrearContrato',
                'pr.CrearCargo'
            )
            .leftJoin('rol as r', 'u.ID_Rol1', 'r.ID_Rol')
            .leftJoin('personas as p', 'u.usuarioRed1', 'p.usuarioRed')
            .leftJoin('contrato as c', 'p.IdContrato1', 'c.ID_Contrato')
            .leftJoin('area as a', 'p.ID_Area1', 'a.ID_Area')
            .leftJoin('cargo as cr', 'p.ID_Cargo1', 'cr.ID_Cargo')
            .leftJoin('permrol as prm', 'u.ID_Rol1', 'prm.ID_Rol2')
            .leftJoin('permisosrol as pr', 'prm.ID_PermRol1', 'pr.ID_PermRol')
            .where('u.Usuario', name_user)
            .first();

        if (!user) {
            return { success: false, message: 'Credenciales inválidas: Usuario no encontrado' };
        }

        // Comparar la contraseña proporcionada con la contraseña hasheada almacenada en la base de datos
        const match = isMatch(password, user.PASSWORD);

        if (match) {
            return {
                success: true,
                user: {
                    id_user: user.ID_Usuario,
                    name_user: user.Usuario,
                    Estado_Usuario: user.Estado_Usuario,
                    usuarioRed1: user.usuarioRed1,
                    Nombre_RolasCARGO: user.Nombre_RolasCARGO,
                    CentroCosto: user.CentroCosto,
                    Nombre: user.Nombre,
                    Apellido: user.Apellido,
                    FechaNacimiento: user.FechaNacimiento,
                    Num_Documento: user.Num_Documento,
                    Telefono: user.Telefono,
                    CCMSID: user.CCMSID,
                    FechaIngresoTP: user.FechaIngresoTP,
                    FechaEgresoTP: user.FechaEgresoTP,
                    CorreoCorporativo: user.CorreoCorporativo,
                    Estado_Civil: user.Estado_Civil,
                    Hijos: user.Hijos,
                    Direccion: user.Direccion,
                    Barrio: user.Barrio,
                    Ciudad: user.Ciudad,
                    Carrera: user.Carrera,
                    TipoCarrera: user.TipoCarrera,
                    NivelCarrera: user.NivelCarrera,
                    CorreoPersonal: user.CorreoPersonal,
                    Plaza: user.Plaza,
                    GrupoSanguineo: user.GrupoSanguineo,
                    ARP: user.ARP,
                    EPS: user.EPS,
                    EquipoCompuesto: user.EquipoCompuesto,
                    Observaciones: user.Observaciones,
                    EstadoasEstadoPersona: user.EstadoasEstadoPersona,
                    Tipo_Contrato: user.Tipo_Contrato,
                    nombreArea: user.nombreArea,
                    nombreCargo: user.nombreCargo,
                    Inicio: user.Inicio,
                    Perfil: user.Perfil,
                    CrearUM: user.CrearUM,
                    CrearUI: user.CrearUI,
                    ConsultarEU: user.ConsultarEU,
                    CrearE: user.CrearE,
                    ConsultarECreado: user.ConsultarECreado,
                    AgregarInt: user.AgregarInt,
                    ConsultarInt: user.ConsultarInt,
                    EliminarInt: user.EliminarInt,
                    CrearKPI: user.CrearKPI,
                    CrearItems: user.CrearItems,
                    ConsultarKPIS: user.ConsultarKPIS,
                    EvaluarKPIS: user.EvaluarKPIS,
                    ConsultarEVKPIS: user.ConsultarEVKPIS,
                    ConsultarIndIndividuales: user.ConsultarIndIndividuales,
                    ConsultarIndGrupales: user.ConsultarIndGrupales,
                    CrearProyecto: user.CrearProyecto,
                    ConsultarProyecto: user.ConsultarProyecto,
                    EliminarProyecto: user.EliminarProyecto,
                    CrearNotifi: user.CrearNotifi,
                    ConsultarNotifi: user.ConsultarNotifi,
                    CrearRol: user.CrearRol,
                    CrearArea: user.CrearArea,
                    CrearContrato: user.CrearContrato,
                    CrearCargo: user.CrearCargo
                }
            };
        } else {
            return { success: false, message: 'Credenciales inválidas: Contraseña incorrecta' };
        }
    } catch (error) {
        console.error('Error en authenticateUser:', error);
        return { success: false, message: 'Error al autenticar usuario' };
    }
};

module.exports = { authenticateUser };
