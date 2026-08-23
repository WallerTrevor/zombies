 "use client";
import {useMemo,useState} from "react";
const HEROES = [
  // ---- General note (applies to all) ----
  { name:"All Heroes", role:"all",
core: [
  ["Starting HP", "DPS/Support 100 • Tank 150"]
],
pap: [
  ["Pack-A-Punch", "Unlocks extra ability and bonus damage (varies by hero)"]
],
notes: "Global baselines for Zombies mode."
  },

  // ---- Support examples from your settings & table ----
  { name:"Ana", role:"support",
core: [
  ["Damage Dealt", "300%"],
  ["Biotic Grenade Cooldown", "50%"],
  ["Sleep Dart Cooldown", "0%"]
],
pap: [
  ["Nano Boost", "Gives target teammate insta-kill (PAP)"]
]
  },
  { name:"Baptiste", role:"support",
core: [
  ["Damage Dealt","160%"],
  ["Healing Dealt","150%"],
  ["Regenerative Burst Cooldown","25%"],
  ["Clip Size Scalar","50%"]
],
pap: [
  ["Regenerative Burst","Also grants extra temporary HP to self"]
]
  },
  { name:"Brigitte", role:"support",
core: [
  ["Healing Dealt","40%"],
  ["Barrier Shield Cooldown","50%"],
  ["Repair Pack Cooldown","50%"],
  ["Shield Bash Cooldown","50%"]
],
pap: [
  ["Rally (Ult)","1.5× larger aura + +1000 temp HP; Shield Bash knocks down"]
]
  },
  { name:"Kiriko", role:"support",
core: [
  ["Damage Dealt","150%"]
],
pap: [
  ["Kitsune Rush","Enemies slow inside your rush field"]
]
  },
  { name:"Lúcio", role:"support",
core: [
  ["Healing Dealt","250%"]
],
pap: [
  ["Sound Barrier","All enemies in radius are rooted on cast"]
]
  },
  { name:"Moira", role:"support",
core: [
  ["Healing Dealt","150%"],
  ["Damage Dealt","150%"],
  ["Fade Cooldown","200%"],
  ["Biotic Orb Cooldown","25%"],
  ["Health","50%"]
],
pap: [
  ["—","(design TBD)"]
]
  },
  { name:"Zenyatta", role:"support",
core: [
  ["Damage Dealt","150%"],
  ["Healing Dealt","150%"]
],
pap: [
  ["—","(design TBD)"]
]
  },

  // ---- Damage from settings/table ----
  { name:"Ashe", role:"damage",
core: [
  ["Damage Dealt","125%"],
  ["Coach Gun Cooldown","35%"],
  ["Dynamite Cooldown","50%"]
],
pap: [
  ["Headshots","Apply burn damage"]
]
  },
  { name:"Cassidy", role:"damage",
core: [
  ["Combat Roll Cooldown","35%"],
  ["Flashbang Cooldown","15%"],
  ["Notes","Roll refills half a magazine"]
],
pap: [
  ["Rounds","Explosive rounds"],
  ["Deadeye","Low gravity if you jump right before using it"]
],
notes: "Starting hero — weaker early, huge payoff when PAP’d."
  },
  { name:"Echo", role:"damage",
core: [
  ["Focusing Beam Cooldown","50%"],
  ["Flight Cooldown","500%"]
],
pap: [
  ["Volley","Explosive volley shoots homing rockets"]
]
  },
  { name:"Genji", role:"damage",
core: [
  ["Damage Dealt","40%"]
],
pap: [
  ["Dragonblade","Sword swipes launch fire strikes"]
]
  },
  { name:"Hanzo", role:"damage",
core: [
  ["Damage Dealt","300%"],
  ["Sonic Arrow Cooldown","50%"],
  ["Storm Arrows Cooldown","50%"],
  ["Storm Arrows Quantity","6"]
],
pap: [
  ["Storm Arrows","Knock enemies down ~8s"]
]
  },
  { name:"Junkrat", role:"damage",
core: [
  ["Damage Dealt","250%"],
  ["Concussion Mine Cooldown","50%"],
  ["Steel Trap Cooldown","25%"],
  ["Concussion/Frag Knockback","25%"],
  ["Ult Duration","25%"]
],
pap: [
  ["RIP-Tire","User is phased (invuln) during ult"],
  ["Explosives","~4× blast radius"]
]
  },
  { name:"Mei", role:"damage",
core: [
  ["Damage Dealt","500%"],
  ["Clip Size Scalar","300%"],
  ["Cryo-Freeze Cooldown","75%"],
  ["Ice Wall Cooldown","25%"],
  ["Freeze Stacking","Enabled"],
  ["Health","40%"],
  ["Min Freeze","100%"]
],
pap: [
  ["—","(design TBD)"]
]
  },
  { name:"Pharah", role:"damage",
core: [
  ["Damage Dealt","250%"],
  ["Clip Size Scalar","200%"],
  ["Concussive Blast Cooldown","50%"],
  ["Hover Charge Rate","5%"],
  ["Jump Jet Cooldown","300%"]
],
pap: [
  ["—","(design TBD)"]
]
  },
  { name:"Reaper", role:"damage",
core: [
  ["Shadow Step Cooldown","50%"]
],
pap: [
  ["—","(design TBD)"]
]
  },
  { name:"Soldier: 76", role:"damage",
core: [
  ["Clip Size Scalar","82%"]
],
pap: [
  ["—","(design TBD)"]
]
  },
  { name:"Sombra", role:"damage",
core: [
  ["Clip Size Scalar","150%"],
  ["Damage Dealt","200%–250% (team variants)"],
  ["Hack Cooldown","25%"],
  ["Translocator Cooldown","75%"],
  ["Virus Cooldown","300%"],
  ["Projectile Speed","10%"]
],
pap: [
  ["—","(design TBD)"]
]
  },
  { name:"Symmetra", role:"damage",
core: [
  ["Damage Dealt","70%"],
  ["Sentry Turret Cooldown","200%"]
],
pap: [
  ["—","(design TBD)"]
]
  },
  { name:"Torbjörn", role:"damage",
core: [
  ["Damage Dealt","70%"],
  ["Deploy Turret Cooldown","25%"],
  ["Overload Cooldown","40%"],
  ["Ult Gen (Molten Core)","220%"]
],
pap: [
  ["Molten Core","Super-stacking lava output (design expand)"]
]
  },
  { name:"Tracer", role:"damage",
core: [
  ["Damage Dealt","260%"],
  ["Health","67%"]
],
pap: [
  ["—","(design TBD)"]
]
  },
  { name:"Widowmaker", role:"damage",
core: [
  ["Damage Dealt","500%"],
  ["Grappling Hook Cooldown","35%"],
  ["Health","58%"],
  ["Venom Mine Cooldown","0%"]
],
pap: [
  ["—","(design TBD)"]
]
  },

  // ---- Tanks from settings/table ----
  { name:"D.Va", role:"tank",
core: [
  ["Health","26% (team 1) / 26% (team 2 mech)"],
  ["Boosters Cooldown","200%"],
  ["Self-Destruct","Disabled (Team 1 Ult)"],
  ["Notes","Gains an ability shield after using ‘shield’ ability (design note)"]
],
pap: [
  ["Micro Missiles","Fires big rockets that deal massive damage"],
  ["Deploy","+100 HP when deploying shield"]
]
  },
  { name:"Doomfist", role:"tank",
core: [
  ["Damage Dealt","60%"],
  ["Health","40% (team1) / 250% (team2)"],
  ["No Ammo Requirement","On"],
  ["Power Block/Rocket Punch/Seismic Slam CD","50%"]
],
pap: [
  ["Seismic Slam","Knocks down enemies"]
]
  },
  { name:"Junker Queen", role:"tank",
core: [
  ["Health","50%"],
  ["Healing Received","50%"],
  ["Projectile Speed","15%"]
],
pap: [
  ["Jagged Blade / Axe","Axe swing roots enemies ~4s"]
]
  },
  { name:"Orisa", role:"tank",
core: [
  ["Damage Dealt","20%"],
  ["Health","32%–34%"],
  ["Javelin Spin CD","25%"],
  ["Energy Javelin/Fortify CD","50% / 75%"],
  ["Projectile Speed","10%"]
],
pap: [
  ["—","(design TBD)"]
]
  },
  { name:"Ramattra", role:"tank",
core: [
  ["Health","40%–50%"],
  ["Nemesis Form CD","0%"],
  ["Healing Received","50%"]
],
pap: [
  ["—","(design TBD)"]
]
  },
  { name:"Reinhardt", role:"tank",
core: [
  ["Health","27%–25%"],
  ["Damage Dealt","65%"],
  ["Charge CD","50%"],
  ["Fire Strike CD","10%"],
  ["Barrier Field Recharge","300%"],
  ["Earthshatter Gen","165% (+combat variants)"]
],
pap: [
  ["—","(design TBD)"]
]
  },
  { name:"Roadhog", role:"tank",
core: [
  ["Health","23%–20%"],
  ["Damage Dealt","105% (team1) / 50% (team2)"],
  ["Chain Hook CD","0%"],
  ["Healing Received","33%"]
],
pap: [
  ["—","(design TBD)"]
]
  },
  { name:"Sigma", role:"tank",
core: [
  ["Health","32%–38%"],
  ["Damage Dealt","420%"],
  ["Accretion Knockback","300% (CD 25% team2)"],
  ["Barrier: CD / Recharge","0% / 300%"],
  ["Kinetic Grasp CD","0% (team2)"]
],
pap: [
  ["—","(design TBD)"]
]
  },
  { name:"Winston", role:"tank",
core: [
  ["Health","32%–10%"],
  ["Damage Dealt","70%"],
  ["Barrier Projector","20% CD (team1) / Disabled (team2)"],
  ["Jump Vertical Speed","80%"],
  ["Ult Duration","500% (team2)"]
],
pap: [
  ["—","(design TBD)"]
]
  },
  { name:"Wrecking Ball", role:"tank",
core: [
  ["Health","24%–25%"],
  ["Damage Dealt","200%"],
  ["Grappling Claw CD","250%"],
  ["Healing Received","50%"],
  ["Movement Speed","50% (team2)"]
],
pap: [
  ["—","(design TBD)"]
]
  },
  { name:"Zarya", role:"tank",
core: [
  ["Health","38%"],
  ["Damage Dealt","420%"],
  ["Clip Size Scalar","200%"],
  ["Particle / Projected Barrier CD","40% / 40%"],
  ["Spawn with Ultimate","Enabled (team1)"]
],
pap: [
  ["—","(design TBD)"]
]
  }
];;
const PERKS = [["Juggernaut", "Gain double health", "+25 temp HP after 10s no damage per tier"], ["Sprint Burst", "Stronger sprint when hit by enemy", "+2.5% MS + extra 5% on hit per tier"], ["Healing Dealt & Regen", "Greatly increases healing dealt", "Regen delay −20% per tier"], ["Double-Mag", "Reloading consumes ½ a magazine", "10% (T1) → 30% (T3) chance reload uses no ammo"], ["Quick Revive", "Self-revive in solo; faster revives in co-op", "Stacks in solo; revive time −15% per tier"], ["Headshot Maniac", "HS ramp up damage; body shots ramp down", "Higher ceiling & floor per tier"], ["Pack-a-Punch", "Unlocks extra abilities + bonus damage", "+100% extra damage per tier (show HUD badge)"], ["Electric Cherry", "Shock AoE on reload", "+30% radius per tier"], ["Bandolier Bandit", "Increased ammo stock", "More stock per tier"], ["PHD Flopper", "Fall-damage slam explodes for high damage", "Higher damage per tier"], ["Follower’s Enchantment", "Follower swaps heroes every 60s", "−10s per tier"], ["Second Wind", "Temp HP regen burst on elimination", "Faster regen per tier"], ["Banker’s Luck", "Each round: −5% to +15% points delta", "+2.5% to the positive bound per tier"], ["Pack Rat", "Increase max monkey grenades", "+1 per tier"], ["Ultimate Stacker", "Hold multiple ult charges", "+1 charge per tier"], ["Bullet Broker", "Reload spends points instead of ammo", "−100 points cost per tier"], ["Time Warden", "1×/round: hold interact 3s to slow time 10s", "+2s duration per tier; lower CD"], ["Space Warden", "Hold interact 3s to random-teleport ≤40m", "Lower cooldown per tier"], ["Glass Cannon", "Half max HP; increased damage +5% MS", "More damage +2% MS per tier"], ["Insta Reload", "Instantly refills clip on reload", "Also refills HP bar; +25 points per tier"], ["Pack Leader", "Buff ally damage at your expense", "Higher ally buff per tier"], ["Slow ’n Steady", "−10% MS; melee stuns longer", "−2.5% MS for +0.5s stun per tier"], ["Door Man", "Doors 10% cheaper", "Then +25%, then +50%"], ["Mystery Man", "Box won’t teleport once (consumes perk)", "+1 non-teleport use per tier (lose a tier each use)"], ["Twisted Cowboy", "Body shots cause weak explosions", "Explosion damage ↑ per tier"], ["Omnic Technician", "Shows next zombie type", "More intel (e.g., HP) per tier"], ["Speed Runner", "2× movement speed between rounds", "+50% per tier"], ["Biker’s Tequila", "Summon a bike; run over zombies", "Bike HP ↑ + 50% more dmg per tier"], ["Faulty Augment", "Replace HP with decaying overhealth (start 25 +25 per final blow)", "+10 per final blow per tier"], ["Fairy Exchange", "Ride follower’s shoulder; insta-kill for 10s (60s CD)", "+5s duration per tier"]];
export default function Wiki(){
 const [q,setQ]=useState(""); const [selected,setSelected]=useState("All Heroes");
 const filtered=useMemo(()=>HEROES.filter((h:any)=>(h.name+" "+(h.role||"")).toLowerCase().includes(q.toLowerCase())),[q]);
 const h=HEROES.find((x:any)=>x.name===selected)||HEROES[0];
 const rows=(a:any[])=>a?.map((r:any[])=> <div className="kv" key={r[0]}><b>{r[0]}</b><code>{r[1]}</code></div>);
 return <main><section className="page-hero"><div className="page-hero__bg"><video autoPlay muted loop playsInline><source src="/videos/hero.webm" type="video/webm"/></video></div><div className="wrap page-hero__content"><div className="eyebrow">Documentation</div><h1>Wiki</h1><p>Everything you need to play (and master) Zombies: Complete Series: fundamentals, perks, wonder weapons, zones, bosses, and more.</p></div></section>
 <section className="content-section"><div className="wrap wiki-layout">
 <aside className="toc"><h3>On this page</h3>{["overview","getting-started","perks","wonder-weapons","heroes","zones","bosses","faq","changelog"].map(x=><a key={x} href={"#"+x}>{x.replaceAll("-"," ")}</a>)}</aside>
 <div className="wiki-content">
 <div className="toolbar"><input value={q} onChange={e=>setQ(e.target.value)} placeholder="Search the wiki… perks, bosses, heroes, zones"/>{["perks","boss","weapon","zone","code"].map(x=><button className="pill" key={x} onClick={()=>setQ(x)}>{x}</button>)}</div>
 <article className="card" id="overview"><h2>Overview</h2><p>Survive escalating waves of zomnics, unlock buyable areas, connect power, and roll the Mystery Box for stronger kits. Bosses gate key progression. Coordination, route knowledge, and perk economy determine late-game survival.</p><ul><li><strong>Players:</strong> 1–4 Co-op</li><li><strong>Goals:</strong> Survive waves • Open routes • Complete boss checks • Optimize perks</li><li><strong>Economy:</strong> Earn from kills/objectives • Spend on doors/perks/box • Risk vs. reward</li></ul></article>
 <article className="card" id="getting-started"><h2>Getting Started</h2><ol><li>Load a code from <a href="/mapcodes">Map Codes</a> and start a custom game.</li><li>Open early routes: prioritize safe loops and a perk station.</li><li>Connect power when your squad has breathing room.</li><li>Roll the Box sparingly; secure perks first.</li><li>Boss prep: have escapes, burst damage, and revives planned.</li></ol></article>
 <article className="card" id="perks"><h2>Perk Details (Tiers)</h2><div className="table-wrap"><table className="data-table"><thead><tr><th>Perk</th><th>Base Effect</th><th>Tier Bonuses (max T3)</th></tr></thead><tbody>{PERKS.map((r:any[])=> <tr key={r[0]}>{r.map((v:any,i:number)=><td key={i}>{v}</td>)}</tr>)}</tbody></table></div><p style={{marginTop:12}}>All perks are one-time purchases unless the player dies. Max tier is 3.</p></article>
 <article className="card" id="wonder-weapons"><h2>Wonder Weapons</h2><p>Rare pulls from the Mystery Box that redefine your kit: big crowd control, burst, or utility spikes. Save resources for perks before high-rolling.</p><ul><li><strong>Drop rate:</strong> Rare</li><li><strong>Role:</strong> Boss burn • Wave clear • Escape tools</li></ul></article>
 <article className="card" id="heroes"><h2>Survivor Changes</h2><p>Every hero has Zombies-specific tuning plus a unique Pack-A-Punch upgrade.</p><div className="hero-dir"><aside className="card"><div className="hero-list">{filtered.map((x:any)=><button className={"hero-item "+(x.name===selected?"active":"")} key={x.name} onClick={()=>setSelected(x.name)}>{x.name}</button>)}</div></aside><article className="card"><h3>{h?.name}</h3><div className="stat-grid"><div><h4>Core Tweaks</h4>{rows(h?.core)}</div><div><h4>Pack-A-Punch</h4>{rows(h?.pap)}</div></div><p style={{marginTop:16}}>{h?.notes||"—"}</p></article></div></article>
 <article className="card" id="zones"><h2>Zones & Routes</h2><div className="grid-2">{[["Urban District","Fast rotations, relay routes, mid-tier density.","Orisa","Standard"],["Radiated Omnic Temple","Tight corridors and corruption spikes.","Ramattra","Hard"],["Harbor Docks","Beginner-friendly lanes, generous buyables, and clear sightlines.","Reinhardt","Beginner"],["Arcology Spire","Verticality with teleporter doors. For squads chasing high-wave milestones.","D.Va","Endgame"]].map(x=><div className="card" key={x[0]}><h3>{x[0]}</h3><p>{x[1]}</p><div className="meta"><span className="pill">Boss: {x[2]}</span><span className="pill">Tier: {x[3]}</span></div></div>)}</div></article>
 <article className="card" id="bosses"><h2>Bosses</h2><div className="grid-2">{[["Orisa — Sentry Protocol","Telegraphed fortify windows, line-break charges, and lane denial."],["D.Va — Mech Overclock","Burst windows around micro missile volleys; punish eject timings."],["Reinhardt — Shieldbreaker","Cone swings with gap-closers; bait charges into terrain."],["Ramattra — Corruption","Phase spikes with adds and area denial."]].map(x=><details key={x[0]} open><summary>{x[0]}</summary><p>{x[1]}</p></details>)}</div></article>
 <article className="card" id="faq"><h2>FAQ</h2><details open><summary>Do donations unlock in-game benefits?</summary><p>No. To respect Blizzard’s policies, donations don’t provide gameplay advantages or exclusive items.</p></details><details><summary>Where do I report bugs or balance feedback?</summary><p>Use the survey on the home page or open an issue on GitHub.</p></details><details><summary>Performance tips?</summary><p>Reduce particle clutter, stick to clean loops, and avoid cross-pulling waves during power spikes.</p></details></article>
 <article className="card" id="changelog"><h2>Changelog</h2><details open><summary>v0.7.8</summary><ul><li>Balance: adjusted Orisa lane denial timings.</li><li>Economy: perk cost smoothing for early routes.</li><li>Fixes: box teleporter edge case on Urban District.</li></ul></details><details><summary>v0.7.7</summary><ul><li>Temple corruption spike tuning.</li><li>Minor UI polish on overlay captions.</li></ul></details></article>
 </div></div></section></main>
}