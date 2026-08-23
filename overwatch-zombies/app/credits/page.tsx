import React from "react";

type ActionLink = { href: string; label: string; primary?: boolean };

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

function CreditCard({ title, children, actions }: {
  title: string;
  children?: React.ReactNode;
  actions?: ActionLink[];
}) {
  return (
    <article className="card">
      <h2>{title}</h2>
      {children}
      {actions && actions.length > 0 && (
        <div className="card-actions">
          {actions.map((a) => (
            <a
              key={a.href}
              className={a.primary ? "btn btn--primary" : "btn"}
              href={a.href}
              target={a.href.startsWith("mailto:") ? undefined : "_blank"}
              rel={a.href.startsWith("mailto:") ? undefined : "noreferrer"}
            >
              {a.label}
            </a>
          ))}
        </div>
      )}
    </article>
  );
}

const communityPills = ["Bug hunters", "Balance feedback", "Speedrunners", "Casual squads"];

export default function Credits() {
  return (
    <main>
      <PageHero eyebrow="Project Acknowledgments" title="Credits">
        <p>People, tools, and communities that made Zombies: Desecration possible.</p>
      </PageHero>

      <ContentSection>
        <div className="grid-2">
          <CreditCard
            title="Core"
            actions={[
              { href: "mailto:trey123we13@gmail.com", label: "Contact", primary: true },
              { href: "https://github.com/WallerTrevor", label: "GitHub" },
              { href: "https://workshop.codes/ZBWIKI", label: "Wiki" },
            ]}
          >
            <p>
              <strong>Trevor W</strong> — Design, systems, scripting, balancing, web design/dev.
            </p>
          </CreditCard>

          <CreditCard title="Community & Playtesting">
            <p>Huge thanks to early players for stress-testing waves, reporting bugs, and suggesting tweaks.</p>
            <div className="meta">
              {communityPills.map((x) => (
                <span className="pill" key={x}>
                  {x}
                </span>
              ))}
            </div>
          </CreditCard>

          <CreditCard title="Music" actions={[{ href: "https://www.youtube.com/@rose.x9530", label: "YouTube" }]}> 
            <p>
              <strong>Rose.x</strong> — Composer and soundtrack contributor for Survivor’s Radio and in-comic tracks.
            </p>
          </CreditCard>

          <CreditCard title="Art" actions={[{ href: "https://vgen.co/chewie42", label: "Portfolio" }]}> 
            <p>
              <strong>HardcoreChewie</strong> — Comic panels, character art, and key images.
            </p>
          </CreditCard>

          <CreditCard title="Tools">
            <ul>
              <li>Overwatch Workshop & OverPy</li>
              <li>GitHub Pages (static hosting)</li>
              <li>HTML / CSS / JavaScript</li>
            </ul>
          </CreditCard>

          <CreditCard title="Media & UI">
            <ul>
              <li>Typefaces: Inter, Oxanium</li>
              <li>Palette: Overwatch-inspired orange/blue</li>
            </ul>
          </CreditCard>
        </div>
      </ContentSection>
    </main>
  );
}
