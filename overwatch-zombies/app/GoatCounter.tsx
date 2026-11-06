"use client";

import { useEffect, useRef, useState } from "react";
import { usePathname } from "next/navigation";
import Script from "next/script";

export default function GoatCounter() {
  const pathname = usePathname();
  const [scriptReady, setScriptReady] = useState(false);
  const lastCountedPath = useRef<string | null>(null);

  useEffect(() => {
    if (!scriptReady || lastCountedPath.current === pathname) return;

    if (!window.goatcounter) {
      console.error("GoatCounter loaded without initializing its count API.");
      return;
    }

    window.goatcounter.count({ path: pathname });
    lastCountedPath.current = pathname;
  }, [pathname, scriptReady]);

  return (
    <Script
      src="https://gc.zgo.at/count.js"
      data-goatcounter="https://dropthatbeat.goatcounter.com/count"
      data-goatcounter-settings='{"no_onload":true}'
      strategy="afterInteractive"
      onLoad={() => setScriptReady(true)}
      onError={() => console.error("Failed to load the GoatCounter script.")}
    />
  );
}
