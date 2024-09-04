import React from 'react';
import { useQuery } from '@apollo/client';
import { GET_PROYECTOS } from '../graphql/queries';

const ProjectManagement = () => {
  const { loading, error, data } = useQuery(GET_PROYECTOS);

  if (loading) return <p>Loading...</p>;
  if (error) return <p>Error: {error.message}</p>;

  return (
    <div>
      <h2>Proyectos</h2>
      <ul>
        {data.proyectos.map((proyecto) => (
          <li key={proyecto.id}>{proyecto.nombre}</li>
        ))}
      </ul>
    </div>
  );
};

export default ProjectManagement;
