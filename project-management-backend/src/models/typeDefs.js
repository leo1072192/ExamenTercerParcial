const { gql } = require('apollo-server-express');

const typeDefs = gql`
  type Proyecto {
    id: ID!
    nombre: String!
    descripcion: String
    fechaInicio: String
    fechaFin: String
    tareas: [Tarea]
  }

  type Empleado {
    id: ID!
    nombre: String!
    apellido: String!
    correoElectronico: String!
    telefono: String
    tareas: [Tarea]
  }

  type Tarea {
    id: ID!
    titulo: String!
    descripcion: String
    fechaLimite: String
    estado: String
    proyecto: Proyecto
    empleados: [Empleado]
  }

  type Query {
    proyectos: [Proyecto]
    proyecto(id: ID!): Proyecto
    empleados: [Empleado]
    empleado(id: ID!): Empleado
  }

  type Mutation {
    crearProyecto(nombre: String!, descripcion: String, fechaInicio: String, fechaFin: String): Proyecto
    actualizarProyecto(id: ID!, nombre: String!, descripcion: String, fechaInicio: String, fechaFin: String): Proyecto
    eliminarProyecto(id: ID!): Boolean
    crearEmpleado(nombre: String!, apellido: String!, correoElectronico: String!, telefono: String): Empleado
    actualizarEmpleado(id: ID!, nombre: String!, apellido: String!, correoElectronico: String!, telefono: String): Empleado
    eliminarEmpleado(id: ID!): Boolean
  }
`;

module.exports = typeDefs;
