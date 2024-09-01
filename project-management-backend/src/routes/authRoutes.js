const express = require('express');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcrypt');
const { PrismaClient } = require('@prisma/client');

const router = express.Router();
const prisma = new PrismaClient(); // Creación de la instancia de Prisma Client

// Ruta para registrar un nuevo usuario (opcional, para pruebas)
router.post('/register', async (req, res) => {
  const { username, password,email,role } = req.body;

  
  const hashedPassword = await bcrypt.hash(password, 10);
  const user = await prisma.user.create({
    data: {
      username,
      password: hashedPassword,
      email,
      role
    },
  });
  res.json(user);
});

// Ruta de login
router.post('/login', async (req, res) => {
  const { username, password } = req.body;
  const user = await prisma.user.findUnique({ where: { username } });

  if (!user) {
    return res.status(400).json({ message: 'Usuario no encontrado' });
  }

  const isPasswordValid = await bcrypt.compare(password, user.password);
  if (!isPasswordValid) {
    return res.status(401).json({ message: 'Contraseña incorrecta' });
  }

  const token = jwt.sign(
    { userId: user.id, username: user.username },
    process.env.JWT_SECRET,
    { expiresIn: '1h' }
  );

  res.json({ token });
});

module.exports = router;
