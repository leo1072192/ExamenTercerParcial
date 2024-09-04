import { gql } from '@apollo/client';

export const GET_PROYECTOS = gql`
  query GetProyectos {
    proyectos {
      id
      nombre
      descripcion
      fechaInicio
      fechaFin
      tareas {
        id
        titulo
        estado
      }
    }
  }
`;

export const GET_EMPLEADOS = gql`
  query GetEmpleados {
    empleados {
      id
      nombre
      apellido
      correoElectronico
    }
  }
`;
