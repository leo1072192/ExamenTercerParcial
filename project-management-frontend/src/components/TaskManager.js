import React, { useEffect, useState } from 'react';
import { fetchTareas, createTarea, updateTarea, deleteTarea } from '../rest/api';

const TaskManagement = () => {
  const [tareas, setTareas] = useState([]);

  useEffect(() => {
    fetchTareas().then(response => setTareas(response.data));
  }, []);

  // Agrega funciones para manejar creación, actualización y eliminación de tareas

  return (
    <div>
      <h2>Tareas</h2>
      {/* Agrega componentes para crear, editar y eliminar tareas */}
      <ul>
        {tareas.map(tarea => (
          <li key={tarea.id}>{tarea.titulo}</li>
        ))}
      </ul>
    </div>
  );
};

export default TaskManagement;
