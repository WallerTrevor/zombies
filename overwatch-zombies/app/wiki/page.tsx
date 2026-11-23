"use client";
import { useMemo, useState } from "react";
import heroes from "./heroes.json";
import lobby from "./settings.json";

type Role = "damage" | "tank" | "support";
type Hero = { name: string; role: Role; cost: number; lobby: [string, string][] };

const PAP: Record<string, string> = {
  Baptiste: "Regenerative Burst also gives you 100 extra health.",
  Bastion: "Firing in Assault configuration launches homing rockets.",
  "Torbjörn": "Say “I need healing” to drop a dispenser that heals and refills magazines for 30 seconds (90 second cooldown).",
  Roadhog: "Take a Breather also heals teammates within 5 metres.",
  "Soldier: 76": "Helix Rockets also launch a homing rocket.",
  Echo: "Secondary fire shoots homing sticky bombs.",
  Juno: "Secondary fire shoots homing sticky bombs.",
  Winston: "Primal Rage makes you unkillable for 10 seconds.",
  Symmetra: "Your ultimate phases you out for 10 seconds.",
  Brigitte: "Rally makes you 1.5× bigger with 1,000 extra health for 8 seconds, and Shield Bash knocks stunned zombies down.",
  Zenyatta: "Transcendence deals 300 damage a second to zombies within 10 metres.",
  Zarya: "Barriers used during Graviton Surge come straight back.",
  Widowmaker: "Infra-Sight makes zombies ignore you for 4 seconds (16 in co-op).",
  "Lúcio": "Sound Barrier roots zombies within 3 metres for 3 seconds.",
  Ramattra: "Annihilation gives every living player 1,000 points and 5 magazines.",
  Genji: "Swinging Dragonblade also throws a fire strike.",
  Orisa: "Your ultimate makes you twice as big with 10× damage for 8 seconds.",
  Kiriko: "Kitsune Rush slows zombies within 15 metres to half speed for 8 seconds.",
  Sojourn: "Power Slide knocks down zombies within 3 metres for 4 seconds.",
  Tracer: "Recall stuns zombies within 5 metres for 4 seconds.",
  Sombra: "Ability 2 makes zombies ignore you for 4 seconds.",
  "D.Va": "Micro Missiles also fire a homing rocket.",
  Lifeweaver: "Ability 2 gives teammates in front of you 100 extra health.",
  Pharah: "Ability 2 fires a stream of homing rockets.",
  Cassidy: "Primary fire shots explode for 420 damage around the target.",
  Sigma: "Hits explode for 200 damage around the target, and kills give 50 extra points.",
  Junkrat: "Hits explode for 300 damage around the target.",
  Moira: "Coalescence roots the zombies it hits for 4 seconds.",
  Venture: "Melee kills explode for 800 damage around the target.",
  Mauga: "Kills reset your ability cooldowns.",
};

const DIFFICULTIES = [
  ["Easy", "15%", "35%", "0.45 s", "36", "No limit", "Unlimited"],
  ["Normal", "25%", "25%", "0.35 s", "52", "60 s", "Normal"],
  ["Hard", "50%", "25%", "0.3 s", "72", "30 s", "Normal"],
  ["Veteran", "100%", "20%", "0.25 s", "No limit", "20 s", "Normal"],
  ["Extreme", "200%", "15%", "0.15 s", "No limit", "15 s", "Low"],
];

const PERKS = [
  ["Juggernog", "2,500", "Double max health. Tier 2/3: heal 25/50 health 10 seconds after a hit."],
  ["Stamin-Up", "2,000", "Speed burst for 1 second when hit: 180/200/220%, then 105/107/110% speed."],
  ["Quick Revive", "1,500", "One self-revive per tier, with 10 seconds of invincibility."],
  ["Doorman", "2,000", "50/60/70% off every door."],
  ["Double Mag", "3,000", "A reload uses half a magazine instead of a whole one. Tier 2/3: 0.4/0.3 of a magazine."],
];

const POWER_UPS = [
  ["Double Points", "Every kill is worth twice as much for 60 seconds."],
  ["Insta-Kill", "Every hit kills for 30 seconds."],
  ["Max Ammo", "Refills everyone's magazines."],
  ["Vaporize", "Kills every zombie on the map."],
  ["Time Freeze", "Slows time down for 10 seconds."],
  ["Unlimited Ultimate", "Ultimates recharge instantly for 15 seconds."],
  ["Fire Sale", "Every Mystery Box in the zone costs 10 points for 30 seconds."],
];

const SECTIONS = [
  ["overview", "Overview"],
  ["how-to-play", "How to play"],
  ["settings", "Game settings"],
  ["points", "Points & prices"],
  ["perks", "Perks"],
  ["pack-a-punch", "Pack-a-Punch"],
  ["heroes", "Heroes"],
  ["power-ups", "Power-ups"],
  ["map", "Antarctic Peninsula"],
  ["bosses", "Bosses"],
  ["coins", "Ramattra coins"],
  ["going-down", "Going down"],
  ["lobby", "Lobby settings"],
  ["faq", "FAQ"],
];

type Pair = [string, string];
type HeroSettings = { name: string; players: Pair[]; zombies: Pair[] };

const HERO_SETTINGS = lobby.heroes as HeroSettings[];

const WORKSHOP_SETTINGS = [
  ["Cheats", "Starting points", "500", "500 to 1,000,000"],
  ["Cheats", "Starting wave", "1", "1 to 100"],
  ["Cheats", "Power on from the start", "Off", "On or off"],
  ["Cheats", "God mode", "Off", "On or off"],
  ["Cheats", "Explosive rounds", "Off", "On or off"],
  ["Cheats", "Gravity", "100", "25 to 200"],
  ["Cheats", "Projectile gravity team 1", "100", "25 to 500"],
  ["Cheats", "Projectile speed team 1", "100", "25 to 500"],
  ["Cheats", "Projectile gravity team 2", "75", "25 to 500"],
  ["Cheats", "Projectile speed team 2", "50", "25 to 500"],
  ["Pathfinding", "Zombies pathfind when stuck or you are above them", "On", "On or off"],
  ["Pathfinding", "Zombies run faster when far away", "On", "On or off"],
  ["Pathfinding", "Server load limit for zombie AI extras", "200", "50 to 250"],
];

function PairList({ pairs }: { pairs: Pair[] }) {
  if (pairs.length === 0) return <span className="muted">Default</span>;
  return (
    <>
      {pairs.map(([k, v]) => (
        <div className="kv" key={k}>
          <b>{k}</b>
          <code>{v}</code>
        </div>
      ))}
    </>
  );
}

const ROLE_LABEL: Record<Role, string> = { damage: "Damage", tank: "Tank", support: "Support" };

export default function Wiki() {
  const list = heroes as Hero[];
  const [query, setQuery] = useState("");
  const [selected, setSelected] = useState(list[0].name);

  const filtered = useMemo(
    () => list.filter((h) => `${h.name} ${h.role}`.toLowerCase().includes(query.toLowerCase())),
    [list, query],
  );
  const hero = list.find((h) => h.name === selected) ?? list[0];
  const zombie = HERO_SETTINGS.find((h) => h.name === hero.name);

  return (
    <main>
      <section className="page-hero">
        <div className="wrap page-hero__content">
          <div className="eyebrow">Wiki</div>
          <h1>How Zombies works</h1>
          <p>
            Everything in the current version of the mode: settings, points, perks, Pack-a-Punch, every hero,
            the map and its bosses.
          </p>
        </div>
      </section>

      <section className="content-section">
        <div className="wrap wiki-layout">
          <aside className="toc">
            <h3>On this page</h3>
            {SECTIONS.map(([id, label]) => (
              <a key={id} href={`#${id}`}>
                {label}
              </a>
            ))}
          </aside>

          <div className="wiki-content">
            <article className="card" id="overview">
              <h2>Overview</h2>
              <p>
                Ramattra has turned the omnics into zombies. Up to four players hold out against endless waves on
                Antarctic Peninsula: earn points, open doors, buy heroes and perks, turn on the power and take on
                his champions. Each wave is bigger than the last.
              </p>
            </article>

            <article className="card" id="how-to-play">
              <h2>How to play</h2>
              <ol>
                <li>
                  Copy the code from <a href="/mapcodes">Map Codes</a>, create a custom game and import it in the
                  Workshop settings.
                </li>
                <li>Wait for the start screen to finish loading. Press Melee to open the game settings.</li>
                <li>Press Jump to start, then walk out of the spawn room. The first wave starts once someone is out.</li>
                <li>Zombies come in through the barricades. Hold Reload at one to repair it for 10 points.</li>
                <li>Spend your points on doors, heroes and the Mystery Box. Find the power switch to unlock perks.</li>
              </ol>
              <p>
                Ashe and D.Va are the starting heroes. You carry two heroes at a time: Crouch swaps between them,
                and each keeps its own ultimate charge and Pack-a-Punch tier.
              </p>
            </article>

            <article className="card" id="settings">
              <h2>Game settings</h2>
              <p>
                Anyone can change these on the start screen (Melee). Everyone sees the same settings screen.
              </p>
              <h3>Difficulty</h3>
              <div className="table-wrap">
                <table className="data-table">
                  <thead>
                    <tr>
                      <th>Difficulty</th>
                      <th>Damage taken</th>
                      <th>Healing</th>
                      <th>Zombie reaction</th>
                      <th>Zombies per wave</th>
                      <th>Revive time</th>
                      <th>Ammo</th>
                    </tr>
                  </thead>
                  <tbody>
                    {DIFFICULTIES.map((row) => (
                      <tr key={row[0]}>
                        {row.map((cell, i) => (
                          <td key={i}>{cell}</td>
                        ))}
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
              <p>
                On Veteran and Extreme the hero buy spots and perk machines swap places every game. Melee stuns
                zombies only on Easy.
              </p>
              <h3>Waves</h3>
              <ul>
                <li><strong>Brigitte:</strong> every zombie is a Brigitte.</li>
                <li><strong>Torbjörn:</strong> every zombie is a Torbjörn.</li>
                <li><strong>Random heroes:</strong> two random heroes each wave, with a wave boss from round 5.</li>
                <li><strong>Director&apos;s cut:</strong> a set mix of heroes that changes every three rounds, each with its own wave boss.</li>
                <li><strong>Fully random:</strong> every zombie is a random hero, and there is no wave boss.</li>
              </ul>
              <h3>XP system</h3>
              <p>
                Off by default. Each hero levels up on its own (100 XP a level, 10 to 20 XP a kill) and unlocks its
                kit as it goes: secondary fire at level 5, ability 1 at 10, ability 2 at 15 and the ultimate at
                20. Levels are kept between games for as long as the lobby stays open.
              </p>
            </article>

            <article className="card" id="points">
              <h2>Points &amp; prices</h2>
              <p>
                You start with 500 points. A kill is worth about 90 points, more for headshots and melee kills,
                plus a bonus for your hero&apos;s role, and kills are worth a little more every round. Reviving a
                teammate gives 100 points.
              </p>
              <div className="table-wrap">
                <table className="data-table">
                  <tbody>
                    <tr><td>Door</td><td>1,000 (doors in a group all open together)</td></tr>
                    <tr><td>Hero</td><td>500 to 1,750 at its buy spot (Interact); Mei is 30,000</td></tr>
                    <tr><td>Follower</td><td>A third of the hero&apos;s price (hold Reload at its buy spot)</td></tr>
                    <tr><td>Magazine refill</td><td>Half the hero&apos;s price, at the spot of the hero you are playing</td></tr>
                    <tr><td>Mystery Box</td><td>950 for a random hero (10 during a Fire Sale)</td></tr>
                    <tr><td>Monkey bomb</td><td>2,500, needs the power on</td></tr>
                    <tr><td>Bastion trap</td><td>1,000, lasts 22 seconds</td></tr>
                    <tr><td>Champion fight</td><td>15,000</td></tr>
                  </tbody>
                </table>
              </div>
              <h3>Bank</h3>
              <p>
                The team shares a bank. Deposit and withdraw at it, and upgrade it for 5,000, 10,000 and 20,000
                bank points to earn 3%, 4% and then 6% interest at the end of every round. When the team goes
                down, three quarters of everyone&apos;s points go into the bank, and the bank carries over to the
                next game.
              </p>
              <h3>Credit card</h3>
              <p>
                The credit card office sells three tiers of card (1,000, 2,000 and 4,000 points). A card lets you
                spend into debt, up to 2,000, 10,000 or 20,000 points, gives 1%, 5% or 15% off everything, and
                charges 30%, 20% or 15% interest on your debt each round.
              </p>
            </article>

            <article className="card" id="perks">
              <h2>Perks</h2>
              <p>
                Perk machines only work once the power is on. Each perk can be bought up to tier 3, paying its price
                again for each tier. You lose your perks when you go down.
              </p>
              <div className="table-wrap">
                <table className="data-table">
                  <thead>
                    <tr>
                      <th>Perk</th>
                      <th>Price per tier</th>
                      <th>What it does</th>
                    </tr>
                  </thead>
                  <tbody>
                    {PERKS.map((row) => (
                      <tr key={row[0]}>
                        {row.map((cell, i) => (
                          <td key={i}>{cell}</td>
                        ))}
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
            </article>

            <article className="card" id="pack-a-punch">
              <h2>Pack-a-Punch</h2>
              <p>
                Pack-a-Punch upgrades the hero you are playing, not you: 5,000 points a tier, up to tier 3, for
                2.5×, 5× and then 10× damage. Many heroes also get a special ability, listed under
                Heroes below. Your tier shows next to your hero portrait, and a Pack-a-Punched hero glows.
              </p>
              <p>
                Each of your two heroes keeps its own tier when you swap. Trading a hero away (the Mystery Box or
                a hero buy spot) loses its tier, and so does going down without being revived by the end of the
                round. Your follower gets the same tier as the hero you are playing.
              </p>
              <p>
                Explosions from Pack-a-Punch abilities and the monkey bomb don&apos;t give points for the zombies
                they kill.
              </p>
            </article>

            <article className="card" id="heroes">
              <h2>Heroes</h2>
              <p>
                Every hero can be bought at a buy spot on the map, rolled from the Mystery Box, or hired as a
                follower who rides along and shoots the nearest zombie. A follower does 50% more damage when its
                hero works well with yours. Damage heroes beat tanks, tanks beat supports and supports beat
                damage heroes: you deal more damage to the zombies your role beats, and less to the ones that beat
                it.
              </p>
              <div className="toolbar">
                <input
                  value={query}
                  onChange={(e) => setQuery(e.target.value)}
                  placeholder="Search heroes or a role"
                />
              </div>
              <div className="hero-dir">
                <aside className="card">
                  <div className="hero-list">
                    {filtered.map((h) => (
                      <button
                        className={`hero-item ${h.name === selected ? "active" : ""}`}
                        key={h.name}
                        onClick={() => setSelected(h.name)}
                      >
                        {h.name}
                      </button>
                    ))}
                  </div>
                </aside>
                <article className="card">
                  <h3>{hero.name}</h3>
                  <div className="stat-grid">
                    <div>
                      <h4>Prices</h4>
                      <div className="kv"><b>Role</b><code>{ROLE_LABEL[hero.role]}</code></div>
                      <div className="kv"><b>Hero</b><code>{hero.cost.toLocaleString()}</code></div>
                      <div className="kv"><b>Follower</b><code>{Math.round(hero.cost / 3).toLocaleString()}</code></div>
                      <div className="kv"><b>Magazine refill</b><code>{Math.round(hero.cost / 2).toLocaleString()}</code></div>
                    </div>
                    <div>
                      <h4>Pack-a-Punch</h4>
                      <p>{PAP[hero.name] ?? "Damage boost only."}</p>
                    </div>
                  </div>
                  <div className="stat-grid" style={{ marginTop: 16 }}>
                    <div>
                      <h4>Your hero</h4>
                      <PairList pairs={hero.lobby} />
                    </div>
                    <div>
                      <h4>As a zombie</h4>
                      <PairList pairs={zombie?.zombies ?? []} />
                    </div>
                  </div>
                </article>
              </div>
            </article>

            <article className="card" id="power-ups">
              <h2>Power-ups</h2>
              <p>From round 4, zombies sometimes drop a power-up when they die. Walk over it to pick it up.</p>
              <div className="table-wrap">
                <table className="data-table">
                  <tbody>
                    {POWER_UPS.map(([name, text]) => (
                      <tr key={name}>
                        <td>{name}</td>
                        <td>{text}</td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
            </article>

            <article className="card" id="map">
              <h2>Antarctic Peninsula</h2>
              <p>
                The map is three zones joined by a teleporter. The whole team has to stand on it, and it needs 60
                seconds to recharge after each use. It takes the team on to the next zone, and from the third
                back to the first.
              </p>
              <ul>
                <li><strong>Power switch:</strong> turn it on to unlock the perks. Every zombie on the map uses its ultimate when you do.</li>
                <li><strong>Mystery Box:</strong> one box per game, in a random spot. Hold Reload at it for a follower.</li>
                <li><strong>Monkey bomb:</strong> a tiny Winston you throw with the Ultimate Status voice line. Zombies chase it until it explodes. Three throws a round.</li>
                <li><strong>Barricades:</strong> zombies break in through them. From round 6, new barricades start broken.</li>
                <li><strong>Bastion trap:</strong> calls in Bastions to hold a corridor.</li>
                <li><strong>The ending:</strong> 50,000 points. The heroes you have out keep Pack-a-Punch tier 3 for every game after.</li>
              </ul>
            </article>

            <article className="card" id="bosses">
              <h2>Bosses</h2>
              <h3>Wave bosses</h3>
              <p>
                Most wave styles send one wave boss each wave: a tougher zombie hero with its own moves. It does not
                come back once it dies.
              </p>
              <h3>Ramattra&apos;s champions</h3>
              <p>
                Each zone has a boss spot. Paying 15,000 points there clears the wave and brings out that
                zone&apos;s champion. Beating it gives every living player 20,000 points and a Ramattra coin, then
                the next wave starts. Teleporting away calls the fight off.
              </p>
              <ul>
                <li><strong>Zone 1, the Devastator:</strong> a giant Orisa with rocket launchers and cannons.</li>
                <li><strong>Zone 2, the Colossal Charger:</strong> a giant Reinhardt with a minigun arm.</li>
                <li><strong>Zone 3, the Imperial Warmech:</strong> a giant D.Va with cannons, machine guns and attack squads.</li>
              </ul>
            </article>

            <article className="card" id="coins">
              <h2>Ramattra coins</h2>
              <p>
                You earn one coin for every champion you beat. Say &ldquo;I need healing&rdquo; at a buy spot to
                use coins on it: each use halves the price, up to three times. A use costs 1 coin at a hero spot,
                the Mystery Box or a boss spot, 3 at a perk machine and 5 at Pack-a-Punch. Coins are yours alone
                and stay with your name for as long as the lobby stays open.
              </p>
            </article>

            <article className="card" id="going-down">
              <h2>Going down</h2>
              <p>
                Playing solo, you get three lives. In co-op, stand next to a downed teammate for 2 seconds to
                revive them (2 seconds longer for each revive already done that round), before their revive time
                runs out. Anyone not revived comes back at the start of the next round, next to a teammate, as
                their starting hero, without their Pack-a-Punch. When the whole team is down, the game restarts.
              </p>
            </article>

            <article className="card" id="lobby">
              <h2>Lobby settings</h2>
              <p>
                The custom game settings the code ships with. A hero&apos;s own settings replace the team-wide ones,
                and anything not listed is at its Overwatch default. Team 1 is the players, Team 2 the zombies.
              </p>
              <div className="stat-grid">
                {lobby.modes.map((m) => (
                  <div key={m.name}>
                    <h4>
                      {m.name}: {m.maps.join(", ")}
                    </h4>
                    <PairList pairs={m.settings as Pair[]} />
                  </div>
                ))}
                <div>
                  <h4>Lobby</h4>
                  <PairList pairs={lobby.lobby as Pair[]} />
                </div>
              </div>
              <h3 style={{ marginTop: 24 }}>Every hero</h3>
              <div className="stat-grid">
                <div>
                  <h4>Players</h4>
                  <PairList pairs={lobby.players as Pair[]} />
                </div>
                <div>
                  <h4>Zombies</h4>
                  <PairList pairs={lobby.zombies as Pair[]} />
                </div>
              </div>
              <h4 style={{ marginTop: 16 }}>Both teams</h4>
              <PairList pairs={lobby.general as Pair[]} />
              <p style={{ marginTop: 16 }}>Heroes enabled in the lobby: {lobby.zombieHeroes.join(", ")}.</p>
              <h3 style={{ marginTop: 24 }}>Hero by hero</h3>
              <div className="table-wrap">
                <table className="data-table">
                  <thead>
                    <tr>
                      <th>Hero</th>
                      <th>Players</th>
                      <th>Zombies</th>
                    </tr>
                  </thead>
                  <tbody>
                    {HERO_SETTINGS.map((h) => (
                      <tr key={h.name}>
                        <td style={{ verticalAlign: "top" }}>{h.name}</td>
                        <td style={{ verticalAlign: "top" }}><PairList pairs={h.players} /></td>
                        <td style={{ verticalAlign: "top" }}><PairList pairs={h.zombies} /></td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
              <h3 style={{ marginTop: 24 }}>Workshop settings</h3>
              <div className="table-wrap">
                <table className="data-table">
                  <thead>
                    <tr>
                      <th>Setting</th>
                      <th>Default</th>
                      <th>Range</th>
                    </tr>
                  </thead>
                  <tbody>
                    {WORKSHOP_SETTINGS.map(([group, name, value, range]) => (
                      <tr key={name}>
                        <td>{group}: {name}</td>
                        <td>{value}</td>
                        <td>{range}</td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
              <p style={{ marginTop: 16 }}>Workshop extensions: {lobby.extensions.join(", ")}.</p>
            </article>

            <article className="card" id="faq">
              <h2>FAQ</h2>
              <details open>
                <summary>Do donations unlock anything in game?</summary>
                <p>No. Donations never give gameplay advantages or exclusive items.</p>
              </details>
              <details>
                <summary>Where do I report bugs or balance feedback?</summary>
                <p>Use the survey on the home page.</p>
              </details>
            </article>
          </div>
        </div>
      </section>
    </main>
  );
}
