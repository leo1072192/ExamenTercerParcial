const resolvers = {
    Query: {
      proyectos: async (_, __, { prisma }) => {
        return prisma.proyecto.findMany({
          include: { tareas: true },
        });
      },
      proyecto: async (_, { id }, { prisma }) => {
        return prisma.proyecto.findUnique({
          where: { id: parseInt(id) },
          include: { tareas: true },
        });
      },
      empleados: async (_, __, { prisma }) => {
        return prisma.empleado.findMany({
          include: { tareas: true },
        });
      },
      empleado: async (_, { id }, { prisma }) => {
        return prisma.empleado.findUnique({
          where: { id: parseInt(id) },
          include: { tareas: true },
        });
      },
    },
    Mutation: {
      crearProyecto: async (_, { nombre, descripcion, fechaInicio, fechaFin }, { prisma }) => {
        return prisma.proyecto.create({
          data: {
            nombre,
            descripcion,
            fechaInicio: new Date(fechaInicio),
            fechaFin: new Date(fechaFin),
          },
        });
      },
      actualizarProyecto: async (_, { id, nombre, descripcion, fechaInicio, fechaFin }, { prisma }) => {
        return prisma.proyecto.update({
          where: { id: parseInt(id) },
          data: {
            nombre,
            descripcion,
            fechaInicio: new Date(fechaInicio),
            fechaFin: new Date(fechaFin),
          },
        });
      },
      eliminarProyecto: async (_, { id }, { prisma }) => {
        await prisma.proyecto.delete({
          where: { id: parseInt(id) },
        });
        return true;
      },
      crearEmpleado: async (_, { nombre, apellido, correoElectronico, telefono }, { prisma }) => {
        return prisma.empleado.create({
          data: {
            nombre,
            apellido,
            correoElectronico,
            telefono,
          },
        });
      },
      actualizarEmpleado: async (_, { id, nombre, apellido, correoElectronico, telefono }, { prisma }) => {
        return prisma.empleado.update({
          where: { id: parseInt(id) },
          data: {
            nombre,
            apellido,
            correoElectronico,
            telefono,
          },
        });
      },
      eliminarEmpleado: async (_, { id }, { prisma }) => {
        await prisma.empleado.delete({
          where: { id: parseInt(id) },
        });
        return true;
      },
    },
  };
  
  module.exports = resolvers;
  