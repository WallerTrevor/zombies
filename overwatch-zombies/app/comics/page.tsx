 "use client";

import React, { useMemo, useState, useEffect } from "react";

type Issue = {
  title: string;
  cover: string | null;
  preview: string | null;
  tags: string[];
  excerpt: string;
  href: string;
};

// Each issue record drives both its library card and the corresponding preview action.
const ISSUES: Issue[] = [
  {
    title: "Issue #1 — The First Signal",
    cover: "/comics/issue-01-cover.webp",
    preview: null,
    tags: ["Origins", "Ramattra", "Temple"],
    excerpt:
      "An anomalous frequency emanates from a radiated Omnic temple. Ramattra answers — and the code begins to rot.",
    href: "/comics/issue-01.html",
  },
  {
    title: "Issue #2 — Steel and Silence",
    cover: null,
    preview: null,
    tags: ["Bosses", "Orisa"],
    excerpt: "The city is empty — except for the sentry that never sleeps.",
    href: "/comics/issue-02.html",
  },
  {
    title: "Issue #3 — Power Lines",
    cover: null,
    preview: null,
    tags: ["Zones", "Utilities Sector"],
    excerpt: "Connecting the grid is easy. Surviving what wakes up… that’s the trick.",
    href: "/comics/issue-03.html",
  },
];

const CATEGORIES = ["All", "Origins", "Bosses", "Zones", "One-shots"];

function PageHero({ children }: { children?: React.ReactNode }) {
  return (
    <section className="page-hero">
      <div className="page-hero__bg">
        <video autoPlay muted loop playsInline>
          <source src="/media/hero.webm" type="video/webm" />
        </video>
      </div>

      <div className="wrap page-hero__content">
        <div className="eyebrow">Lore & Visual Storytelling</div>
        <h1>Comics</h1>
        {children}
      </div>
    </section>
  );
}

function ContentSection({ children }: { children?: React.ReactNode }) {
  return (
    <section className="content-section">
      <div className="wrap">{children}</div>
    </section>
  );
}

function Toolbar({ query, setQuery }: { query: string; setQuery: (v: string) => void }) {
  return (
    <div className="toolbar">
      <input
        value={query}
        onChange={(e) => setQuery(e.target.value)}
        placeholder="Search issues, characters, locations…"
      />

      {/* Category pills reuse the search field as quick filters instead of maintaining separate state. */}
      {CATEGORIES.map((c) => (
        <button
          className="pill"
          key={c}
          onClick={() => setQuery(c === "All" ? "" : c)}
        >
          {c}
        </button>
      ))}
    </div>
  );
}

function ComicCard({ issue, onPreview }: { issue: Issue; onPreview: (preview: string) => void }) {
  const preview = issue.preview;

  return (
    <article className="card">
      <div className="media">
        {issue.cover ? (
          <img src={issue.cover} alt={issue.title} />
        ) : (
          <div className="media__placeholder">Cover artwork coming soon</div>
        )}
      </div>

      <h2>{issue.title}</h2>

      <div className="meta">
        {issue.tags.map((t) => (
          <span className="pill" key={t}>
            {t}
          </span>
        ))}
      </div>

      <p>{issue.excerpt}</p>

      <div className="card-actions">
        <a className="btn btn--primary" href={issue.href}>
          Read
        </a>
        {preview && (
          <button className="btn" onClick={() => onPreview(preview)}>
            Preview
          </button>
        )}
      </div>
    </article>
  );
}

function Lightbox({ src, onClose }: { src: string; onClose: () => void }) {
  useEffect(() => {
    // Scope Escape handling to the open preview and remove the listener when it closes.
    function onKey(e: KeyboardEvent) {
      if (e.key === "Escape") onClose();
    }
    window.addEventListener("keydown", onKey);
    return () => window.removeEventListener("keydown", onKey);
  }, [onClose]);

  return (
    <div className="lightbox" onClick={(e) => e.target === e.currentTarget && onClose()}>
      <button onClick={onClose}>✕</button>
      <img src={src} alt="Comic preview" />
    </div>
  );
}

export default function Comics() {
  const [query, setQuery] = useState("");
  const [previewSrc, setPreviewSrc] = useState<string | null>(null);

  // Search one combined text view so titles, tags, excerpts, and destinations are all discoverable.
  const filtered = useMemo(() => {
    const q = query.trim().toLowerCase();
    if (!q) return ISSUES;
    return ISSUES.filter((issue) =>
      [issue.title, issue.tags.join(" "), issue.excerpt, issue.href]
        .join(" ")
        .toLowerCase()
        .includes(q)
    );
  }, [query]);

  return (
    <main>
      {/* The issue list remains the primary content; the lightbox is mounted only for an active preview. */}
      <PageHero>
        <p>
          Cinematic snapshots from the Zombies: Complete Series — character arcs, boss origins,
          and glimpses into the AI corruption that started it all.
        </p>
      </PageHero>

      <ContentSection>
        <Toolbar query={query} setQuery={setQuery} />

        <div className="grid-2">
          {filtered.map((issue) => (
            <ComicCard key={issue.title} issue={issue} onPreview={(src) => setPreviewSrc(src)} />
          ))}
        </div>
      </ContentSection>

      {previewSrc && <Lightbox src={previewSrc} onClose={() => setPreviewSrc(null)} />}
    </main>
  );
}
