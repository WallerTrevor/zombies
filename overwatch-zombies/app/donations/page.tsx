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

function DonationCard() {
  return (
    <article className="card">
      <h2>Support the project</h2>
      <p>
        The original Wiki FAQ states that donations do not provide gameplay advantages or exclusive
        items.
      </p>
    </article>
  );
}

export default function Donations() {
  return (
    <main>
      <PageHero eyebrow="Support the Project" title="Donations">
        <p>Support continued development. Donations do not provide gameplay advantages or exclusive items.</p>
      </PageHero>

      <ContentSection>
        <DonationCard />
      </ContentSection>
    </main>
  );
}
