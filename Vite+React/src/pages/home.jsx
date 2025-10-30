import React from 'react'
import { Link } from 'react-router-dom'

export default function Home(){
  return (
    <section className="hero">
      <div className="hero__bg" />
      <div className="wrap hero__content hero--padded">
        <div className="eyebrow"><span className="dot" /> Overwatch Workshop Gamemode</div>
        <h1>Zombies: Desecration <span className="muted version">v0.7.8</span></h1>
        <p className="muted">Ramattra’s corrupted AI unleashes zomnics across three ruthless zones. Survive, buy new areas, roll the Mystery Box, and outsmart the trials.</p>
        <div style={{display:'flex',gap:12,marginTop:12}}>
          <Link className="btn btn--primary" to="/wiki">Main Wiki</Link>
          <a className="btn btn--ghost" href="https://forms.gle/TwTjHQBoodaD7mKC7" target="_blank" rel="noopener noreferrer">Take the Survey</a>
          <Link className="btn" to="/mapcodes">Map Codes</Link>
        </div>
      </div>
    </section>
  )
}
