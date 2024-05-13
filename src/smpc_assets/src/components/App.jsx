import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import { Navigate } from "../../../../node_modules/react-router-dom/dist/index";

import Home from "./Home";
import "../../assets/styles.css";
import React from "react";

export default function App() {
  
  return (
  <div>
    <Router>
        <Routes>
        <Route path="/" element={<Home/>}/>
        <Route path="*" element={<Navigate to="/"/>}/>
        </Routes>
        </Router>
        </div>
    
    
  );
}