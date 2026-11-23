import React from "react";

function PageHero({ eyebrow, title, children }: { eyebrow: string; title: string; children?: React.ReactNode }) {
  return (
    <section className="page-hero">
      <div className="wrap page-hero__content">
        <div className="eyebrow">{eyebrow}</div>
        <h1>{title}</h1>
        {children}
      </div>
    </section>
  );
}

function ContentSection({ children }: { children: React.ReactNode }) {
  return (
    <section className="content-section">
      <div className="wrap">{children}</div>
    </section>
  );
}

function Card({ children }: { children: React.ReactNode }) {
  return <article className="card">{children}</article>;
}

function RoadmapCard({ title, children }: { title: string; children?: React.ReactNode }) {
  return (
    <article className="card">
      <h3>{title}</h3>
      {children}
    </article>
  );
}

export default function About() {
  return (
    <main>
      <PageHero eyebrow="About the Creator" title="Whats good, I’m DropThatBeat">
        <p>
          Solo designer/developer behind the Overwatch Workshop mode Zombies.
        </p>
      </PageHero>

      <ContentSection>
        <div className="grid-2">
          <Card>
            <h2>What I Do</h2>
            <ul>
              <li>Systems & Mode Design</li>
              <li>Workshop Scripting</li>
              <li>Web Design & Development</li>
              <li>Performance & Polish</li>
            </ul>
          </Card>

          <Card>
            <h2>The Project</h2>
            <p>
              "About Me "
            </p>
          </Card>
        </div>
      </ContentSection>

      <ContentSection>
        <h2>Project Roadmap</h2>

        <div className="grid-2" style={{ marginTop: 20 }}>
          <RoadmapCard title="Phase 1 — Core Loop">
            <p>Shared first playtest code.</p>
          </RoadmapCard>

          <RoadmapCard title="Phase 2 — Polish & Website">
            <p></p>
          </RoadmapCard>

          <RoadmapCard title="Phase 3 — Multi-Map Content">
            <p>Unique bosses per map, teleporter/doors, performance tuning, accessibility passes.</p>
          </RoadmapCard>

          <RoadmapCard title="Phase 4 — Career Focus">
            <p>
              Packaging the project
            </p>
          </RoadmapCard>
        </div>
      </ContentSection>

      <ContentSection>
        <Card>
          <h2>Get in Touch</h2>

          <p>
            Interested in the project or my web design work? I’m open to feedback, collaboration,
            and roles that value craft and iteration.
          </p>

          <div className="card-actions">
            <a className="btn btn--primary" href="mailto:you@example.com"> 
              Email Me
            </a>
            <a className="btn" href="https://github.com/WallerTrevor" target="_blank" rel="noreferrer">GitHub</a>
            <a className="btn" href="https://workshop.codes/ZBWIKI" target="_blank" rel="noreferrer">Wiki</a>
          </div>
        </Card>
      </ContentSection>
    </main>
  );
}
