 "use client";

import React, { useMemo, useState } from "react";

type MapEntry = {
  title: string;
  image: string;
  difficulty: string;
  boss: string;
  description: string;
  code: string;
  tags: string;
};

const MAPS: MapEntry[] = [
  {
    title: "Antarctic Peninsula",
    image: "/images/map-urban.jpg",
    difficulty: "Standard",
    boss: "Orisa",
    description:
      "City core with fast rotations, power relays, and mid‑tier wave density. Great for new squads learning perks.",
    code: "T5M30",
    tags: "standard urban orisa utilities",
  },
  {
    title: "shambali Monastery",
    image: "/images/map-temple.jpg",
    difficulty: "Hard",
    boss: "Ramattra",
    description:
      "Tight corridors, corrupted nodes, and unpredictable wave spikes. Bring a coordinated team.",
    code: "57RS2",
    tags: "hard temple ramattra origins",
  },
  {
    title: "Hanamura",
    image: "/images/map-docks.jpg",
    difficulty: "Beginner",
    boss: "Reinhardt",
    description:
      "Open sightlines and generous buyable areas. Strong starter map for perk/weapon flow.",
    code: "C6R00",
    tags: "beginner docks reinhardt",
  },
  {
    title: "Kings Row",
    image: "/images/map-arcology.jpg",
    difficulty: "Endgame",
    boss: "D.Va",
    description:
      "Vertical lanes, teleporter doors, and scaling elite variants. For squads chasing leaderboards.",
    code: "JPSXJ",
    tags: "endgame arcology dva",
  },
];

const DIFFICULTIES = ["All", "Beginner", "Standard", "Hard", "Endgame"];

function useFilteredMaps(query: string) {
  return useMemo(() => {
    const q = query.trim().toLowerCase();
    if (!q) return MAPS;
    return MAPS.filter((m) =>
      [m.title, m.difficulty, m.boss, m.description, m.tags, m.code]
        .join(" ")
        .toLowerCase()
        .includes(q)
    );
  }, [query]);
}

function MapCard({ map, onCopy }: { map: MapEntry; onCopy: (code: string) => void }) {
  return (
    <article className="card" key={map.title}>
      <div className="media">
        <img src={map.image} alt={map.title} />
      </div>
      <h2>{map.title}</h2>
      <div className="meta">
        <span className="pill">{map.difficulty}</span>
        <span className="pill">Boss: {map.boss}</span>
        <span className="pill">v0.8.4</span>
      </div>
      <p>{map.description}</p>
      <div className="card-actions">
        <button className="btn btn--primary" onClick={() => onCopy(map.code)}>
          Copy {map.code}
        </button>
        <a className="btn" href="https://workshop.codes/ZBWIKI" target="_blank" rel="noreferrer">
          Wiki ↗
        </a>
      </div>
    </article>
  );
}

export default function MapCodes() {
  const [query, setQuery] = useState("");
  const [copied, setCopied] = useState("");

  const filtered = useFilteredMaps(query);

  async function copyToClipboard(code: string) {
    // navigator.clipboard may be unavailable in some environments; guard defensively
    if (navigator.clipboard?.writeText) {
      try {
        await navigator.clipboard.writeText(code);
      } catch (err) {
        // swallow errors silently to preserve UX parity with original
      }
    }

    setCopied(code);
    setTimeout(() => setCopied(""), 1400);
  }

  return (
    <main>
      <section className="page-hero">
        <div className="page-hero__bg">
          <video autoPlay muted loop playsInline>
            <source src="/media/hero-loop.webm" type="video/webm" />
          </video>
        </div>

        <div className="wrap page-hero__content">
          <div className="eyebrow">Play the Mode</div>
          <h1>Map Codes</h1>
          <p>Grab the latest Overwatch Workshop codes for each map/zone. Copy, share, and jump in with your squad.</p>
        </div>
      </section>

      <section className="content-section">
        <div className="wrap">
          <div className="toolbar">
            <input
              value={query}
              onChange={(e) => setQuery(e.target.value)}
              placeholder="Search by map, zone, boss, tag…"
            />

            {DIFFICULTIES.map((d) => (
              <button
                className="pill"
                key={d}
                onClick={() => setQuery(d === "All" ? "" : d)}
              >
                {d}
              </button>
            ))}
          </div>

          <div className="grid-2">
            {filtered.map((m) => (
              <MapCard key={m.title} map={m} onCopy={copyToClipboard} />
            ))}
          </div>

          {copied && (
            <div className="notice" style={{ marginTop: 16 }}>
              Copied: {copied}
            </div>
          )}
        </div>
      </section>
    </main>
  );
}
