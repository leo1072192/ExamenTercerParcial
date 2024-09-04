import React from 'react';
import { useQuery } from '@apollo/client';
import { GET_EMPLEADOS } from '../graphql/queries';

const EmployeeManagement = () => {
  const { loading, error, data } = useQuery(GET_EMPLEADOS);

  if (loading) return <p>Loading...</p>;
  if (error) return <p>Error: {error.message}</p>;

  return (
    <div>
      <h2>Empleados</h2>
      <ul>
        {data.empleados.map((empleado) => (
          <li key={empleado.id}>{empleado.nombre} {empleado.apellido}</li>
        ))}
      </ul>
    </div>
  );
};

export default EmployeeManagement;
