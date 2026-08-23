 "use client";

import React, { useEffect, useRef, useState } from "react";

type Track = {
  title: string;
  duration: string;
  src: string;
};

type Vibe = {
  name: string;
  frequency: string;
  description: string;
  tracks: Track[];
};

const VIBES: Vibe[] = [
  {
    name: "Neon Afterdark",
    frequency: "88.4",
    description: "Rain-slick streets, broken lights, and a beat that refuses to die.",
    tracks: [
      { title: "Circuit Breaker", duration: "4:42", src: "/assets/audio/kingsrow/circuit-breaker.mp3" },
    ],
  },
  {
    name: "Temple Static",
    frequency: "101.7",
    description: "Low frequencies from the monastery, carried through the dust and static.",
    tracks: [
      { title: "Battle at the Temple", duration: "3:55", src: "/assets/audio/shambalimonastery/battle-temple.mp3" },
      { title: "Temple Descent", duration: "3:12", src: "/assets/audio/shambalimonastery/temple-descent.mp3" },
    ],
  },
  {
    name: "Last Light",
    frequency: "107.3",
    description: "A quieter signal for the long way home, if there is still a home to find.",
    tracks: [],
  },
];

export default function Radio() {
  const audioRef = useRef<HTMLAudioElement | null>(null);
  const shouldAutoplayRef = useRef(false);
  const [selectedVibe, setSelectedVibe] = useState(0);
  const [current, setCurrent] = useState<Track | null>(VIBES[0].tracks[0] ?? null);
  const [isPlaying, setIsPlaying] = useState(false);
  const vibe = VIBES[selectedVibe];

  useEffect(() => {
    if (!audioRef.current || !current || !shouldAutoplayRef.current) return;
    shouldAutoplayRef.current = false;
    audioRef.current.load();
    const p = audioRef.current.play();
    if (p && typeof p.then === "function") {
      p.then(() => setIsPlaying(true)).catch(() => setIsPlaying(false));
    } else {
      setIsPlaying(true);
    }
  }, [current]);

  function changeVibe(index: number) {
    setSelectedVibe(index);
    shouldAutoplayRef.current = true;
    setCurrent(VIBES[index].tracks[0] ?? null);
    setIsPlaying(false);
  }

  function togglePlay() {
    const audio = audioRef.current;
    if (!audio || !current) return;
    if (audio.paused) {
      audio.play().then(() => setIsPlaying(true)).catch(() => setIsPlaying(false));
    } else {
      audio.pause();
      setIsPlaying(false);
    }
  }

  function playNextTrack() {
    if (vibe.tracks.length === 0 || !current) {
      setIsPlaying(false);
      return;
    }

    const currentIndex = vibe.tracks.findIndex((track) => track.src === current.src);
    const nextIndex = currentIndex >= 0 ? (currentIndex + 1) % vibe.tracks.length : 0;
    shouldAutoplayRef.current = true;
    setCurrent(vibe.tracks[nextIndex]);
  }

  return (
    <main>
      <section className="page-hero">
        <div className="wrap page-hero__content">
          <div className="eyebrow">In-universe soundtrack</div>
          <h1>Survivor Radio</h1>
          <p>Find a signal. Tune in. Keep moving.</p>
        </div>
      </section>

      <section className="content-section">
        <div className="wrap radio-wrap">
          <div className="radio-console">
            <div className="radio-console__topline">
              <span>OWZ // EMERGENCY BROADCAST</span>
              <span>POWER <i /></span>
            </div>

            <div className="radio-console__face">
              <div className="radio-console__dial-wrap">
                <div className={`radio-dial radio-dial--${selectedVibe}`}>
                  <div className="radio-dial__cap" />
                  <div className="radio-dial__pointer" />
                </div>
                <label htmlFor="vibe-dial">Tune the signal</label>
                <input
                  id="vibe-dial"
                  className="radio-dial__input"
                  type="range"
                  min="0"
                  max={VIBES.length - 1}
                  step="1"
                  value={selectedVibe}
                  onChange={(event) => changeVibe(Number(event.target.value))}
                  aria-label="Choose a music vibe"
                />
                <div className="radio-dial__scale"><span>88</span><span>102</span><span>107</span></div>
              </div>

              <div className="radio-console__display">
                <div className="radio-console__frequency">{vibe.frequency}<small> FM</small></div>
                <div className="radio-console__signal"><span /><span /><span /><span /><span /></div>
                <div className="radio-console__station">{vibe.name}</div>
                <p>{vibe.description}</p>
              </div>
            </div>

            <div className="radio-console__controls">
              <button className="btn btn--primary" onClick={togglePlay} disabled={!current}>
                {isPlaying ? "❚❚ Pause" : "▶ Play signal"}
              </button>
              <audio
                ref={audioRef}
                src={current?.src}
                controls
                onPlay={() => setIsPlaying(true)}
                onPause={() => setIsPlaying(false)}
                onEnded={playNextTrack}
              />
            </div>

            <div className="radio-console__queue">
              <div className="radio-console__queue-heading">
                <span>Available transmissions</span>
                <span>{vibe.tracks.length} track{vibe.tracks.length === 1 ? "" : "s"}</span>
              </div>
              {vibe.tracks.length > 0 ? vibe.tracks.map((track) => (
                <button
                  className={`radio-track ${current?.src === track.src ? "radio-track--active" : ""}`}
                  key={track.title}
                  onClick={() => {
                    shouldAutoplayRef.current = true;
                    setCurrent(track);
                  }}
                >
                  <span className="radio-track__play">{current?.src === track.src && isPlaying ? "❚❚" : "▶"}</span>
                  <span>{track.title}</span>
                  <span>{track.duration}</span>
                </button>
              )) : <p className="radio-console__empty">No transmission on this frequency yet.</p>}
            </div>
          </div>
        </div>
      </section>
    </main>
  );
}
