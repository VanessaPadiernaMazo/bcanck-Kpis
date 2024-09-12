/**loginController.js*/

const { authenticateUser } = require('../models/login');
const jwt = require('jsonwebtoken');

const loginUser = async (req, res) => {

    //console.log('Request Body:', req.body);  // Aquí se muestra el contenido del body

    const { name_user, password } = req.body;

    try {
        const result = await authenticateUser(name_user, password);
        if (result.success) {
            const token = jwt.sign(
                {   
                    id: result.user.id_user
                },
                process.env.SECRET_JWT_KEY,
                { expiresIn: '15h' }
            );
            res.json({
                response: {
                    status: true,
                    user: result.user,
                    token: token
                }
            });
        } else {
            res.status(401).json({
                response: { status: false },
                message: result.message
            });
        }
    } catch (error) {
        console.error('Error en la autenticación:', error);
        res.status(500).json({
            response: { status: false },
            message: 'Error en la autenticación'
        });
    }
};

const logoutUser = (req, res) => {
    res.clearCookie('token');
    res.json({ success: true, message: 'Logout successful' });
};

module.exports = { loginUser, logoutUser };
