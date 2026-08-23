const features = [
  ["intro.webm", "The Beginning of the Zombie Invasion", "A cinematic introduction to the corrupted world."],
  ["zones.webm", "Explore Three Unique Zones", "Learn routes, unlock new areas, and survive escalating waves."],
  ["buyables.webm", "50+ Buyable Locations", "Spend points intelligently and build safer routes."],
  ["followers.webm", "Unique Hero Follower System", "Heroes, followers, and the Mystery Box change every run."],
  ["box.webm", "Mystery Box", "Switch heroes and hunt for rare Wonder Weapons."],
  ["power.webm", "Connect the Power", "Every shortcut has a price. Be ready when the pressure spikes."],
];

export default function Home() {
  return (
    <main>
      <section className="hero">
        <div className="hero__bg" aria-hidden="true">
          <video autoPlay muted loop playsInline preload="metadata" poster="/assets/images/map-kingsrow.jpg">
            <source src="/assets/images/intro.webm" type="video/webm" />
            <source src="/assets/images/intro.mp4" type="video/mp4" />
          </video>
        </div>
        <div className="hero__content wrap">
          <div className="eyebrow"><span className="eyebrow__dot" />The Unoffical Overwatch Workshop PvE Missions</div>
          <h1>Zombies: The Full Series <span>v0.8.4</span></h1>
          <p>
            Ramattra’s corrupted AI unleashes zomnics across every map.
            Survive, buy new areas, roll the Mystery Box, and outsmart the trials.
          </p>
          <div className="hero__ctas">
            <a className="btn btn--primary" href="/mapcodes">Map Codes <span>↗</span></a>
            <a className="btn" href="https://forms.gle/TwTjHQBoodaD7mKC7" target="_blank" rel="noopener noreferrer">Take the Survey</a>
            <a className="btn btn--ghost" href="/wiki">Main Wiki</a>
          </div>
          <div className="hero__stats">
            <div><strong>1–4</strong><span>Co-op Players</span></div>
            <div><strong>All</strong><span>Playable Heroes</span></div>
            <div><strong>Infinite</strong><span>Ways to Build a Run</span></div>
          </div>
        </div>
      </section>

      <section className="section section--features">
        <div className="wrap">
          <div className="section__heading">
            <div>
              <div className="eyebrow">A quick glance</div>
              <h2>Features</h2>
            </div>
            <span className="section__number">02</span>
          </div>
          <div className="feature-grid">
            {features.map(([video, title, desc], i) => (
              <article className={"feature-card " + (i === 0 ? "feature-card--large" : "")} key={title}>
                <div className="feature-card__media">
                  <video autoPlay muted loop playsInline preload="metadata">
                    <source src={"/assets/images/" + video} type="video/webm" />
                  </video>
                  <div className="feature-card__shade" />
                  <div className="feature-card__index">{String(i + 1).padStart(2, "0")}</div>
                </div>
                <div className="feature-card__body">
                  <h3>{title}</h3>
                  <p>{desc}</p>
                </div>
              </article>
            ))}
          </div>
        </div>
      </section>

      <section className="cta-section">
        <div className="wrap cta">
          <div>
            <div className="eyebrow">Ready?</div>
            <h2>Build your run.</h2>
            <p>Check the Wiki, grab a map code, and bring your squad.</p>
          </div>
          <div className="hero__ctas">
            <a className="btn btn--primary" href="/mapcodes">Browse Map Codes</a>
            <a className="btn btn--ghost" href="/wiki">Explore the Wiki</a>
          </div>
        </div>
      </section>
    </main>
  );
}
