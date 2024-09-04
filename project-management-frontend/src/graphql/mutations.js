import { gql } from '@apollo/client';

export const CREATE_PROYECTO = gql`
  mutation CreateProyecto($nombre: String!, $descripcion: String, $fechaInicio: String, $fechaFin: String) {
    crearProyecto(nombre: $nombre, descripcion: $descripcion, fechaInicio: $fechaInicio, fechaFin: $fechaFin) {
      id
      nombre
    }
  }
`;

// Agrega otras mutaciones según sea necesario
