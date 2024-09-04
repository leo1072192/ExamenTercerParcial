import React from 'react';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import ProjectManagement from './components/ProjectManager';
import TaskManagement from './components/TaskManager';
import EmployeeManagement from './components/EmployeeManager';
import Login from './components/Login';
import PrivateRoute from './components/PrivateRoute';
import Navbar from './components/Navbar';

const App = () => {
  return (
    <Router>
      <div>
        <Navbar />
        <Routes>
          <Route path="/login" element={<Login />} />
          <PrivateRoute path="/projects" element={<ProjectManagement />} />
          <PrivateRoute path="/tasks" element={<TaskManagement />} />
          <PrivateRoute path="/employees" element={<EmployeeManagement />} />
          <Route path="/" element={
            <h2>Welcome! Please <a href="/login">login</a> to access the system.</h2>
          } />
        </Routes>
      </div>
    </Router>
  );
};

export default App;
