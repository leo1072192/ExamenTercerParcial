const express = require('express');
const router = express.Router();
const { PrismaClient } = require('@prisma/client');

const prisma = new PrismaClient(); // Initialize Prisma Client

const authenticateToken = require('../middleware/authenticateToken');

// Obtener todas las tareas (ruta protegida)
router.get('/', authenticateToken, async (req, res) => {
  try {
    const tareas = await prisma.tarea.findMany();
    res.json(tareas);
    console.log("exito");
  } catch (error) {
    res.status(500).json({ error: 'Error al obtener las tareas' });
  }
});

// Crear una nueva tarea (ruta protegida)
router.post('/', authenticateToken, async (req, res) => {
  const { titulo, descripcion, fechaLimite, proyectoId } = req.body;
  try {
    const tarea = await prisma.tarea.create({
      data: {
        titulo,
        descripcion,
        fechaLimite: new Date(fechaLimite),
        proyectoId,
      },
    });
    res.json(tarea);
  } catch (error) {
    res.status(500).json({ error: 'Error al crear la tarea' });
  }
});

// Actualizar una tarea (ruta protegida)
router.put('/:id', authenticateToken, async (req, res) => {
  const { id } = req.params;
  const { titulo, descripcion, fechaLimite, estado } = req.body;
  try {
    const tarea = await prisma.tarea.update({
      where: { id: parseInt(id) },
      data: {
        titulo,
        descripcion,
        fechaLimite: new Date(fechaLimite),
        estado,
      },
    });
    res.json(tarea);
  } catch (error) {
    res.status(500).json({ error: 'Error al actualizar la tarea' });
  }
});

// Eliminar una tarea (ruta protegida)
router.delete('/:id', authenticateToken, async (req, res) => {
  const { id } = req.params;
  try {
    await prisma.tarea.delete({
      where: { id: parseInt(id) },
    });
    res.json({ message: 'Tarea eliminada' });
  } catch (error) {
    res.status(500).json({ error: 'Error al eliminar la tarea' });
  }
});

module.exports = router;
