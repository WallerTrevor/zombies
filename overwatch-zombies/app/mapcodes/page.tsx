"use client";

import { useState } from "react";
import { trackGoatCounterEvent } from "../goatcounter-events";

type MapEntry = {
  title: string;
  image: string | null;
  description: string | null;
  code: string;
};

const MAPS: MapEntry[] = [
  {
    title: "Antarctic Peninsula",
    image: "/assets/images/map-antarcticp.jpg",
    description:
      "Three zones joined by a teleporter, each with a champion boss: the Devastator, the Colossal Charger and the Imperial Warmech.",
    code: "T5M30",
  },
  {
    title: "Shambali Monastery",
    image: "/assets/images/map-shambalimonastery.jpg",
    description: null,
    code: "57RS2",
  },
  {
    title: "Hanamura",
    image: null,
    description: null,
    code: "C6R00",
  },
  {
    title: "Kings Row",
    image: "/assets/images/map-kingsrow.jpg",
    description: null,
    code: "JPSXJ",
  },
];

function MapCard({ map, onCopy }: { map: MapEntry; onCopy: (code: string) => void }) {
  return (
    <article className="card">
      <div className="media">
        {map.image ? (
          <img src={map.image} alt={map.title} />
        ) : (
          <div className="media__placeholder">{map.title}</div>
        )}
      </div>
      <h2>{map.title}</h2>
      {map.description && <p>{map.description}</p>}
      <div className="card-actions">
        <button className="btn btn--primary" onClick={() => onCopy(map.code)}>
          Copy {map.code}
        </button>
      </div>
    </article>
  );
}

export default function MapCodes() {
  const [copied, setCopied] = useState("");

  async function copyToClipboard(code: string) {
    trackGoatCounterEvent(`copy-code/${code.toLowerCase()}`);
    try {
      await navigator.clipboard?.writeText(code);
    } catch {}
    setCopied(code);
    setTimeout(() => setCopied(""), 1400);
  }

  return (
    <main>
      <section className="page-hero">
        <div className="wrap page-hero__content">
          <div className="eyebrow">Play the mode</div>
          <h1>Map Codes</h1>
          <p>
            In Overwatch, go to Play, Custom Games and Create, then Settings, and import the code. Up to four
            players.
          </p>
        </div>
      </section>

      <section className="content-section">
        <div className="wrap">
          <div className="grid-2">
            {MAPS.map((m) => (
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
