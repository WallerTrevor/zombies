import React from 'react'
import { Routes, Route } from 'react-router-dom'
import Nav from './components/Nav'
import Footer from './components/Footer'
import Home from './pages/Home'
import Comics from './pages/Comics'
import MapCodes from './pages/MapCodes'
import Wiki from './pages/Wiki'
import Radio from './pages/Radio'
import Donations from './pages/Donations'
import Credits from './pages/Credits'
import About from './pages/About'

export default function App(){
  return (
    <div className="app">
      <Nav />
      <main>
        <Routes>
          <Route path="/" element={<Home/>} />
          <Route path="/comics" element={<Comics/>} />
          <Route path="/mapcodes" element={<MapCodes/>} />
          <Route path="/wiki" element={<Wiki/>} />
          <Route path="/radio" element={<Radio/>} />
          <Route path="/donations" element={<Donations/>} />
          <Route path="/credits" element={<Credits/>} />
          <Route path="/about" element={<About/>} />
        </Routes>
      </main>
      <Footer />
    </div>
  )
}
