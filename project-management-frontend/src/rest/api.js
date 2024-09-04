import axios from 'axios';

const api = axios.create({
  baseURL: process.env.REACT_APP_API_URL,
});

export const fetchTareas = () => api.get('/tareas');
export const createTarea = (tarea) => api.post('/tareas', tarea);
export const updateTarea = (id, tarea) => api.put(`/tareas/${id}`, tarea);
export const deleteTarea = (id) => api.delete(`/tareas/${id}`);
