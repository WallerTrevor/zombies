const features = [
  ["intro.webm", "The Beginning of the Zombie Invasion", "Ramattra turns the omnics against Antarctic Peninsula."],
  ["zones.webm", "Three Zones", "Joined by a teleporter, each with its own champion to fight."],
  ["buyables.webm", "50+ Buy Spots", "Heroes, perks, doors, the bank and the credit card office."],
  ["followers.webm", "Followers", "Hire any hero to ride on your shoulder and shoot for you."],
  ["box.webm", "Mystery Box", "950 points for a random hero."],
  ["power.webm", "Connect the Power", "It unlocks the perks, and every zombie on the map uses its ultimate."],
];

export default function Home() {
  return (
    <main>
      <section className="hero">
        <div className="hero__bg" aria-hidden="true">
          <video autoPlay muted loop playsInline preload="metadata" poster="/assets/images/map-antarcticp.jpg">
            <source src="/assets/images/intro.webm" type="video/webm" />
            <source src="/assets/images/intro.mp4" type="video/mp4" />
          </video>
        </div>
        <div className="hero__content wrap">
          <div className="eyebrow"><span className="eyebrow__dot" />An Overwatch Workshop PvE mode</div>
          <h1>Zombies: The Full Series <span>v0.8.4</span></h1>
          <p>
            Ramattra has turned the omnics into zombies. Hold out against endless waves with up to three
            friends: open doors, buy heroes, Pack-a-Punch them and take on his champions.
          </p>
          <div className="hero__ctas">
            <a className="btn btn--primary" href="/mapcodes">Map Codes <span>↗</span></a>
            <a className="btn" href="https://forms.gle/TwTjHQBoodaD7mKC7" target="_blank" rel="noopener noreferrer">Take the Survey</a>
            <a className="btn btn--ghost" href="/wiki">Wiki</a>
          </div>
          <div className="hero__stats">
            <div><strong>1–4</strong><span>Players</span></div>
            <div><strong>50</strong><span>Heroes</span></div>
            <div><strong>3</strong><span>Champions</span></div>
          </div>
        </div>
      </section>

      <section className="section section--features">
        <div className="wrap">
          <div className="section__heading">
            <div>
              <h2>Features</h2>
            </div>
          </div>
          <div className="feature-grid">
            {features.map(([video, title, desc], i) => (
              <article className={"feature-card " + (i === 0 ? "feature-card--large" : "")} key={title}>
                <div className="feature-card__media">
                  <video autoPlay muted loop playsInline preload="metadata" poster="/assets/images/map-antarcticp.jpg">
                    <source src={"/assets/images/" + video} type="video/webm" />
                    <source src={"/assets/images/" + video.replace(".webm", ".mp4")} type="video/mp4" />
                  </video>
                  <div className="feature-card__shade" />
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
            <h2>Play it</h2>
            <p>Copy the code, make a custom game and bring up to three friends.</p>
          </div>
          <div className="hero__ctas">
            <a className="btn btn--primary" href="/mapcodes">Map Codes</a>
            <a className="btn btn--ghost" href="/wiki">Wiki</a>
          </div>
        </div>
      </section>
    </main>
  );
}
