const express = require('express');
const { ApolloServer } = require('apollo-server-express');
const { PrismaClient } = require('@prisma/client');
const dotenv = require('dotenv');
const typeDefs = require('./models/typeDefs');
const resolvers = require('./resolvers');
const taskRoutes = require('./routes/taskRoutes');
const authenticateToken = require('./middleware/authenticateToken');

dotenv.config();

const app = express();
const prisma = new PrismaClient();

app.use(express.json());
const authRoutes = require('./routes/authRoutes');

// Rutas de autenticación
app.use('/api/auth', authRoutes);

// Rutas REST para la gestión de tareas
app.use('/api/tasks', authenticateToken, taskRoutes);

const server = new ApolloServer({
    typeDefs,
    resolvers,
    context: ({ req }) => {
      // Verifica el token de autenticación
      authenticateToken(req, null, () => {});
      // Devuelve el contexto que incluye el cliente Prisma y el usuario autenticado
      return {
        prisma,
        user: req.user, // El usuario autenticado, si existe
      };
    },
  });

async function startServer() {
  await server.start();
  server.applyMiddleware({ app });

  const PORT = process.env.PORT || 4000;
  app.listen(PORT, () => {
    console.log(`Server running on http://localhost:${PORT}${server.graphqlPath}`);
  });
}

startServer();
