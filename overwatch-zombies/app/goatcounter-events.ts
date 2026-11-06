declare global {
  interface Window {
    goatcounter?: {
      count: (options: { path: string; event?: true }) => void;
    };
  }
}

export function trackGoatCounterEvent(path: string) {
  if (!window.goatcounter) {
    console.error("Cannot track GoatCounter event because the counter is not loaded.");
    return;
  }

  window.goatcounter.count({ path, event: true });
}
