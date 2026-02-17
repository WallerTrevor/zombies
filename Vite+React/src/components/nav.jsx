import React from 'react'
import { Link } from 'react-router-dom'

export default function Nav(){
  return (
    <header className="nav">
      <div className="nav__inner">
        <div className="brand">
          <div className="brand__logo" aria-hidden="true"></div>
          <div className="brand__name">Overwatch: Zombies</div>
        </div>

        <nav className="nav__links" aria-label="Primary">
          <Link className="chip chip--gold" to="/">Home</Link>
          <Link className="chip chip--gold" to="/comics">Comics</Link>
          <Link className="chip chip--gold" to="/mapcodes">Map Codes</Link>
          <Link className="chip chip--gold" to="/wiki">Wiki</Link>
          <Link className="chip chip--gold" to="/radio">Survivor Radio</Link>
          <Link className="chip chip--gold" to="/credits">Credits</Link>
          <Link className="chip chip--cta" to="/donations">Donations</Link>
        </nav>
      </div>
    </header>
  )
}
