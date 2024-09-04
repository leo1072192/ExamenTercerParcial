import React from 'react';
import { Link } from 'react-router-dom';

const Navbar = () => {
  const isAuthenticated = !!localStorage.getItem('token');

  return (
    <nav>
      <ul>
        {isAuthenticated ? (
          <>
            <li><Link to="/projects">Project Management</Link></li>
            <li><Link to="/tasks">Task Management</Link></li>
            <li><Link to="/employees">Employee Management</Link></li>
            <li><button onClick={() => {
              localStorage.removeItem('token');
              window.location.href = '/login';
            }}>Logout</button></li>
          </>
        ) : (
          <li><Link to="/login">Login</Link></li>
        )}
      </ul>
    </nav>
  );
};

export default Navbar;
