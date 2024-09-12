/**authenticateToken.js*/
const jwt = require('jsonwebtoken');

const protected = (req, res, next) => {
    const authHeader = req.headers['authorization'];
    const token = authHeader && authHeader.split(' ')[1]; // Extrae solo el token

    if (!token) {
        return res.status(403).json({ success: false, message: 'Access not authorized' });
    }
    
    try {
        const data = jwt.verify(token, process.env.SECRET_JWT_KEY);
        req.user = data;
        next();
    } catch (error) {
        console.error('JWT Verification Error:', error); // Información adicional para depuración
        return res.status(401).json({ success: false, message: 'Invalid access token' });
    }
};


const refresh = (req, res) => {

    const refreshToken = req.token; // RefreshToken desde la cookie

    if (!refreshToken) {
        return res.status(401).json({ success: false, message: 'Refresh token not provided' });
    }

    try {
        const decodedRefresh = jwt.verify(refreshToken, process.env.SECRET_REFRESH_TOKEN_KEY);

        // Generar un nuevo accessToken
        const newAccessToken = jwt.sign(
            { name_user: decodedRefresh.name_user },
            process.env.SECRET_JWT_KEY,
            { expiresIn: '8h' }
        );

        // Actualizar la cookie de accessToken
        res.cookie('token', newAccessToken, {
            httpOnly: true,
            secure: process.env.NODE_ENV === 'production',
            sameSite: 'strict'
        });

        // Agregar datos del usuario al request (opcional)
        req.user = decodedRefresh;

        // Continuar con la solicitud
        next();
    } catch (error) {

    }
}
module.exports = protected, refresh;