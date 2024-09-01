// Middleware de autenticación en 'src/middleware/authenticateToken.js'
const jwt = require('jsonwebtoken');
require('dotenv').config();

function authenticateToken(req, res, next) {
    const authHeader = req.headers['authorization'];
    
    const token = authHeader && authHeader.split(' ')[1]; // Extrae el token después de "Bearer"
    if (token == null) return res.sendStatus(401);
    if (!token) {
        return resolve(null); // No hay token, resolver con null
      }
  
    jwt.verify(token, process.env.JWT_SECRET, (err, user) => {
      if (err) return res.sendStatus(403);
      req.user = user;
      next();
    });
  }
  
module.exports = authenticateToken;
