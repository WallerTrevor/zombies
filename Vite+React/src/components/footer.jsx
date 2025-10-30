import React from 'react'

export default function Footer(){
  return (
    <footer>
      <div className="wrap">
        <div>© {new Date().getFullYear()} Zombie Survival • A Fan Made Overwatch Workshop Gamemode</div>
        <div style={{marginTop:8}}>
          <a href="/">Home</a> •
          <a href="/comics"> Comics</a> •
          <a href="/mapcodes"> Map Codes</a> •
          <a href="/wiki"> Wiki</a> •
          <a href="/credits"> Credits</a> •
          <a href="/donations"> Donations</a>
        </div>
      </div>
    </footer>
  )
}
