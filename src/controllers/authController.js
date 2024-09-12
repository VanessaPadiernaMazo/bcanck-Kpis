/** authController.js */
const jwt = require('jsonwebtoken');

/**
 * @swagger
 * tags:
 *   name: Auth
 *   description: Rutas de autenticación
 */

/**
 * @swagger
 * securitySchemes:
 *   cookieAuth:
 *     type: apiKey
 *     in: cookie
 *     name: token
 *     description: Cookie de autenticación con el token de acceso.
 */

/**
 * @swagger
 * /auth/refresh:
 *   post:
 *     summary: Refrescar el token de acceso
 *     tags: [Auth]
 *     security:
 *       - cookieAuth: []
 *     responses:
 *       200:
 *         description: Token de acceso actualizado exitosamente
 *         content:
 *           application/json:
 *             schema:
 *               type: object
 *               properties:
 *                 success:
 *                   type: boolean
 *                   example: true
 *                 accessToken:
 *                   type: string
 *       401:
 *         description: Token de actualización inválido
 *       403:
 *         description: Token de actualización no proporcionado
 */

const refreshToken = (req, res) => {
    const refreshToken = req.cookies.token; // Obtén el refreshToken desde la cookie

    if (!refreshToken) {
        return res.status(403).json({ success: false, message: 'Refresh token not provided' });
    }

    try {
        const decoded = jwt.verify(refreshToken, process.env.SECRET_JWT_KEY);

        // Genera un nuevo accessToken
        const accessToken = jwt.sign(
            { name_user: decoded.name_user, id: decoded.id, rol_id: decoded.rol_id },
            process.env.SECRET_JWT_KEY,
            { expiresIn: '1h' }
        );

        res.json({ success: true, accessToken });
    } catch (error) {
        res.status(401).json({ success: false, message: 'Invalid refresh token' });
    }
};

module.exports = {
    refreshToken
};
